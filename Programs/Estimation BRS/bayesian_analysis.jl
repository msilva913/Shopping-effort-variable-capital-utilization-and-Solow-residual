
using LaTeXStrings
using CSV, ArgParse
using Latexify
#using LinearAlgebra, Roots, Optim, NLsolve
using Printf
using DataFrames
using PrettyPrinting
using PlotlyJS
using PyPlot
using MAT
using TexTables
using PyFormattedStrings
using Dates


homedir()
include("time_series_fun.jl")
#cd(raw"C:\Users\msilva913\Documents\GitHub\Shopping-effort-variable-capital-utilization-and-Solow-residual\Programs\Estimation BRS")
#cd(raw"C:\Users\TJSEM\Github\Shopping-effort-variable-capital-utilization-and-Solow-residual\Programs\Estimation BRS")
cd(@__DIR__)

posterior = matopen("posterior_density.mat")
struc = read(posterior, "posterior_density")

# Prior distribution
prior = matopen("prior.mat")
prior_shocks = matopen("prior_shocks.mat")
struc_prior = read(prior, "prior")
struc_prior_shocks = read(prior_shocks, "prior_shocks")

# Prior mean and std
prior_mean = matopen("prior_mean.mat")
prior_mean = read(prior_mean, "prior_mean")
prior_std = matopen("prior_std.mat")
prior_std = read(prior_std, "prior_std")

# Posterior mean
posterior_mean = matopen("posterior_mean.mat")
posterior_mean_shocks = matopen("posterior_mean_shocks.mat")
posterior_mean_struc = read(posterior_mean, "posterior_mean")
posterior_mean_struc_shocks = read(posterior_mean_shocks, "posterior_mean_shocks")

# Posterior standard deviation
posterior_std = matopen("posterior_std.mat")
posterior_std_shocks = matopen("posterior_std_shocks.mat")
posterior_std_struc = read(posterior_std, "posterior_std")
posterior_std_struc_shocks = read(posterior_std_shocks, "posterior_std_shocks")

# Extract keys
print(keys(struc))
n = length(keys(struc))

function beta_map(m::Float64, s::Float64)
    if m <= 0 || m >= 1 || s < 0 || s >= 1
        error("Mean must be in (0, 1) and StdDev must be non-negative and less than 1.")
    end
    α = (m * (1 - m) / s^2 - 1) * m
    β = (m * (1 - m) / s^2 - 1) * (1 - m)
    return α, β
end

function gamma_map(m::Float64, s::Float64)
    if m <= 0 || s <= 0
        throw(ArgumentError("Mean and standard deviation must be positive."))
    end

    beta = s^2 / m
    alpha = m^2 / s^2
    return alpha, beta
end

# phi prior
α, β = beta_map(0.32, 0.2)
beta_dist = Beta(α, β)
ϕ_x = 0:0.01:1
ϕ_prior_pdf = pdf(beta_dist, x)

# eta prior
α, β = gamma_map(0.2, 0.15)
gamma_dist = Gamma(α, β)
η_x = 0:0.01:1
gamma_prior_pdf = pdf(beta_dist, x)

# Distribution: structural parameters
key_map = ["σ_a", "ζ", "η", "ρ_ZI", "ρ_N", "ρ_D", "θ", "Ψ_K", "ρ_C", "ρ_g"]



# Table: prior mean, prior std, posterior mean, posterior std
η_vals, η_density = columns(struc["eta"])
ϕ_vals, ϕ_density = columns(struc["phi"])

fig = plt.figure(figsize=(12, 5))
# First subplot for ϕ
ax2 = fig.add_subplot(1, 2, 1)
ax2.plot(ϕ_vals, ϕ_density, linewidth=1.5, color="orange", label="Posterior", zorder=2)
ax2.fill_between(ϕ_vals, ϕ_density, color="gold", alpha=0.3, zorder=1)
ax2.plot(ϕ_x, ϕ_prior_pdf, linewidth=1, linestyle="--", color="blue", label="Prior", zorder=2)
ax2.fill_between(ϕ_x, ϕ_prior_pdf, color="cyan", alpha=0.3, zorder=1)
ax2.set_xlabel("ϕ", fontsize=12)
ax2.set_ylabel("Density", fontsize=12)
ax2.legend(loc="upper right", fontsize=10)
ax2.grid(linestyle="--", alpha=0.7)
ax2.set_xlim(minimum(ϕ_x), maximum(ϕ_x))
ax2.set_ylim(0, max(maximum(ϕ_density), maximum(ϕ_prior_pdf)) * 1.1)

# Second subplot for η
ax1 = fig.add_subplot(1, 2, 2)
ax1.plot(η_vals, η_density, linewidth=1.5, color="orange", label="Posterior", zorder=2)
ax1.fill_between(η_vals, η_density, color="gold", alpha=0.3, zorder=1)
ax1.plot(η_x, gamma_prior_pdf, linewidth=1, linestyle="--", color="blue", label="Prior", zorder=2)
ax1.fill_between(η_x, gamma_prior_pdf, color="cyan", alpha=0.3, zorder=1)
ax1.set_xlabel("η", fontsize=12)
ax1.set_ylabel("Density", fontsize=12)
ax1.legend(loc="upper right", fontsize=10)
ax1.grid(linestyle="--", alpha=0.7)
ax1.set_xlim(minimum(η_x), maximum(η_x))
ax1.set_ylim(0, max(maximum(η_density), maximum(gamma_prior_pdf)) * 1.1)

