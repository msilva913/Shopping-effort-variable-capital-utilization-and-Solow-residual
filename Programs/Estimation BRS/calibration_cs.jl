using LaTeXStrings
using Parameters, CSV, StatsBase, Statistics, Random, QuantEcon, ArgParse
using PyPlot
using PlotlyJS
using Printf
using DataFrames
using PrettyPrinting
# set directory to that of current file
cd(@__DIR__)

@with_kw mutable struct Targets
    # Parameters set exogenously
    β::Float64 = 0.99
    g_bar::Float64 = 0.00451
    μ::Float64 = 1.15

    # Parameters to be estimated
    ζ::Float64 = 0.72 # Frisch elasticity
    σ::Float64 = 1.5 #Risk aversion
    ϕ::Float64 = 0.32 #elasticity of matching function
    η::Float64 = 0.20
    ν_R::Float64 = 0.20 # Fixed cost share
    ha::Float64 = 0.5 #habit persistence

    # Normalizations
    Y::Float64 = 1
    p_i::Float64 = 1
    N::Float64 = 0.30
    Ψ_j::Float64 = 0.81

    # Standard targets
    I_Y::Float64 = 0.20
    K_Y::Float64 = 11 #quarterly
    S_c::Float64 = 0.65 # ratio of services to consumption
    labor_share::Float64 = 0.67

    # Fixed cost share of output-> assume it holds in each subsector
   

    # Targets specific to this economy

end



