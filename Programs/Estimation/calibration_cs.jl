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
    γ::Float64 = 1.5 #Risk aversion
    r_ann::Float64 = 0.04
    g_bar::Float64 = 0.00451
    ν::Float64 = 0.72 # Frisch elasticity

    # Normalizations
    Y::Float64 = 1
    p_i::Float64 = 1
    N::Float64 = 0.30
    Ψ_j::Float64 = 0.81

    # Standard targets
    I_Y::Float64 = 0.20
    K_Y::Float64 = 11 #quarterly
    labor_share::Float64 = 0.67

    # Fixed cost share of output
    ν_R::Float64 = 0.20

    # Targets specific to this economy
    ϕ::Float64 = 0.32
    η::Float64 = 0.20

    # Inverse of MRS of labor supply in each sector 
    θ::Float64 = 1/0.1735
end

function ϕ_fun(η, m=0.286)
    return (η+1)*m/(1+η*m)
end

#BRS
@show ϕ_fun(0.2, 0.286)

fig, ax = subplots()
η_space = 0.0:0.1:10.0
ϕ_space = ϕ_fun.(η_space, 0.286)
ax.plot(η_space, ϕ_space, lw=2, alpha=0.6, label="(ϕ,η) Locus consistent with m=0.286")
ax.set_xlabel("η")
ax.set_ylabel("ϕ")
ax.legend(fontsize=11)
display(fig)
PyPlot.savefig("shopping_curve.pdf")

function calibrate(targets)
    @unpack γ, r_ann, g_bar, ν, Y, p_i, N, Ψ_j, I_Y, K_Y, labor_share, ϕ, η, θ = targets

    # Discount factor
    #β*(1+g_bar)^(-γ) = 1/(1+r)
    G = exp(g_bar)
    r = (1+r_ann)^(1/4) - 1.0
    β = (1/(1+r))*G^(γ)
    # upper bound on γ
    #γ = log(1+r)/log(G)
    # Capital accumulation
    # (1+g_bar)K' = (1-δ)K + I 
    # δ = p_I I_Y/(p_I K_Y) - g_bar
    #δ = I_Y/K_Y - g_bar
    # discrete time
    δ = I_Y/K_Y +1 - G
    σ_b = r + δ
    ν_R = 0.2

    # Labor share 
    α_N = (1-ϕ)*labor_share/(1+ν_R)
    α_K = (r+δ)*K_Y/(1+ν_R)
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

    D = ϕ^(η/(1+η))
    D_c = (1-I_Y)*D
    D_i = I_Y*D
    A_c = Ψ_j/D_c^(ϕ)
    A_i = Ψ_j/D_i^(ϕ)


    # Mean TFP 
    # N_i/N_c = I_Y/(1-I_Y)
    # K_i/K_c = I_Y/(1-I_Y) 
    I = I_Y*Y
    C = Y - I
    K = K_Y*Y*G # transformation of variables
    K_i = I_Y*K
    K_c = (1-I_Y)*K
    N_i = I_Y*N 
    N_c = (1-I_Y)*N

    # Solve for fixed cost parameter
    ν_c= ν_R*C/(Ψ_j)
    ν_i = ν_R*I/(Ψ_j)

    Q = p_i/(1-ϕ);

    # TFP parameter
    #z_c = (1-I_Y)/(Ψ_j*G^(-α_K)*K_c^(α_K)*N_c^(α_N))
    #z_i = (I_Y)/(Ψ_j*G^(-α_K)*K_i^(α_K)*N_i^(α_N))
    z_c = ((1-I_Y)/Ψ_j + ν_c)/(G^(-α_K)*K_c^(α_K)*N_c^(α_N))
    z_i = (I_Y/Ψ_j+ ν_i)/(G^(-α_K)*K_i^(α_K)*N_i^(α_N))
    #
    # Weight on labor aggregator
    ω = N_c/N
    # Labor composite 
    N_a = (ω^(-θ)*N_c^(1+θ)+(1-ω)^(-θ)*N_i^(1+θ))^(1/(1+θ))
    # Implied wage
    #W = α_N*(I/N_i)*p_i/(1-ϕ)*(1+ν_R)
    W = labor_share*Y/N
    # Level parameter on labor supply
    θ_n = (1-ϕ)*W/(N_a^(1/ν))

    return (γ=γ, r=r, β=β, δ=δ, α_N=α_N, α_K=α_K, A_c=A_c, A_i=A_i, z_c=z_c, z_i=z_i, σ_b, ω, θ_n,
    C=C, I=I, Y=Y, K=K, N=N, N_c=N_c, N_i=N_i, W=W, N_a, D=D, D_c=D_c, D_i=D_i, Q=Q, ν_c=ν_c, ν_i=ν_i)
end

# Back out max on γ

targets = Targets(g_bar = 0.00451, γ=2.0, r_ann=0.04)
@show cal = calibrate(targets)
@unpack W, N, C, I, Y, r, ν_c, ν_i = cal
@unpack g_bar, labor_share, ν_R, Ψ_j, ν_R = targets
γ_max = log(1+r)/g_bar

# Tests 
@show W*N/Y - labor_share
@show Ψ_j*ν_c/C - ν_R
@show Ψ_j*ν_i/I - ν_R
#targets_ng = Targets(g_bar = 0.0, γ=1.0)
# cal_ng = calibrate(targets_ng)

# To be modified #
function table(cal, targets)
    @unpack γ, β, δ, α_N, α_K, A_c, A_i, z_c, z_i, σ_b, ω, θ_n, C, I, Y, K, N, N_c, N_i, ν_c, ν_i = cal
    @unpack γ, r_ann, g_bar, ν, Y, p_i, N, Ψ_j, I_Y, K_Y, labor_share, ν_R, θ = targets
    r = (1-β)/β
  
    t = PlotlyJS.plot(
        PlotlyJS.table(
        header_values=["Targets", "Value", "Parameter", "Calibration"],
        cells_values = [
        # Targets
                       [
        # Parameters set exogenously
        "Risk aversion",
        "Real interest rate",
        "Average growth rate",
        "Frisch elasticity",
        # Normalizations
        "Steady-state output",
        "Relative price of investment",
        "Fraction of time spent working",
        "Capacity utilization of consumption sector",
        "Capacity utilization of investment sector",
        " Capital utilization rate",
        # Third group: standard targets
        "Investment share of output",
        "Physical capital to output ratio",
        "Labor share of output",
        "Labor share in consumption ",
        "Fixed costs in consumption",
        "Fixed costs in investment",
                       ],
        # Values
        round.([γ, r_ann, exp(g_bar*4), ν, Y, p_i, N, Ψ_j, Ψ_j, 1, I_Y, K_Y/4, labor_share, ω, ν_R, ν_R], digits=2),
        # Parameter
        [:γ, :β, :g_bar, :ν, :z_c, :z_i, :θ_n, :A_c, :A_i, :σ_b, :δ, :α_k, :α_n, :ω, :ν_c, :ν_i], 
        # Calibration
        round.([γ, β, g_bar, ν, z_c, z_i, θ_n, A_c, A_i, σ_b, δ, α_K, α_N, ω, ν_c, ν_i], digits=3)
        ]
        )
    )
    return t
end

# Para = @with_kw (ϕ=0.1, A=0.8, α_2 = 0.0, α_1=0.7, β=0.99, δ_K = 0.025, ρ=2.0,
#          α_K=0.3, σ=1.0, η=1.0, ψ=1.0, Y=1.0, L=1.0, qC=1.0, qI=1.0)

#targets = Targets()
#para = calibrate(targets)
#ss = steady_state(para)
tab = table(cal, targets)