# Adjust layout and display
plt.tight_layout()
display(fig)
plt.savefig("posterior_prior_phi_eta.pdf")


function cumulate(x)
    irf_levels = 100*cumsum(x)
    irf_levels =  cat(zeros(1), irf_levels, dims=1)
end

extract_series(str, dic::Dict) = vec(dic[str])

function irf_fun(vars, irf_dic; shock="e_D", length=20)
    periods = 1:length
    irf_array = []
    for (i, key) in enumerate(vars)
        str = key*"_"*shock
        irf = irf_dic[str]
        push!(irf_array, irf)
    end
    return irf_array
end

function irf_fun_plot(irf_array, vars_list, vars_list_label; shock, savefig=true)
    fig = plt.figure(figsize=(16, 10))
    periods = 1:length(irf_array[1][:])
    periods = 1:length(irf_array[1])
    for (i, key) in enumerate(vars_list)
        irf = transpose(irf_array[i])
        ax = fig.add_subplot(3, 3, i)
        ax.plot(periods, 100*irf, linewidth=3, color="teal")
        ax.tick_params(labelsize=12)
        ax.yaxis.set_major_formatter(matplotlib.ticker.PercentFormatter())
        ax.set_title(vars_list_label[i])
        plt.tight_layout()
        fig.suptitle("A 1 standard-deviation shock to "*shock, fontsize=14)
    end 
    display(fig)
    if savefig
        figname = "irf_"*shock*".pdf"
    end
    plt.savefig(figname)
end

function irf_fun_plot_grouped(irf_dic; shock, savefig=true)
    fig = plt.figure(figsize=(16, 8))
    periods = 1:length(irf_array[1][:])
    periods = 1:length(irf_array[1])
    list_1 = [:C, :I]
    list_2 = [:N_C, :N_I]
    list_3 = [:util_ND, :util_D, :util]
    lists = (list_1, list_2, list_3, [:SR], [:D, :h, :util], [:p_I])
    linestyles = ["solid", "dashed", "dotted"]
    j = 1
    for (n, list) in enumerate(lists)
        ax = fig.add_subplot(2, 3, n)
        ax.tick_params(labelsize=12)
        ax.yaxis.set_major_formatter(matplotlib.ticker.PercentFormatter())
        for (i, key) in enumerate(list)
            irf = transpose(irf_dic[key])
            ax.plot(periods, 100*irf, linewidth=3, label=key, linestyle = linestyles[i], alpha=0.7)
            ax.legend()
            #ax.set_title(vars_list_label[i])
            j += 1
        end 
    end
    fig.suptitle("A 1 standard-deviation shock to "*shock, fontsize=14)
    plt.tight_layout()
    display(fig)
    if savefig
        figname = "irf_"*shock*".pdf"
    end
    plt.savefig(figname)
end

# Standard impulse responses: basic model
#vars_list = ["log_C", "log_I", "log_Y_N", "log_p_I", "log_NC", "log_NI"]
#vars_list_label=[:C, :I, :Y_N, :p_I, :N_C, :N_I]
vars_list = ["C_obs", "I_obs", "NC_obs", "NI_obs", "util_ND_obs", "util_D_obs", "util_obs", "SR_obs", "D_obs", "h_obs", "p_I_obs"]
vars_list_label = [:C, :I, :N_C, :N_I, :util_ND, :util_D, :util, :SR, :D, :h, :p_I]

x = matopen("irf.mat")
vars = read(x, "irf")
irf_dic  = vars



# Shopping preference shock
irf_array = irf_fun(vars_list, irf_dic, shock="e_D", length=20 )
irf_dic_spec = Dict(zip(vars_list_label, irf_array))
irf_fun_plot_grouped(irf_dic_spec; shock="e_D")

# Stationary technology shock
irf_array = irf_fun(vars_list, irf_dic, shock="e_Z", length=20 )
irf_dic_spec = Dict(zip(vars_list_label, irf_array))
irf_fun_plot_grouped(irf_dic_spec; shock="e_Z")

# Permanent technology shock
irf_array = irf_fun(vars_list, irf_dic, shock="e_g", length=20 )
irf_dic_spec = Dict(zip(vars_list_label, irf_array))
irf_fun_plot_grouped(irf_dic_spec; shock="e_g")

# Discount factor shock
irf_array = irf_fun(vars_list, irf_dic, shock="e_b", length=20 )
irf_dic_spec = Dict(zip(vars_list_label, irf_array))
irf_fun_plot_grouped(irf_dic_spec; shock="e_b")


# In levels
irf_array = irf_fun(vars_list, irf_dic, shock="e_b", length=20, cumulate_resp=true )
irf_fun_plot(irf_array, vars_list, vars_list_label; shock="e_b", savefig=false)

# I-specific shopping shock
irf_array = irf_fun(vars_list, irf_dic, shock="e_DI", length=20 )
irf_fun_plot(irf_array, vars_list, vars_list_label; shock="e_DI")
# Shopping preference shock


# Wage markup shock

irf_array = irf_fun(vars_list, irf_dic, shock="e_muC", length=20 )
irf_fun_plot(irf_array, vars_list, vars_list_label; shock="e_muC")

irf_array = irf_fun(vars_list, irf_dic, shock="e_muI", length=20 )
irf_fun_plot(irf_array, vars_list, vars_list_label; shock="e_muI")

# Standard impulse responses 
x = matopen("irf.mat")
vars = read(x, "irf")
irf_dic  = vars
