#BRS
function calibrate(targets)
    @unpack β, g_bar, μ, ζ, σ, ϕ, η, ν_R, ha, Y, p_i, N, Ψ_j, I_Y, K_Y, S_c, labor_share = targets

    # Discount factor
    #β*(1+g_bar)^(-γ) = 1/(1+r)
    G = exp(g_bar)
    r = G^σ/β - 1.0
    #β = (1/(1+r))*G^(γ)
    # upper bound on γ
    #γ = log(1+r)/log(G)
    # Capital accumulation
    # (1+g_bar)K' = (1-δ)K + I 
    # δ = p_I I_Y/(p_I K_Y) - g_bar
    #δ = I_Y/K_Y - g_bar
    # discrete time
    δ = I_Y/K_Y +1 - G
    σ_b = r + δ

    # Labor share 
    α_n = (1-ϕ)*labor_share/(1+ν_R)
    α_k = (r+δ)*K_Y/(1+ν_R)

    K_SR_disc = α_k-(1-labor_share)
    N_SR_disc = α_n - labor_share
    @assert r+δ ≈ G^(σ)/β + I_Y/K_Y - G
    # Capital share 
    # R_c=R_i=R in steady state 
    #R_pi = (1-β*(1+g_bar)^(-γ)*(1-δ))/(β*(1+g_bar)^(-γ))
    #R_pi = r + delta
    #α_K = R_pi *K_Y

    # Search efficiency A_c and A_i
    #Ψ_{Tj}(D_j) = A_jD_j^{ϕ}

    #HH factor
    # D_c/D_i = C/(p_I*I)
    # D_c = (1-I_Y)D 
    # HH search FOC and GHH imply
    # ϕ*C/D_c = D^(1/η) ⇒
    # (1-I_Y)D^(1+1/η) = ϕ*C = ϕ(1-I_Y)

    # Weight of services in consumption aggregator
    ω_sc = S_c

    # Shopping effort 
    D = (ϕ*Y)^(η/(1+η)) 
    D_c = (1-I_Y)*D
    D_sc = ω_sc*D_c
    D_mc = (1-ω_sc)*D_c
    D_i = I_Y*D

    # Technology coefficients of matching function ⇒ Ψ_j target
    A_mc = Ψ_j/D_mc^(ϕ)
    A_sc = Ψ_j/D_sc^ϕ
    A_i = Ψ_j/D_i^(ϕ)

    # Mean TFP 
    # N_i/N_c = I_Y/(1-I_Y)
    # K_i/K_c = I_Y/(1-I_Y) 

    # Sectoral output 
    I = I_Y*Y
    C = Y - I
    Y_mc = (1-ω_sc)*C
    Y_sc = ω_sc*C

    #C_agg = ((1-ω_sc)^(1-ρ_c)*Y_mc^ρ_c + ω_sc^(1-ρ_c)*Y_sc^ρ_c)^(1/ρ_c)
    #@assert C ≈ C_agg

    # Solve for price using price index 
    # 1 = (ω_mc*p_mc^(-ρ_c/(1-ρ_c)) +ω_sc*p_sc^(-ρ_c/(1-ρ_c))
    # This implies p_mc = p_sc = 1
    p_mc = p_sc = 1

    # C = p_mc*Y_mc + p_sc*Y_sc

    K = K_Y*Y*G # transformation of variables

    # Sectoral capital stocks
    K_i = I_Y*K
    K_c = (1-I_Y)*K
    K_mc = (1-ω_sc)*K_c
    K_sc = ω_sc*K_c

    # Sectoral labor
    N_i = I_Y*N 
    N_c = (1-I_Y)*N
    N_mc = (1-ω_sc)*N_c 
    N_sc = ω_sc*N_c

    # Sectoral fixed costs
    ν_mc= ν_R*Y_mc/(Ψ_j)
    ν_sc = ν_R*Y_sc/Ψ_j
    ν_i = ν_R*I/Ψ_j

    Q = p_i/(1-ϕ);

    # TFP parameter
    z_mc = (Y_mc/Ψ_j + ν_mc)/(G^(-α_k)*K_mc^(α_k)*N_mc^(α_n))
    z_sc = (Y_sc/Ψ_j +ν_sc)/(G^(-α_k)*K_sc^(α_k)*N_sc^(α_n))
    z_i = (I/Ψ_j+ ν_i)/(G^(-α_k)*K_i^(α_k)*N_i^(α_n))
    #
    # Weight on labor aggregator
    ω = N_c/N
    # Labor composite: imperfect subs. only between c and i 
    #N_a = (ω^(-θ)*N_c^(1+θ)+(1-ω)^(-θ)*N_i^(1+θ))^(1/(1+θ))
    # Implied wage
    #W = α_N*(I/N_i)*p_i/(1-ϕ)*(1+ν_R)
    W = labor_share*Y/N

    # Level parameter on labor supply (GHH)
    θ_n = (1-ϕ)*W/(N^(1/ζ)*μ)



    # Profits 
    #Π = C + p_i*I -K_c*R_c - K_i*R_i - n*W
    Π = C + p_i*I - N*W*(α_n+α_k)/α_n
    Π_Y = 1 - labor_share*(1+α_k/α_n)

    return (σ=σ, r=r, β=β, δ=δ, α_n=α_n, α_k=α_k, 
    A_mc=A_mc, A_sc=A_sc, A_i=A_i, 
    z_mc=z_mc, z_sc=z_sc, z_i=z_i,
 ω_sc=ω_sc,
    σ_b=σ_b, ω=ω, θ_n=θ_n,
    Y_mc=Y_mc, Y_sc=Y_sc, C=C, I=I, Y=Y, 
    p_i=p_i, p_mc=p_mc, p_sc=p_sc,
    K_mc=K_mc, K_sc=K_sc, K_c=K_c, K_i=K_i, K=K,
    N_mc=N_mc, N_sc=N_sc, N_c=N_c, N_i=N_i, N=N,
    W=W, 
    D_mc=D_mc, D_sc=D_sc, D_c=D_c, D_i=D_i, D=D,
    Q=Q, 
    ν_mc=ν_mc, ν_sc=ν_sc, ν_i=ν_i, 
    Π=Π, Π_Y=Π_Y)
end

steady_state = function(par)
    @unpack Y, C, I, K_mc, K_sc, K_c, K_i, N, N_c, N_i, z_mc, z_sc, z_i, W, D, D_mc, D_sc, D_i, Q = par
    return (Y_mc=Y_mc, Y_sc=Y_sc, C=C, I=I, K=K, K_mc=K_mc, K_sc=K_sc, K_i=K_i, 
    N_c=N_c, N_i=N_i, N=N,
    z_mc=z_mc, z_sc=z_sc, z_i=z_i, 
    W=W, 
    D_mc=D_mc, D_sc=D_sc, D_i=D_i, D=D,
    Q=Q)
