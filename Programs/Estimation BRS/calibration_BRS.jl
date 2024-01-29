using LaTeXStrings
using Parameters, CSV, StatsBase, Statistics, Random, QuantEcon, ArgParse
using PlotlyJS
using Printf
using DataFrames
using PrettyPrinting


@with_kw mutable struct Targets
    # Parameters set exogenously
    γ::Float64 = 2.0 #Risk aversion
    r_ann::Float64 = 0.04
    g_bar::Float64 = 0.0074
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

    # Targets specific to this economy
    ϕ::Float64 = 0.32
    η::Float64 = 0.20
end


function calibrate(targets)
@unpack γ, r_ann, g_bar, ν, Y, p_i, N, Ψ_j, I_Y, K_Y, labor_share, ϕ, η = targets

# Discount factor
#β*(1+g_bar)^(-γ) = 1/(1+r)
G = exp(g_bar)
r = (1+r_ann)^(1/4) - 1.0
β = (1/(1+r))*G^(γ)
# Capital accumulation
# (1+g_bar)K' = (1-δ)K + I 
# δ = p_I I_Y/(p_I K_Y) - g_bar
#δ = I_Y/K_Y - g_bar
# discrete time
δ = I_Y/K_Y +1 - G

# Labor share 
α_N = (1-ϕ)*labor_share
α_K = (r+δ)*K_Y
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

Q = p_i/(1-ϕ);

z_c = (1-I_Y)/(Ψ_j*G^(-α_K)*K_c^(α_K)*N_c^(α_N))
z_i = (I_Y)/(Ψ_j*G^(-α_K)*K_i^(α_K)*N_i^(α_N))

return (γ=γ, β=β, δ=δ, α_N=α_N, α_K=α_K, A_c=A_c, A_i=A_i, z_c=z_c, z_i=z_i, C=C, I=I, Y=Y, K=K, N=N, N_c=N_c, N_i=N_i,
    D=D, D_c=D_c, D_i=D_i, Q=Q)
end

targets = Targets(g_bar = 0.0074, γ=1.0)
cal = calibrate(targets)

targets_ng = Targets(g_bar = 0.0, γ=1.0)
cal_ng = calibrate(targets_ng)

# To be modified #
function table(para, targets)
    @unpack A, β, ϕ, ρ, δ_K, α_1, α_2, α, ZC, ZI, χ, κ, ζ, σ_b, σ, ψ, Γ, Ψ, ν = para
    @unpack r_annual, δ_share, ϕ_I, wL_Y, occupancy_rate = targets
    r = (1-β)/β
  
    t = PlotlyJS.plot(
        PlotlyJS.table(
        header_values=["Parameter", "Symbol", "Value", "Moment", "Value"],
        cells_values = [
        ["Depreciation mean of utilization",
            "Investment production function units",
            "Consumption production function units",
            "Weight of labor in utility",
            "Weight of search in utility",
            "Relative disutility of investment shopping",
            "Discount factor",
            "Depreciation rate",
            "Fixed cost",
            "Share of capital",
            "Coefficient on variable labor",
            "Mean efficiency of matching",
             "Love of variety",
             " Elasticity parameter in matching"],

        [:σ_b :ZI :ZC :χ :κ :ζ :β :δ_K :ν :α :α_2 :A :ρ :ϕ],
        round.([σ_b, ZI, ZC, χ, κ, ζ, β, δ_K, ν, α, α_2, A, ρ, ϕ], digits=3),
        ["SS Utilization",
        "SS output",
        "Sum of sectoral prices",
        "SS labor",
        "Consumption search tightness",
        "Investment search tightness",
        "Interest rate",
         "Depreciation share",
        "Investment share",
        "Labor share",
        "Share of variable labor",
        "Occupancy rate",
         "Gross markup Γ",
         "Elasticity Ψ"
        ],
        [1.0, 1.0, 1.0, 1.0, 1.0, 1.0, r_annual, δ_share, ϕ_I, wL_Y, 0.5, occupancy_rate, Γ, Ψ]
        ]
        ))
    return t
end

# Para = @with_kw (ϕ=0.1, A=0.8, α_2 = 0.0, α_1=0.7, β=0.99, δ_K = 0.025, ρ=2.0,
#          α_K=0.3, σ=1.0, η=1.0, ψ=1.0, Y=1.0, L=1.0, qC=1.0, qI=1.0)

targets = Targets()
para = calibrate(targets)
#ss = steady_state(para)
tab = table(para, targets)