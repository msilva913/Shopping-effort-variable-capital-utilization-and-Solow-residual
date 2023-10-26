
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
    ϕ_I::Float64 = 0.22          #associated with δ
    wL_Y::Float64 = 0.667        #associated with α_L
    occupancy_rate::Float64 = 0.78 #assoiated with A
    markup::Float64 = 1.3        # Combined ρ(1-ϕ)

    # Parameters determining units 
    Y::Float64 = 1            # associated with Z_I
    L::Float64 =1             # associated with χ
    qC::Float64 = 1           # associated with κ
    qI::Float64 = 1           # associated with ζ
end

Para2 = @with_kw (ϕ=0.1, A=0.8, α_2 = 0.0, α_1=0.7, β=0.99, δ_K = 0.025, ρ=2.0,
         α_K=0.3, σ=1.0, η=1.0, ψ=1.0, Y=1.0, L=1.0, qC=1.0, qI=1.0)
para = Para2()

function steady_state(para)
    # Normalization: u=Y=L=q=1
    # associated with parameters σ_b, ZC, ZI, χ, ζ, κ
    crit = 1e-10

    @unpack ϕ, A, α_2, α_1, β, δ_K, ρ, α_K, σ, η, ψ = para
    @unpack Y, L, qC, qI = para

    cons = α_1^α_1*α_2^(α_2)/(α_K^α_K)

    Γ = A^α_2*(α_2*ϕ+ρ*(1-ϕ))
    α_L = α_1 + α_2

    r = (1-β)/β
    σ_b = r + δ_K
    r_K = r + δ_K

    # Sectoral output ratios
    ϕ_I = δ_K*α_K/(r_K*Γ)
    ϕ_C = 1 - ϕ_I
    ϕ_LK = (ρ-1)*δ_K*α_K/(r+δ_K)/((ρ-1)*δ_K*α_K/(r+δ_K)+α_L)

    I_C = ϕ_I/ϕ_C
    K_Y = α_K/(r_K*Γ)


    # Labor share 
    wL_Y = (1/Γ)*(α_L+(ρ-1)*δ_K*α_K/r_K)
    # Profit share
    #D_Y = (1-1/Γ)
    #D_Y = 1 - (1-α_K)/Γ - ρ*ϕ_I

    Y = 1.0
    L = 1.0
    I = ϕ_I*Y
    C = ϕ_C*Y
    K = I/δ_K
    wL = wL_Y*Y
    D = C - w*L

    # Labor types
    LC = ϕ_C*(1-ϕ_LK)*L
    LI = ϕ_I*(1-ϕ_LK)*L
    LK = ϕ_LK*L

    KC = ϕ_C*K
    KI = ϕ_I*K

    # Investment goods price 
    p_I = 1/A^(1-ρ)
    # Solve for Z_I to be consistent with production function
    ZI = I/(A*p_I*KI^(α_K)*LI^(α_L)*cons)
    ZC = ZI

    # Solve for p_C to be consistent with consumption production function
    p_C = C/(A*ZC*KC^(α_K)*LC^(α_L)*cons)

    #p_C = p_I*ZI/ZC
    P_C = A^(1-ρ)*p_C
    # consumption bundle
    c_A = C/P_C
    # Implied shopping effort cost from optimality condition
    κ = (ρ-1)*c_A/(qC^(1+η))
    # Marginal utility imposing GHH
    u_C = ((2+η-ρ)/(1+η)*c_A)^(-σ)
    # consumption marginal utility
    λ = u_C/P_C 

    wL = wL_Y*Y
    w = wL/L
    # Level parameter for labor supply
    χ = λ*w/L^ψ
    # Implied efficiency of shopping for investment goods: q_I = ζ*LK
    ζ = qI/LK

    @assert L - (λ*w*L/χ)^(1/(ψ+1)) ≈ 0.0
    @assert abs(w*LK - (ρ-1)*I) < crit
    @assert abs(C - A*p_C*ZC*KC^(α_K)*LC^(α_L)*α_1^α_1*α_2^(α_2)/(α_K^α_K)) < crit
    @assert abs(χ*L^ψ - u_C*w/P_C) < crit
    @assert abs(C-wL-D) < crit
    return (C, I, Y, L, w, c_A, K, KC, KI, LC, LI, LK, P_C, ZC, ZI, κ, ζ, χ, p_C, p_I)

    function table(para, targets)
        @unpack A, β, ϕ, ρ, δ_K, α_1, α_2, Z_C, Z_I, χ, κ, ζ = para
        r = (1-β)/β
        σ_b = r+δ_K
        α = 1-α_1-α_2
        t = PlotlyJS.plot(
            PlotlyJS.table(
            header_values=["Parameter", "Symbol", "Value", "Moment", "Value"],
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
    
            [:σ_b :Z_I :Z_C :χ :κ :ζ :β :δ_K :α :A],
            [σ_b, Z_I, Z_C, χ, κ, ζ, β, δ_K, α, A],
            ["SS Utilization",
            "SS output",
            "SS output",
            "SS labor",
            "Consumption search tightness",
            "Investment search tightness",
            "Interest rate",
            "Investment-to-output ratio",
            "Labor share",
            "Occupancy rate"]
            ]
        ))
        return t
    end

