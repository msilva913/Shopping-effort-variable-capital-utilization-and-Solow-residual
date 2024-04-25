@show ϕ_fun(0.2, 0.286)
@show ϕ_fun(2.0, 0.286)
fig, ax = subplots()
η_space = 0.0:0.1:10.0
ϕ_space = ϕ_fun.(η_space, 0.286)
ax.plot(η_space, ϕ_space, lw=2, alpha=0.6, label="(ϕ,η) Locus consistent with m=0.286")
ax.set_xlabel("η")
ax.set_ylabel("ϕ")
ax.legend(fontsize=11)
display(fig)
PyPlot.savefig("shopping_curve.pdf")

############
function na_fun(n_c, n_i, ω=0.8, θ=0.5)
    return (ω^(-θ)*n_c^(1+θ)+(1-ω)^(-θ)*n_i^(1+θ))^(1/(1+θ))
end

function ϕ_fun(η, m=0.286)
    return (η+1)*m/(1+η*m)
end