using LaTeXStrings
using Parameters, CSV, StatsBase, Statistics, Random, QuantEcon, ArgParse
using Roots, Optim, NLsolve
using PlotlyJS
using Printf
using DataFrames
using PrettyPrinting


@with_kw mutable struct Targets
    r_annual::Float64 = 0.03     #associated with β
    δ_share::Float64 = 0.173    #associated with δ (can be combined with ϕ_I under fixed costs)
    ϕ_I::Float64 = 0.22          #associated with ν
    wL_Y::Float64 = 0.667        #associated with α_L
    occupancy_rate::Float64 = 0.78 #associated with A

    # Parameters determining units 
    Y::Float64 = 1            # associated with Z_I
    L::Float64 =1             # associated with χ
    qC::Float64 = 1           # associated with κ
    qI::Float64 = 1           # associated with ζ
end


function steady_state(para, Y=1.0, L=1.0, qC=1.0, qI=1.0)
    # Normalization: u=Y=L=q=1
    # associated with parameters σ_b, ZC, ZI, χ, ζ, κ
    crit = 1e-10

    @unpack ϕ, A, α_2, α_1, β, δ_K, ρ, α, σ, η, ψ = para

    cons = α_1^α_1*α_2^(α_2)/((1-α)^(1-α))

    Γ = A^α_2*(α_2*ϕ+ρ*(1-ϕ))
    α_L = α_1 + α_2

    r = (1-β)/β
    σ_b = r + δ_K
    r_K = r + δ_K

    # Sectoral output ratios
    ϕ_I = δ_K*α/(r_K*Γ)
    ϕ_C = 1 - ϕ_I
    ϕ_LK = (ρ-1)*δ_K*α/(r+δ_K)/((ρ-1)*δ_K*α/(r+δ_K)+α_L)

    I_C = ϕ_I/ϕ_C
    K_Y = α/(r_K*Γ)


    # Labor share 
    wL_Y = (1/Γ)*(α_L+(ρ-1)*δ_K*α/r_K)
    # Profit share
    #D_Y = (1-1/Γ)
    #D_Y = 1 - (1-α_K)/Γ - ρ*ϕ_I

    I = ϕ_I*Y
    C = ϕ_C*Y
    K = I/δ_K
    wL = wL_Y*Y
    D = C - wL

    # Labor types
    LC = ϕ_C*(1-ϕ_LK)*L
    LI = ϕ_I*(1-ϕ_LK)*L
    LK = ϕ_LK*L

    KC = ϕ_C*K
    KI = ϕ_I*K

    # Investment goods price 
    p_I = 1/A^(1-ρ)
    # Solve for Z_I to be consistent with production function
    ZI = I/(A*p_I*KI^(α)*LI^(α_L)*cons)
    ZC = ZI

    # Solve for p_C to be consistent with consumption production function
    p_C = C/(A*ZC*KC^(α)*LC^(α_L)*cons)

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

    Γ = A^α_2*(α_2*ϕ+ρ*(1-ϕ)) # gross markup
    Ψ = ((1+η)/ϕ + 1-ρ)^(-1) # elasticity of occupancy rate wrt spending

    @assert L - (λ*w*L/χ)^(1/(ψ+1)) ≈ 0.0
    @assert abs(w*LK - (ρ-1)*I) < crit
    @assert abs(C - A*p_C*ZC*KC^(α)*LC^(α_L)*cons) < crit
    @assert abs(χ*L^ψ - u_C*w/P_C) < crit
    @assert abs(C-wL-D) < crit
    return (C=C, I=I, Y=Y, L=L, w=w, c_A=c_A, K=K, KC=KC, KI=KI, 
        LC=LC, LI=LI, LK=LK, P_C=P_C, ZC=ZC, ZI=ZI, κ=κ, ζ=ζ, χ=χ, p_C=p_C, p_I=p_I, Γ=Γ, Ψ=Ψ, ϕ_LK=ϕ_LK)
end