function calibrate(targets, Γ=1.3, Ψ=0.25, σ=2.0, var_share=0.5)
    # Γ: gross markup
    # Ψ: elasticity of matching probability of firm locations wrt aggregate spending
     # Γ = A^α_2*(α_2*ϕ+ρ*(1-ϕ))
     # Ψ = ((1+η)/ϕ + 1-ρ)^{-1}

    @unpack r_annual, ϕ_I, wL_Y, occupancy_rate, Y, qC, qI, L = targets
    A = occupancy_rate 
    r= (1+r_annual)^(1/4) - 1
    β = 1/(1+r)

    # depreciation rate 
    δ_K = 0.025
    σ_b = r+δ_K

    # Consistency of α with investment share
    #wL_Y = (1/Γ)*(α_L+(ρ-1)*δ_K*α_K/r_K)
    α =ϕ_I*(r+δ_K)*Γ/δ_K
    # Find implied ρ (also with labor share)
    ρ =1.0 + (r+δ_K)/δ_K + (Γ*wL_Y-1)*(r+δ_K)/(α*δ_K)
    # consistency
    #α = (1-Γ*wL_Y)*(r+δ_K)/((r+δ_K)-(ρ-1)*δ_K)
    α_2 = var_share*(1-α)
    # Use Γ to extract ϕ 
    ϕ = (ρ -Γ/A^α_2)/(ρ-α_2)

    # Use Ψ to extract η
    Ψ_inv = 1/Ψ
    (Ψ_inv-(1-ρ))*ϕ - 1.0
    @show Γ - A^(α_2)*(α_2*ϕ+ρ*(1-ϕ))

    ϕ_C = 1.0 - ϕ_I
    ϕ_LK = (ρ-1)*δ_K*α/(r+δ_K)/((ρ-1)*δ_K*α/(r+δ_K)+1-α)

    # Labor types
    LC = ϕ_C*(1-ϕ_LK)*L
    LI = ϕ_I*(1-ϕ_LK)*L
    LK = ϕ_LK*L

    I = ϕ_I*Y
    K = I/δ_K
    KC = ϕ_C*K
    KI = ϕ_I*K

    # Investment goods price 
    p_I = 1/A^(1-ρ)
    # Solve for Z_I to be consistent with production function
    ZI = I/(A*p_I*KI^(α_K)*LI^(α_L)*cons)
    ZC = ZI

    # Solve for p_C to be consistent with consumption production function
    p_C = C/(A*ZC*KC^(α_K)*LC^(α_L)*cons)

    #p_C = p_I*ZI/ZC
    P_C = A^(1-ρ)*p_C
    # consumption bundle
    c_A = C/P_C
    # Implied shopping effort cost from optimality condition
    κ = (ρ-1)*c_A/(qC^(1+η))
    # Marginal utility imposing GHH
    u_C = ((2+η-ρ)/(1+η)*c_A)^(-σ)
    # consumption marginal utility
    λ = u_C/P_C 

    wL = wL_Y*Y
    w = wL/L
    # Level parameter for labor supply
    χ = λ*w/L^ψ
    # Implied efficiency of shopping for investment goods: q_I = ζ*LK
    ζ = qI/LK
   
    # Check consistency
    @assert ψ_inv ≈ (1/ϕ+1-ρ)
    @assert Γ ≈ ρ*(1-ϕ)
    @assert wL_Y ≈ 1/Γ*(α_L+(ρ-1)*δ_K*α_K/(r+δ_K)) 
    @assert I_Y ≈ δ_K*α_K/(r_K*Γ)
    @assert I ≈ A*p_I*Z_I*(KI)^(α_K)*(LI)^(α_L)
    @assert C ≈ A*pc_ss*Z_C*(KC)^(α_K)*(LC)^(α_L)
    @assert Y_ss ≈ C + I
    @assert LK ≈ (ρ-1)*I/w

    return (A=A, β=β, ϕ=ϕ, ρ=ρ, α_1=α_1, α_2=α_2, ZC=Z_C, ZI=Z_I, χ=χ, κ=κ, ζ=ζ, δ_K=δ_K, σ_b=σ_b)
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








