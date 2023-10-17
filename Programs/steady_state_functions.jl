
using LaTeXStrings
using Parameters, CSV, StatsBase, Statistics, Random, QuantEcon, ArgParse
using Roots, Optim, NLsolve
using PlotlyJS
using Printf
using DataFrames
using PrettyPrinting


@with_kw mutable struct Targets
    r_annual::Float64 = 0.03     #associated with β
    #δ_share::Float64 = 0.173    #inapplicable unless there is DRS, fixed costs, etc.
    I_Y::Float64 = 0.22          #associated with δ
    wL_Y::Float64 = 0.667        #associated with α_L
    occupancy_rate::Float64 = 0.78 #assoiated with A
    markup::Float64 = 1.3        # Combined ρ(1-ϕ)

    # Parameters determining units 
    Y_ss::Float64 = 1            # associated with Z_I
    QC_ss::Float64 = 1           # associated with κ
    QI_ss::Float64 = 1           # associated with ζ
    L_ss::Float64 =1             # associated with χ
    pc_ss::Float64 =1            # associated with Z_C

end

function calibrate(targets, Γ=1.3, ψ=0.5, ξ=1/0.72, σ=1.5)
    @unpack r_annual, I_Y, wL_Y, occupancy_rate, Y_ss, QC_ss, QI_ss, L_ss, pc_ss = targets
    A = occupancy_rate 
    r= (1+r_annual)^(1/4) - 1
    β = 1/(1+r)

    # Recover ϕ and ρ from Γ and Ψ
    ψ_inv = ψ^(-1)
    a = 1
    b = ψ_inv - 2 - Γ
    c = -Γ*(ψ_inv - 1)
    ρ = (-b +sqrt(b^2-4*a*c))/*(2*a)
    ϕ = 1 - Γ/ρ
    # Obtain α_L using labor share wL_Y and I_Y
    # wL_Y = α_L/(ρ(1-ϕ)) + (ρ-1)I_Y 
    α_L = ρ*(1-ϕ)*(wL_Y -(ρ-1)*I_Y)
    α_K = 1 - α_L

    # Use I_Y to get δ_K
    # I_Y = δ_K*α_K/(r_K*ρ(1-ϕ))
    δ_K = r*(α_K/(Γ*I_Y) - 1)^(-1)
    r_K = r + δ_K

    # Depreciation function parameter
    σ_b = r_K

    w = wL_Y*(Y_ss/L_ss)
    p_I = A^(ρ-1)
    MC_I = A*p_I/Γ
    # Productivity level in investment
    Z_I = (w/α_L)^(α_L)*(r_K/α_K)^(α_K)/MC_I

    I = I_Y*Y_ss
    C_Y = 1-I_Y
    C = C_Y*Y_ss

    K = I/δ_K
    ϕ_I = I_Y
    ϕ_C = C_Y
    KI = ϕ_I*K
    KC = ϕ_C*K

    ϕ_LK = (ρ-1)*δ_K*α_K/(r+δ_K)/((ρ-1)*δ_K*α_K/(r+δ_K)+α_L)
    LC = ϕ_C*(1-ϕ_LK)*L_ss
    LI = ϕ_I*(1-ϕ_LK)*L_ss
    LK = ϕ_LK*L_ss

    MC_C = A*pc_ss/Γ
    Z_C = (w/α_L)^(α_L)*(r_K/α_K)^(α_K)/MC_C
    P_C = pc_ss/p_I

    c_A = C/P_C # from C = P_C*c_A
    κ = (ρ-1)*c_A/QC_ss
    ζ = QI_ss/LK
    #u_c = (2-ρ)^(-σ)*c_A^(-σ)
    u_c = (c_A-κ*QC_ss)^(-σ) #directly applying Q^C=1
    # Determine chi from labor leisure tradeoff (sets L_ss = 1)
    χ = u_c*w/(P_C*L_ss^(ξ))


    # Check consistency
    @assert ψ_inv ≈ (1/ϕ+1-ρ)
    @assert Γ ≈ ρ*(1-ϕ)
    @assert wL_Y ≈ 1/Γ*(α_L+(ρ-1)*δ_K*α_K/(r+δ_K)) 
    @assert I_Y ≈ δ_K*α_K/(r_K*Γ)
    @assert I ≈ A*p_I*Z_I*(KI)^(α_K)*(LI)^(α_L)
    @assert C ≈ A*pc_ss*Z_C*(KC)^(α_K)*(LC)^(α_L)
    @assert Y_ss ≈ C + I
    @assert LK ≈ (ρ-1)*I/w

    return (A=A, β=β, ϕ=ϕ, ρ=ρ, α_L=α_L, δ_K=δ_K, σ_b=σ_b,
    Z_C=Z_C, Z_I=Z_I, χ=χ, κ=κ, ζ=ζ)
end

function table(para, targets)
    @unpack A, β, ϕ, ρ, α_L, δ_K, σ_b, Z_C, Z_I, χ, κ, ζ = para
    t = plot(
        table(
        header_values=["Parameter", "Symbol", "Value"],
        cells_values = [
        ["Depreciation mean of utilization",
         "Investment production function units",
         "Consumption production function units",
         "Weight of labor in utility",
         "Weight of search in utility",
         "Efficiency of investment shopping",
         "Discount factor",
         "Depreciation rate",
         "Labor coefficient in production",
         "Mean efficiency of matching"],

        [:σ_b :Z_I :Z_C :χ :κ :ζ :β :δ_K :α_L :A],
        [σ_b, Z_I, Z_C, χ, κ, ζ, β, δ_K, α_L, A]

        ]
        )
    )
    return t
end

para = calibrate(targets)


function steady_state_ratios(para)
    @unpack A, β, ϕ, ρ, α_L, δ_K, σ_b = para
    r = (1-β)/β
    α_K = 1-α_L
    # Elasticities
    Γ = ρ*(1-ϕ)
    ψ = 1/(1/ϕ+1-ρ)

    # Investment and consumption ratios
    I_Y = δ_K*α_K/(r_K*Γ)
    C_Y = 1 - I_Y

    # Capital to output ratio 
    K_Y = I_Y/δ_K
    # Labor share 
    wL_Y = α_L/Γ + (ρ-1)*I_Y

    # Sectoral capital stocks (redundant specification, but helps intuitively)
    ϕ_I = I_Y
    ϕ_C = C_Y

    # Labor share in investment shopping
    ϕ_LK = (ρ-1)*δ_K*α_K/(r+δ_K)/((ρ-1)*δ_K*α_K/(r+δ_K)+α_L)
    LC_L = ϕ_C*(1-ϕ_LK)
    LI_L = ϕ_I*(1-ϕ_LK)

    p_I = A^(ρ-1)
    MC_I = A*p_I/Γ

    total_factor_share = 1/Γ*(1+(ρ-1)*δ_K*α_K/(r+δ_K))
    profit_share = 1 - total_factor_share

    r_K*K - ρ*I
    Y = 1
    C = (r_K*ρ*(1-ϕ)-δ_K*α_K)/(r_K*ρ*(1-ϕ))
    I = δ_K*α_K/(r_K*ρ*(1-ϕ))
    K = I/δ_K
    #K = α_K/(ρ*(1-ϕ)*(r+δ_K))
    K_C = K*C
    K_I = K*I
    p_I = A^(ρ-1)
    #p_I/p_C = Z_C/Z_I
    L_I = I_Y*(1-ϕ_LK)
    L_C = C_Y*(1-ϕ_LK)
    Z_I = I/(A*p_I*K_I^(α_K)*(L_I)^α_L)
    #Z_C = C/(A*p_C*K_C^(α_K)*(L_C)^α_L)
    MC_I= A*p_I/(ρ*(1-ϕ))

    w = α_L*(Z_I*MC_I*(α_K/r_K)^α_K)^(1/α_L)


    


@with_kw mutable struct Para
    # Named tuple holding parameters
    A::Float64 = 0.5 # level parameter matching function
    ϕ::Float64 = 0.5 # elasticity of matching function
    ρ::Float64 = 1.25 # Taste for diversity parameter
    β::Float64 # discount factor,
    δ_K::Float64
    r = (1-β)/β

    σ::Float64 = 1.5 # inverse IES,
    #α_2::Float64 = var_share*(1-α) # variable labor share
    ψ::Float64 = 1.0 # Frisch elasticity of labor supply
    κ::Float64 = 1.0 # Shopping level parameter
    γ::Float64 = 1.0 # Shopping elasticity parameter
    Z_C::Float64 = 1.0 # retail technology
    Z_I::Float64 = 1.0 # investment technology
    χ::Float64 = 1.0 # labor level parameter
    ζ::Float64 = 1.0 # shopping efficiency
end