function calibrate(targets; Γ=1.3, Ψ=0.25, var_share=0.5, σ=2.0, ψ=1.0)
    # Γ: gross markup
    # Ψ: elasticity of matching probability of firm locations wrt aggregate spending
    # var_share: share of variable labor
    #ψ: inverse of the Frisch elasticity
    #σ: inverse of IES
    # Here we impose η = 0.0 
        # Γ = A^α_2*(α_2*(1+ν_share) ϕ + ρ*(1-ϕ))
        # Ψ = (1/ϕ + 1-ρ)^{-1}
        # wL_Y = (1-α)/Γ*(1+ν_share)

    crit = 1e-10

    @unpack r_annual, wL_Y, ϕ_I, δ_share, occupancy_rate, Y, qC, qI, L = targets
    A = occupancy_rate 
    r= (1+r_annual)^(1/4) - 1
    β = 1/(1+r)
    δ_K = δ_share/4
    Ψ_inv = 1/Ψ
    ϕ_C = 1-ϕ_I

    σ_b = r+δ_K
    r_K = r+δ_K

    #= Labor share
    wL_Y = (1-α)/Γ*(1+ν_share)
    ϕ_I = δ_Kα/(r_KΓ)*(1+ν_share)
    => wL_YΓ/(1-α) =  ϕ_I*(r_K*Γ)/(δ_K*α)
    =>  α_ratio = ϕ_I*(r+δ)/(δ*wL_Y)
    #α = α_ratio/(1+α_ratio)
    =#

    #1) Find α
    α_ratio = ϕ_I*(r+δ_K)/(δ_K*wL_Y)
    α = α_ratio/(1+α_ratio)

    #2)
    α_2 = var_share*(1-α)

    #3) α_1 and cons
    α_1 = 1-α-α_2
    cons  = α_1^α_1*α_2^(α_2)/((1-α)^(1-α))

    #4) Ratio of fixed costs
    ν_R = Γ*wL_Y/(1-α) - 1

    #5) Solve for ϕ and ρ
    A_c = α_2*(1+ν_R)+Ψ_inv - 1
    B_c = - (Ψ_inv + Γ/A^α_2)
    C_c = 1.0

    ϕ = (-B_c - sqrt(B_c^2-4*A_c*C_c))/(2*A_c)
    ρ = 1 - Ψ_inv + 1/ϕ

    # function loss(ϕ)
    #     ρ = 1 - Ψ_inv + 1/ϕ
    #     return Γ - A^α_2*(α_2*(1+ν_share)*ϕ + ρ*(1-ϕ))
    # end

    #  x =fzero(loss, 0.1)

    #6) Calculate labor quantities
    LC = ϕ_C*L
    LI = ϕ_I*L

    #7) Investment and consumption
    I = ϕ_I*Y
    C = Y-I

    #8) Total capital and shares 
    K = I/δ_K
    KC = ϕ_C*K
    KI = ϕ_I*K

    #9) Investment goods price
    p_I = 1/(A^(1-ρ))

    #10) Consumption goods price (sum normalized to 1)
    p_C = 1-p_I

    #11) Solve Z_C, ZI given production functions
    ZI = I/(A*p_I*KI^(α)*LI^(1-α)*cons)
    ZC = C/(A*p_C*KC^α*LI^(1-α)*cons)

    #12) Consumption price index P_C
    P_C = A^(1-ρ)*p_C

    #13) Consumption bundle
    c_A = C/P_C

    #14) Shopping effort
    κ = (ρ-1)*c_A/(qC)

    #15) Consumption marginal utility
    block = c_A*(1-(ρ-1)*(1+ϕ_I/ϕ_C))
    u_C = block^(-σ)

    #16) Multiplier λ
    λ = u_C/P_C

    #17) Wage
    w = wL_Y*Y/L

    #18) Labor supply level parameter χ
    χ = λ*w/L^ψ

    #19) Investment-shopping-specific disutility ζ
    ζ = (ρ-1)/κ*(I/P_C)

    #20) Fixed cost ν 
    ν = Y/((p_I+p_C)*A)*ν_R

    # Consistency of Γ, α, ϕ, ν, ρ
    @assert abs( Γ - A^α_2*(α_2*(1+ν_R)*ϕ+ρ*(1-ϕ))) < crit
    @assert abs( ϕ_I - δ_K*α/(r_K*Γ)*(1+ν_R) ) < crit
    @assert abs( 1/Ψ -  (1/ϕ + 1-ρ)) < crit
    @assert abs(wL_Y- (1/Γ)*(1-α)*(1+ν_R)) < crit
    @assert abs(ν-Y/((p_I+p_C)*A)*ν_R) < crit

    # Check consistency of ζ, κ, χ
    @assert abs(κ*qC/(ρ-1)-c_A) < crit
    @assert abs(qI -(ρ-1)/(ζ*κ)*I/P_C) < crit
    @assert abs(χ*L^ψ - u_C*w/P_C) < crit
    return (A=A, β=β, ϕ=ϕ, ρ=ρ, δ_K=δ_K, α_1=α_1, α_2=α_2, α=α, ZC=ZC, ZI=ZI, χ=χ, κ=κ, ζ=ζ, σ_b=σ_b, σ=σ, ψ=ψ,Γ, Ψ, ν)
end



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