
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
        LC=LC, LI=LI, LK=LK, P_C=P_C, ZC=ZC, ZI=ZI, κ=κ, ζ=ζ, χ=χ, p_C=p_C, p_I=p_I, Γ=Γ, Ψ=Ψ)
end

function calibrate(targets, Γ=1.3, Ψ=0.25, η=0.0, var_share=0.5, σ=2.0, ψ=1.0)
    # Γ: gross markup
    # Ψ: elasticity of matching probability of firm locations wrt aggregate spending
        # Γ = A^α_2*(α_2*ϕ+ρ*(1-ϕ))
        # Ψ = ((1+η)/ϕ + 1-ρ)^{-1}

    crit = 1e-10

    @unpack r_annual, ϕ_I, wL_Y, occupancy_rate, Y, qC, qI, L = targets
    A = occupancy_rate 
    r= (1+r_annual)^(1/4) - 1
    β = 1/(1+r)
    #TFP constant (adjustment due to composition)
    

    function loss(x)
        # Discrepancy with Ψ after checking consistency with
        #1) labor share
        #2) investment share
        #3) markup
        δ_K = sqrt(x^2)
        σ_b = r+δ_K
        #1) Consistency of α with investment share
        #ϕ_I = δ_K*α_K/(r_K*Γ)
        α =ϕ_I*(r+δ_K)*Γ/δ_K

        #2) Consistency of labor share with ρ
        #wL_Y = (1/Γ)*(1-α+(ρ-1)*δ_K*α_K/r_K)
        ρ =1.0 + (r+δ_K)/δ_K + (Γ*wL_Y-1)*(r+δ_K)/(α*δ_K)
        # consistency
        #α = (1-Γ*wL_Y)*(r+δ_K)/((r+δ_K)-(ρ-1)*δ_K)
        α_2 = var_share*(1-α)

        #3) Use Γ to extract ϕ 
        # Γ = A^α_2*(α_2*ϕ+ρ*(1-ϕ))
        ϕ = (ρ -Γ/A^α_2)/(ρ-α_2)

        #4) Consistency with Ψ
        out = Ψ - ((1+η)/ϕ + 1-ρ)^(-1)
        return out, σ_b, α, ρ, α_2, ϕ
    end
    x = fzero(x->loss(x)[1], 0.025)

    out, σ_b, α, ρ, α_2, ϕ = loss(x)
    α_1 = 1-α-α_2
    cons = α_1^α_1*α_2^(α_2)/((1-α)^(1-α))
    δ_K = x
    r_K = r + δ_K
    @assert abs(  ϕ_I - δ_K*α/(r_K*Γ) ) < crit
    @assert abs(wL_Y- (1/Γ)*(1-α+(ρ-1)*δ_K*α/r_K)) < crit
    @assert abs( Γ - A^α_2*(α_2*ϕ+ρ*(1-ϕ))) < crit
    @assert abs( 1/Ψ -  ((1+η)/ϕ + 1-ρ)) < crit

    ϕ_C = 1.0 - ϕ_I
    ϕ_LK = (ρ-1)*δ_K*α/(r+δ_K)/((ρ-1)*δ_K*α/(r+δ_K)+1-α)

    # Labor types
    LC = ϕ_C*(1-ϕ_LK)*L
    LI = ϕ_I*(1-ϕ_LK)*L
    LK = ϕ_LK*L

    I = ϕ_I*Y
    C = ϕ_C*Y
    K = I/δ_K
    KC = ϕ_C*K
    KI = ϕ_I*K

    # Investment goods price 
    p_I = 1/A^(1-ρ)
    # Solve for Z_I to be consistent with production function
    ZI = I/(A*p_I*KI^(α)*LI^(1-α)*cons)
    ZC = ZI

    # Solve for p_C to be consistent with consumption production function
    p_C = C/(A*ZC*KC^(α)*LC^(1-α)*cons)

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
    
    # Elasticities 
    # Check consistency of ζ, κ, χ
    @assert abs(qI - ζ*LK) < crit
    @assert abs(κ*qC^(1+η)/(ρ-1)-c_A) < crit
    @assert abs(χ*L^ψ - u_C*w/P_C) < crit
    return (A=A, β=β, ϕ=ϕ, ρ=ρ, δ_K=δ_K, α_1=α_1, α_2=α_2, α=α, ZC=ZC, ZI=ZI, χ=χ, κ=κ, ζ=ζ, η=η, σ_b=σ_b, σ=σ, ψ=ψ)
end

function table(para, ss)
    @unpack A, β, ϕ, ρ, δ_K, α_1, α_2, ZC, ZI, χ, κ, ζ = para
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
            "Mean efficiency of matching",
             "Love of variety",
             " Elasticity parameter in matching"],

        [:σ_b :ZI :ZC :χ :κ :ζ :β :δ_K :α :A :ρ :ϕ],
        round.([σ_b, ZI, ZC, χ, κ, ζ, β, δ_K, α, A, ρ, ϕ], digits=3),
        ["SS Utilization",
        "SS output",
        "SS output",
        "SS labor",
        "Consumption search tightness",
        "Investment search tightness",
        "Interest rate",
        "Investment-to-output ratio",
        "Labor share",
        "Occupancy rate",
         "Gross markup Γ",
         "Elasticity Ψ"
        ],
        [1.0, ss.Y, ss.Y, ss.L, 1.0, 1.0, 0.03, 0.22, 0.667, 0.78, 1.3, 0.25]
        ]
        ))
    return t
end

# Para = @with_kw (ϕ=0.1, A=0.8, α_2 = 0.0, α_1=0.7, β=0.99, δ_K = 0.025, ρ=2.0,
#          α_K=0.3, σ=1.0, η=1.0, ψ=1.0, Y=1.0, L=1.0, qC=1.0, qI=1.0)
targets = Targets()
para = calibrate(targets)
ss = steady_state(para)
tab = table(para, ss)