end


function m_func(ϕ, η)
    return ϕ/(η*(1-ϕ)+1)
end
m = 0.15/0.524
η_func(m, ϕ) = (ϕ-m)/(m*(1-ϕ))
@show η_func(m, 0.3249)

fig, ax = plt.subplots()
ϕ_vals = 0.0:0.1:0.99
η_vals = η_func.(m, ϕ_vals)

ϕ_fun(η, m=m) = (η+1)*m/(1+η*m)

@show m_func(ϕ, η)
#BRS
@show ϕ_fun(0.20, m)
@show ϕ_fun(2.0, 0.286)

fig, ax = plt.subplots()
ax.plot(ϕ_vals, η_vals, label="Values consistent with price dispersion")
plt.show()
display(fig)

# To be modified #
function table(cal, targets)
    @unpack σ, β, δ, α_n, α_k, A_mc, A_sc, A_i, z_mc, z_sc, z_i, σ_b, ω, θ_n, C, I, Y, K, N, N_c, N_i, p_sc = cal
    @unpack g_bar, μ, ζ, Y, p_i, N, Ψ_j, I_Y, K_Y, labor_share, ν_R = targets
    r = (1-β)/β
  
     t=   PlotlyJS.table(
        header_values=["Targets", "Value", "Parameter", "Calibration"],
        cells_values = [
        # Targets
                       [
        # Parameters set exogenously
        "Discount factor",
        "Average growth rate",
        "Gross wage markup",
        "Share of labor hours in consumption",

        # Estimated parameters relevant for dependent parameters
        "Risk aversion",
        "Frisch elasticity",
        "Elasticity of matching function",
        "Elasticity of shopping effort cost",
        "Fixed cost share",
        "Habit persistence", 

        # Normalizations
        "Steady-state output",
        "Relative price of services",
        "Relative price of investment",
        "Fraction of time spent working",
        "Capacity utilization of non-durables sector",
        "Capacity utilization of services sector",
        "Capacity utilization of investment sector",
        " Capital utilization rate",

        # Third group: standard targets
        "Investment share of output",
        "Physical capital to output ratio",
        "Labor share of income"
                       ],
        # Values
        round.([β, exp(g_bar*4), μ, ω, σ, ζ, ϕ, η, ν_R, ha, Y, p_sc, p_i, N, Ψ_j, Ψ_j, Ψ_j, 1, I_Y, K_Y/4, labor_share], sigdigits=2),
        # Parameter
        [:β, :g_bar, :μ, :ω, :σ, :ζ, :ϕ, :η, :ν_R, :ha, :z_mc, :z_sc, :z_i, :θ_n, :A_mc, :A_sc, :A_i, :σ_b, :δ, :α_k, :α_n], 
        # Calibration
        round.([β, g_bar, μ, ω, σ, ζ, ϕ, η, ν_R, ha, z_mc, z_sc, z_i, θ_n, A_mc, A_sc, A_i, σ_b, δ, α_k, α_n], sigdigits=3)
        ]
        )
        p = PlotlyJS.plot(t)
    return p
end

# Para = @with_kw (ϕ=0.1, A=0.8, α_2 = 0.0, α_1=0.7, β=0.99, δ_K = 0.025, ρ=2.0,
#          α_K=0.3, σ=1.0, η=1.0, ψ=1.0, Y=1.0, L=1.0, qC=1.0, qI=1.0)

# Load posterior mode
using MAT
#posterior_mode = matread("posterior_mode.mat")
#posterior_mode = posterior_mode["posterior_mode"]
posterior_mean = matread("posterior_mean.mat")
posterior_mean = posterior_mean["posterior_mean"]

σ = posterior_mean["sigma"]
ζ = posterior_mean["nu"]
ϕ = posterior_mean["phi"]
η = posterior_mean["eta"]
ν_R = posterior_mean["nu_R"]
ha = posterior_mean["ha"]

targets = Targets(σ=σ, ζ=ζ, ϕ=ϕ, η=η, ν_R=ν_R, ha=ha)
para = calibrate(targets)
#ss = steady_state(para)
tab = table(para, targets)


@unpack W, N, Y_mc, Y_sc, C, I, Y, r, ν_mc, ν_sc, ν_i, N_c, N_i, Π, Π_Y, δ, K, K_mc, K_sc, K_i, ω_sc, D_sc, D_i = para
@unpack g_bar, labor_share, ν_R, Ψ_j, ν_R, p_i, K_Y, I_Y, ϕ, S_c = targets
#γ_max = log(1+r)/g_bar

# Tests 
@assert Y_sc/C ≈ S_c ≈ ω_sc
@show W*N/Y - labor_share
@show Ψ_j*ν_mc/Y_mc - ν_R
@show Ψ_j ν_sc/Y_sc - ν_R
@show Ψ_j*ν_i/I - ν_R
@show D_sc/D_i - S_c*(1-I_Y)/I_Y
@show K - K_mc - K_sc - K_i
@show Π -  ( 1 - labor_share - (r+δ)*K_Y/(1-ϕ))
@show Π - Π_Y
#targets_ng = Targets(g_bar = 0.0, γ=1.0)
# cal_ng = calibrate(targets_ng)


function calibrate_rbc(targets)
    @unpack γ, r_ann, g_bar, ν, Y, p_i, N, Ψ_j, I_Y, K_Y, labor_share, ϕ, η, ν_R = targets

    # Discount factor
    #β*(1+g_bar)^(-γ) = 1/(1+r)
    G = exp(g_bar)
    r = (1+r_ann)^(1/4) - 1.0
    β = (1/(1+r))*G^(γ)
    # upper bound on γ
    δ = I_Y/K_Y +1 - G
    σ_b = r + δ

    # Labor share 
    α_n = labor_share/(1+ν_R)
    α_k = (r+δ)*K_Y/(1+ν_R)
   
    I = I_Y*Y
    C = Y - I
    K = K_Y*Y*G # transformation of variables
    K_i = I_Y*K
    K_c = (1-I_Y)*K
    N_i = I_Y*N 
    N_c = (1-I_Y)*N

    # Solve for fixed cost parameter
    ν_c= ν_R*C
    ν_i = ν_R*I

    Q = p_i

    # TFP parameter
    #z_c = (1-I_Y)/(Ψ_j*G^(-α_K)*K_c^(α_K)*N_c^(α_N))
    #z_i = (I_Y)/(Ψ_j*G^(-α_K)*K_i^(α_K)*N_i^(α_N))
    z_c = ((1-I_Y) + ν_c)/(G^(-α_k)*K_c^(α_k)*N_c^(α_n))
    z_i = (I_Y+ ν_i)/(G^(-α_k)*K_i^(α_k)*N_i^(α_n))
    #
    # Weight on labor aggregator
    ω = N_c/N
    # Labor composite 
    #N_a = (ω^(-θ)*N_c^(1+θ)+(1-ω)^(-θ)*N_i^(1+θ))^(1/(1+θ))
    #@assert abs(N_a - N) < 1e-12
    # Implied wage
    #W = α_N*(I/N_i)*p_i/(1-ϕ)*(1+ν_R)
    W = labor_share*Y/N
    # Level parameter on labor supply
    θ_n = (1-ϕ)*W/(N_a^(1/ν))

    # Profits 
    #Π = C + p_i*I -K_c*R_c - K_i*R_i - n*W
    Π = C + p_i*I - N*W*(α_n+α_k)/α_n
    Π_Y = 1 - labor_share*(1+α_k/α_n)
    return (γ=γ, r=r, β=β, δ=δ, α_n=α_n, α_k=α_k, z_c=z_c, z_i=z_i, σ_b, ω, θ_n,
    C=C, I=I, Y=Y, K=K, K_c=K_c, K_i=K_i, N=N, N_c=N_c, N_i=N_i, W=W, N_a, 
    Q=Q, ν_c=ν_c, ν_i=ν_i, Π=Π, Π_Y=Π_Y)
end
@show cal_rbc = calibrate_rbc(targets)
