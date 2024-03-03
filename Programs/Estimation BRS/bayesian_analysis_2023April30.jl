
using LaTeXStrings
using CSV, ArgParse
using Latexify
#using LinearAlgebra, Roots, Optim, NLsolve
using Printf
using DataFrames
using PrettyPrinting
using PlotlyJS
using MAT
using TexTables
using PyFormattedStrings
using Dates


homedir()
include("time_series_fun.jl")
#cd(raw"C:\Users\msilva913\Documents\GitHub\Shopping-effort-variable-capital-utilization-and-Solow-residual\Programs\Estimation BRS")
cd(raw"C:\Users\TJSEM\Github\Shopping-effort-variable-capital-utilization-and-Solow-residual\Programs\Estimation BRS")

function cumulate(x)
    irf_levels = 100*cumsum(x)
    irf_levels =  cat(zeros(1), irf_levels, dims=1)
end

extract_series(str, dic::Dict) = vec(dic[str])

function irf_fun(vars_list, irf_dic::Dict; shock, length=80, cumulate_resp=false)
    irf_array = []
    periods = 1:length
    for (i, key) in enumerate(vars_list)
        str = key*"_"*shock
        x = extract_series(str, irf_dic)[periods]
        if cumulate_resp == false
         irf_level = 100.0*x
    else
        irf_level = cumulate(x)
    end
        push!(irf_array, irf_level)
    end
return irf_array
end


function irf_fun_plot(irf_array, vars_list; shock, savefig=true)
    fig = plt.figure(figsize=(20, 8))
    periods = 1:length(irf_array[1][:,1])
    for (i, key) in enumerate(vars_list)
        irf = irf_array[i]
        ax = fig.add_subplot(2, 3, i)
        ax.plot(periods, irf, linewidth=3, color="teal")
        ax.tick_params(labelsize=12)
        ax.yaxis.set_major_formatter(matplotlib.ticker.PercentFormatter())
        ax.set_title(vars_list[i])
        plt.tight_layout()
        fig.suptitle("A 1 standard-deviation shock to "*shock, fontsize=14)
    end 
    display(fig)
    if savefig
        figname = "irf_"*shock*".pdf"
    end
    plt.savefig(figname)
end

# Standard impulse responses: basic model
vars_list = ["log_C", "log_I", "log_Y_N", "log_p_I", "log_NC", "log_NI"]
x = matopen("irf.mat")
vars = read(x, "irf")
irf_dic  = vars
# Shopping preference shock
irf_array = irf_fun(vars_list, irf_dic, shock="e_D" )
irf_fun_plot(irf_array, vars_list; shock="e_D")
# Stationary technology shock
irf_array = irf_fun(vars_list, irf_dic, shock="e_Z" )
irf_fun_plot(irf_array, vars_list; shock="e_Z")

# Standard impulse responses 
x = matopen("irf.mat")
vars = read(x, "irf")
irf_dic  = vars


# String matching
# Technology shocks (in levels)




irf_array = irf_fun(vars, irf_dic, shock="e_g" )
irf_fun_plot(irf_array, vars; shock="e_g")


# General shopping shock
irf_e_D = irf_fun(vars, irf_dic, shock="e_D" )
irf_fun_plot(irf_e_D, vars, shock="e_D")

# Consumption shock
irf_e_C = irf_fun(vars, irf_dic, shock="e_C" )
irf_fun_plot(irf_e_C, vars, shock="e_C")

# Labor supply shock
irf_e_N = irf_fun(vars, irf_dic, shock="e_N" )
irf_fun_plot(irf_e_N, vars, shock="e_N")
##############














# Conditional forecast error variance decomposition
function new_2s(a, i)
    i2s = CartesianIndices(a)
    return i2s[i]
end

#C_obs,Y_obs, SR_obs, TI_obs, NE, L ;
x = matopen("CFEVD.mat")
CFEVD = read(x, "CFEVD")
CFEVD = CFEVD[[10, 11, 12, 13, 14, 18], :, :]
CFEVD = 100*round.(CFEVD, digits=2)
#CFEVD = permutedims(CFEVD, [2 1 3])
# Order follows declaration of stoch_simul
labels = ["Output" "Labor productivity" "Investment" "Relative investment price" "Consumption" "Utilization"]
shock_labels = [:e_g, :e_ZI, :e_N, :e_D, :e_C]

p = make_subplots(rows=2, cols=3, subplot_titles=labels,
specs=[
    Spec(kind="xy") Spec(kind="xy") Spec(kind="xy") 
    Spec(kind="xy") Spec(kind="xy") Spec(kind="xy")]
)
#labels = ["Consumption", "Output", "Total Investment", "Solow residual", "Labor supply"]
legend_on = [true false false false false false]
periods = ["Q1", "Q4", "Q8", "Q40"]


a = rand(3, 2)
figs = Dict()
for i = 1:length(labels) 
    CFEVD_i = CFEVD[i, :, 1:length(shock_labels)]
    #CFEVD_i = convert(DataFrames.DataFrame, CFEVD_i)
    CFEVD_i = DataFrames.DataFrame(CFEVD_i, :auto)
    rename!(CFEVD_i, shock_labels)
    CFEVD_i[!, :horizon] = periods
    long_df = DataFrames.stack(CFEVD_i, variable_name=:shock, value_name=:share)
    figs[i] = PlotlyJS.Plot(long_df, kind="bar", x=:horizon, y=:share, color=:shock,
    Layout(barmode="stack"))
    for tr in figs[i].data 
        tr.fields[:showlegend] = legend_on[i]
        index = new_2s(a, i)
        add_trace!(p, tr, row=index[2], col=index[1])
    end
end


relayout!(p, title_text="Conditional forecast error variance decomposition", barmode="stack")
display(p)
PlotlyJS.savefig(p, "CFEVD.pdf")


# Integrated CFEVD
legend_on = [true false false false]
periods = ["Q1", "Q4", "Q8", "Q40"]

p = make_subplots(rows=2, cols=2, subplot_titles=labels,
specs=[
    Spec(kind="bar") Spec(kind="bar")
    Spec(kind="bar") Spec(kind="bar")
]
)
#labels = ["Consumption", "Output", "Total Investment", "Solow residual", "Labor supply"]


a = rand(2, 2)
figs = Dict()
for i = 1:length(labels) 
    CFEVD_i = CFEVD[i, :, 1:length(shock_labels)]
    #CFEVD_i = convert(DataFrames.DataFrame, CFEVD_i)
    CFEVD_i = DataFrames.DataFrame(CFEVD_i, :auto)
    rename!(CFEVD_i, shock_labels)
    # Aggregate shocks
    CFEVD_i[!, :Technology] = sum(CFEVD_i[!, i] for i in supply_shock_labels)
    CFEVD_i[!, :Standard_demand] = sum(CFEVD_i[!, i] for i in dem_shock_standard_labels)
    CFEVD_i[!, :Shopping_demand] = sum(CFEVD_i[!, i] for i in dem_shock_shop_labels)
    CFEVD_i_agg =DataFrames.select(CFEVD_i, [:Technology, :Standard_demand, :Shopping_demand, :Labor_supply])
    CFEVD_i_agg[!, :horizon] = periods
    long_df = DataFrames.stack(CFEVD_i_agg, variable_name=:shock, value_name=:share)
    figs[i] = PlotlyJS.Plot(long_df, kind="bar", x=:horizon, y=:share, color=:shock,
    Layout(barmode="stack"))
    for tr in figs[i].data 
        tr.fields[:showlegend] = legend_on[i]
        index = new_2s(a, i)
        add_trace!(p, tr, row=index[1], col=index[2])
    end
end


relayout!(p, title_text="Conditional forecast error variance decomposition: aggregated", barmode="stack")
display(p)
PlotlyJS.savefig(p, "CFEVD_agg.pdf")

# trace = [PlotlyJS.bar() for _ in 1:5]
# for i =1:length(labels)
#     CFEVD_i = CFEVD[i, :, :]
#     #CFEVD_i = convert(DataFrames.DataFrame, CFEVD_i)
#     CFEVD_i = DataFrames.DataFrame(CFEVD_i, :auto)
#     rename!(CFEVD_i, [:Consumption_tech, :Investment_tech, :Entry_tech, 
#     :Intratemporal_preference, :Discount_factor, :Labor_supply])
#     CFEVD_i[!, :horizon] = periods
#     long_df = DataFrames.stack(CFEVD_i, Not([:horizon]), variable_name=:shock, value_name=:share)
#     trace[i] = PlotlyJS.bar(long_df, x=:horizon, y=:share, color=:shock, barmode="stack")
# end
# p2 = PlotlyJS.plot(trace[1])
# relayout!(p2, barmode="stack", color=:shock)
####################################################################################################################
# Posterior distribution
posterior = matopen("posterior.mat")
posterior_shocks = matopen("posterior_shocks.mat")
struc = read(posterior, "posterior")
struc_shocks = read(posterior_shocks, "posterior_shocks")

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

# Distribution: structural parameters
key_map = ["σ_a", "ζ", "η", "ρ_ZI", "ρ_N", "ρ_D", "θ", "Ψ_K", "ρ_C", "ρ_g"]

# Table: prior mean, prior std, posterior mean, posterior std

fig = plt.figure(figsize=(18, 14))
for (i, key) in enumerate(keys(struc))
    val = struc[key]
    val_prior = struc_prior[key]
    mean = posterior_mean_struc[key]
    std = posterior_std_struc[key]
    ax = fig.add_subplot(4, 5, i)
    ax.plot(val_prior[:, 1], val_prior[:, 2], label="Prior", linewidth=1)
    ax.plot(val[:, 1], val[:, 2], label=f"Posterior({mean:.3f}, {std:.3f})", linewidth=2)
    ax.set_title(key_map[i])
    ax.set_xlim(left=mean-4*std)
    ax.set_xlim(right=mean+4*std)
    ax.fill_between(val[:, 1], 0, val[:, 2], alpha=0.3)
    #ax.fill_between(val[:, 1], val_prior[:, 2], val[:, 2])
    ax.legend(loc="upper right")
end
display(fig)
plt.savefig("posterior_prior_struct.pdf")

print(keys(struc_shocks))
n = length(keys(struc_shocks))
# Distribution: shock processes
key_map_shocks = ["e_C", "e_ZI", "e_D", "e_g", "e_N"]
fig = plt.figure(figsize=(18, 12))
for (i, key) in enumerate(keys(struc_shocks))
    val = struc_shocks[key]
    val_prior = struc_prior_shocks[key]
    mean = posterior_mean_struc_shocks[key]
    std = posterior_std_struc_shocks[key]
    ax = fig.add_subplot(4, 4, i)
    ax.plot(val_prior[:, 1], val_prior[:, 2], label="Prior", linewidth=1)
    ax.plot(val[:, 1], val[:, 2], label=f"Posterior({mean:.3f}, {std:.3f})", linewidth=2)
    ax.set_title(key_map_shocks[i])
    ax.set_xlim(left=mean-4*std, right=mean+6*std)
    #right=min(maximum(val_prior[:, 1]), mean+2*std))
    ax.fill_between(val[:, 1], 0, val[:, 2], alpha=0.3)
    #ax.fill_between(val[:, 1], val_prior[:, 2], val[:, 2])
    ax.legend(loc="upper right")
end
plt.tight_layout()
display(fig)
plt.savefig("posterior_prior_shock.pdf")

# Dependent parameters 
function ϕ_fun(η, m)
    return (η+1)*m/(1+η*m)
end

η_vals, η_density = columns(struc["eta"])
# Posterior density of ϕ
fig, ax = plt.subplots()
ax.plot(ϕ_fun.(η_vals, 0.286), η_density, label="Posterior density of ϕ")
display(fig)


#########################
#key_map = ["σ_a", "ζ", "η", "ρ_ZI", "ρ_N", "ρ_D", "θ", "Ψ_K", "ρ_C", "ρ_g"]
dist_dic = Dict(
    "σ_a" => "Gamma",
    "ζ" => "Gamma",
    "η" => "Gamma",
    "ρ_ZI" => "Beta",
    "ρ_N" => "Beta",
    "ρ_D" => "Beta",
    "θ" => "Beta",
    "Ψ_K" => "Gamma",
    "ρ_C" => "Beta",
    "ρ_g" => "Beta"
)

post_means = collect(values(posterior_mean_struc))
post_stds = collect(values(posterior_std_struc))
#params = keys(posterior_mean_struc)
@show keys(posterior_mean_struc)
key_map = ["σ_a", "ζ", "η", "ρ_ZI", "ρ_N", "ρ_D", "θ", "Ψ_K","ρ_C", "ρ_g"]



# Declaration order
prior_shocks = ["σ_a", "Ψ_K", "ζ", "η", "θ", "ρ_g", "ρ_ZI", "ρ_N", "ρ_D", "ρ_C"]
prior_means_dic = Dict( zip(prior_shocks, prior_mean[6:end]))
prior_mean_vals = getindex.(Ref(prior_means_dic), key_map)

prior_stds_dic = Dict( zip(prior_shocks, prior_std[6:end]))
prior_stds_vals = getindex.(Ref(prior_stds_dic), key_map)


#dist = collect(values(dist_dic))
dist = getindex.(Ref(dist_dic), key_map)
#Table of prior-posterior estimates 
summ = [key_map dist prior_mean_vals post_means prior_stds_vals  post_stds ]
summ_dat = DataFrame(summ, :auto)
summ_dat[:, 3:end] = round.(summ_dat[:,3:end], digits=3)
#DataFrames.rename!(summ_dat, [:Parameter, :Distribution, :Prior_mean, :Posterior_mean, :Prior_stds, :Posterior_std])
d1 = DataFrames.rename!(summ_dat, [:Parameter, :Distribution, :Prior_mean, :Posterior_mean, :Prior_std, :Posterior_std])
print(summ_dat)



### Conditional standard deviations 
post_means = collect(values(posterior_mean_struc_shocks))
post_stds = collect(values(posterior_std_struc_shocks))
@show keys(posterior_mean_struc_shocks)

key_map_shocks = ["e_C", "e_ZI", "e_D", "e_g", "e_N"]
nshocks = length(key_map_shocks)

dist_shocks = fill("Inverse Gamma", nshocks)
summ = [key_map_shocks dist_shocks prior_mean[1:nshocks] post_means prior_std[1:nshocks] post_stds ]
summ_dat = DataFrame(summ, :auto)
summ_dat[:, 3:end] = round.(summ_dat[:,3:end], digits=3)
#DataFrames.rename!(summ_dat, [:Parameter, :Distribution, :Prior_mean, :Posterior_mean, :Prior_stds, :Posterior_std])
d2 = DataFrames.rename!(summ_dat, [:Parameter, :Distribution, :Prior_mean, :Posterior_mean, :Prior_std, :Posterior_std])

d = vcat(d1, d2)
# Create Latex Table 
tab = latexify(d, env=:tabular, latex=false)

#######################################################################################
###Bayesian IRF 
vars = [Dict() for i in 1:3]
file_names = ["bayesian_irf_mean", "bayesian_irf_higher", "bayesian_irf_lower"]
for (i, file) in enumerate(file_names)
    x = matopen(file*".mat")
    vars[i] = read(x, file)
end
bayesian_irf_mean, bayesian_irf_high, bayesian_irf_low = vars


# String matching
# Technology shocks (in levels)
key_vars_tech = ["Y_obs", "lab_prod_obs", "C_obs", "I_obs", "p_I_obs", "util_obs"]

function cumulate_responses(vars; key_shock="e_g", len=80)
    periods = 1:len
    irf_array = []
    for (i, key) in enumerate(vars)
        str = key*"_"*key_shock
        means = 100*bayesian_irf_mean[str][periods,1]
        high = 100*bayesian_irf_high[str][periods,1]
        low = 100*bayesian_irf_low[str][periods,1]
        irf_growth = [means high low]
        # cumulative sum
        irf_levels = cumsum(irf_growth, dims=1)
        # add initial row of zeros 
        irf_levels = cat(zeros(3)', irf_levels, dims=1)
        push!(irf_array, irf_levels)
    end
    return irf_array
end

irf_array = cumulate_responses(key_vars_tech, len=80)


function bayesian_irf_fun(irf_array; key_vars, key_shock, savefig=true)
    fig = plt.figure(figsize=(20, 8))
    periods = 1:length(irf_array[1][:,1])
    for (i, key) in enumerate(key_vars)
        means, high, low = columns(irf_array[i])
        ax = fig.add_subplot(2, 4, i)
        ax.plot(periods, means, linewidth=2, color="black")
        ax.plot(periods, high, linewidth=0.5)
        ax.plot(periods, low, linewidth=0.5)
        ax.fill_between(periods, low, high, alpha=0.3, facecolor="teal")
        ax.tick_params(labelsize=12)
        ax.yaxis.set_major_formatter(matplotlib.ticker.PercentFormatter())
        ax.set_title(key_vars[i])
        plt.tight_layout()
        fig.suptitle("A 1 standard-deviation shock to "*key_shock, fontsize=14)
    end 
    display(fig)
    if savefig
        figname = "irf_"*key_shock*".pdf"
    end
    plt.savefig(figname)
end

bayesian_irf_fun(irf_array, key_vars=key_vars_tech, key_shock="e_g")
irf_array = cumulate_responses(key_vars_tech, key_shock="e_D")
bayesian_irf_fun(irf_array, key_vars=key_vars_tech, key_shock="e_D")

key_vars = ["log_Y", "log_Y_N", "log_C", "log_I", "log_NC", "log_NI", "log_p_I", "util"]
key_shocks = ["e_ZI", "e_g", "e_N", "e_D", "e_C"]

# From variance decomposition, we focus on 
#-- consumption tech shock (important for consumption and output)
#-- entry tech shock (important for entry and Solow residual)
#-- shopping disutility shock (consumption and Solow residual)
#-- intratemporal preference (consumption and output)

function bayesian_irf_fun(key_shock; key_vars=key_vars, len=80, savefig=true)
    # Fix shock type and loop over variables in key_vars
    fig = plt.figure(figsize=(20, 8))
    periods = 1:len
    periods0 = 0:len
    for (i, key) in enumerate(key_vars)
        str = key*"_"*key_shock
        print(str)
        means = 100*bayesian_irf_mean[str][periods,1]
        high = 100*bayesian_irf_high[str][periods,1]
        low = 100*bayesian_irf_low[str][periods,1]
        irfs = [append!([0.0], x) for x in [means, high, low]]
        means, high, low = irfs

        ax = fig.add_subplot(2, 4, i)
        ax.plot(periods0, means, linewidth=2, color="black")
        ax.plot(periods0, high, linewidth=0.5)
        ax.plot(periods0, low, linewidth=0.5)
        ax.fill_between(periods0, low, high, alpha=0.3, facecolor="teal")
        ax.tick_params(labelsize=12)
        ax.yaxis.set_major_formatter(matplotlib.ticker.PercentFormatter())
        ax.set_title(key_vars[i])
        plt.tight_layout()
        fig.suptitle("A 1 standard-deviation shock to "*key_shock, fontsize=14)
    end 
    display(fig)
    if savefig
        figname = "irf_"*key_shock*".pdf"
    end
    plt.savefig(figname)
end

# Common technology shock 
#irf_e_Z = bayesian_irf_fun("e_Z")
# Consumption technology
#irf_e_ZC = bayesian_irf_fun("e_ZC")

# General shopping shock
irf_e_D = bayesian_irf_fun("e_D")
# Consumption shock
irf_e_C = bayesian_irf_fun("e_C")
# Labor supply shock
irf_e_N = bayesian_irf_fun("e_N")

# Compare investment shopping shock and investment-specific technology shock
# Investment shopping shock
irf_e_zeta = bayesian_irf_fun("e_zeta")
# C, Y, SR, NE all rise
# Compare to investment-specific technology shock
irf_e_ZI = bayesian_irf_fun("e_ZI")

# Intratemporal preference shock
irf_e_theta = bayesian_irf_fun("e_theta")
# increase in C, Y, SR_obs, NE--similar shape

# Government expenditure shock
irf_e_g = bayesian_irf_fun("e_g")

# Discount factor shock
irf_e_b = bayesian_irf_fun("e_b")

# Also check labor supply
irf_e_chi = bayesian_irf_fun("e_chi")  


##############################################################################
## Results of not including SR_util

#C_obs,Y_obs, SR_obs, TI_obs, NE, L ;
x = matopen("CFEVD_r.mat")
CFEVD = read(x, "CFEVD")
#CFEVD = permutedims(CFEVD, [2 1 3])
# Order follows declaration of stoch_simul
CFEVD = CFEVD[[2, 3, 4, 5], :, :]
labels = ["Output" "Solow residual"; "Solow residual: utilization adjusted"  "Investment"]

# Disaggregated CFEVD
p = make_subplots(rows=2, cols=2, subplot_titles=labels,
specs=[
    Spec(kind="bar") Spec(kind="bar")
    Spec(kind="bar") Spec(kind="bar")
]
)
#labels = ["Consumption", "Output", "Total Investment", "Solow residual", "Labor supply"]
legend_on = [true false false false]
periods = ["Q1", "Q4", "Q8", "Q40"]

a = rand(2, 2)
figs = Dict()
for i = 1:length(labels) 
    CFEVD_i = CFEVD[i, :, 1:length(shock_labels)]
    #CFEVD_i = convert(DataFrames.DataFrame, CFEVD_i)
    CFEVD_i = DataFrames.DataFrame(CFEVD_i, :auto)
    rename!(CFEVD_i, shock_labels)
    CFEVD_i[!, :horizon] = periods
    long_df = DataFrames.stack(CFEVD_i, variable_name=:shock, value_name=:share)
    figs[i] = PlotlyJS.Plot(long_df, kind="bar", x=:horizon, y=:share, color=:shock,
    Layout(barmode="stack"))
    for tr in figs[i].data 
        tr.fields[:showlegend] = legend_on[i]
        index = new_2s(a, i)
        add_trace!(p, tr, row=index[1], col=index[2])
    end
end


relayout!(p, title_text="Conditional forecast error variance decomposition", barmode="stack")
display(p)
PlotlyJS.savefig(p, "CFEVD_r.pdf")


# Integrated CFEVD
legend_on = [true false false false]
periods = ["Q1", "Q4", "Q8", "Q40"]

p = make_subplots(rows=2, cols=2, subplot_titles=labels,
specs=[
    Spec(kind="bar") Spec(kind="bar")
    Spec(kind="bar") Spec(kind="bar")
]
)
#labels = ["Consumption", "Output", "Total Investment", "Solow residual", "Labor supply"]


a = rand(2, 2)
figs = Dict()
for i = 1:length(labels) 
    CFEVD_i = CFEVD[i, :, 1:length(shock_labels)]
    #CFEVD_i = convert(DataFrames.DataFrame, CFEVD_i)
    CFEVD_i = DataFrames.DataFrame(CFEVD_i, :auto)
    rename!(CFEVD_i, shock_labels)
    # Aggregate shocks
    CFEVD_i[!, :Technology] = sum(CFEVD_i[!, i] for i in supply_shock_labels)
    CFEVD_i[!, :Standard_demand] = sum(CFEVD_i[!, i] for i in dem_shock_standard_labels)
    CFEVD_i[!, :Shopping_demand] = sum(CFEVD_i[!, i] for i in dem_shock_shop_labels)
    CFEVD_i_agg =DataFrames.select(CFEVD_i, [:Technology, :Standard_demand, :Shopping_demand, :Labor_supply])
    CFEVD_i_agg[!, :horizon] = periods
    long_df = DataFrames.stack(CFEVD_i_agg, variable_name=:shock, value_name=:share)
    figs[i] = PlotlyJS.Plot(long_df, kind="bar", x=:horizon, y=:share, color=:shock,
    Layout(barmode="stack"))
    for tr in figs[i].data 
        tr.fields[:showlegend] = legend_on[i]
        index = new_2s(a, i)
        add_trace!(p, tr, row=index[1], col=index[2])
    end
end


relayout!(p, title_text="Conditional forecast error variance decomposition: aggregated", barmode="stack")
display(p)
PlotlyJS.savefig(p, "CFEVD_agg_r.pdf")


















# Observable series
obs = matopen("observables.mat")
obs_vars = [zeros(252) for i in 1:3]
obs_vars[1] = vec(read(obs, "Y_obs"))
obs_vars[2] = vec(read(obs, "SR_obs"))
obs_vars[3] = vec(read(obs, "SR_util_obs"))



file_read = ["C_obs", "L_obs", "TI_obs", "Y_obs", "SR_obs", "SR_util_obs", "p_I_obs"]
for (i, file) in enumerate(file_names)
    x = matopen(file*".mat")
    vars[i] = vec(read(x, file_read[i]))
end
C, L, I, Y, SR, SR_util, p_I = [vars[i] for i in 1:7]
##########
# Calculate moments
# C, L, I, Y, SR, SR_util, p_I
vars = [zeros(400) for i in 1:7]
file_names = ["C", "L", "TI", "Y", "SR", "SR_util", "p_I"]
file_read = ["C_obs", "L_obs", "TI_obs", "Y_obs", "SR_obs", "SR_util_obs", "p_I_obs"]
for (i, file) in enumerate(file_names)
    x = matopen(file*".mat")
    vars[i] = vec(read(x, file_read[i]))
end
C, L, I, Y, SR, SR_util, p_I = [vars[i] for i in 1:7]

out = hcat(C, L, I, Y, SR, SR_util, p_I)
#fields = keys(sim)[1:19]
fields = [:C, :L, :I, :Y, :SR, :SR_util, :p_I]
# Log deviations from stationary mean
df = DataFrame(out, :auto).*100
DataFrames.rename!(df, fields)

# Create time series object
#df = mapcols(col -> hamilton_filter(col, h=8), df)
mom = moments(df, :Y, [:Y, :SR], lags=1, var_names=fields)
print(mom)

#################################################################################
#Historical decomposition: full model
dates = range(Date(1967, 1, 1), step=Dates.Quarter(1), stop=Date(2019, 12, 31))
x = matopen("hist_dec.mat")
hist_dec = read(x, "hist_dec")

# Fix legends
labels = ["Output" "Solow residual" "Solow residual: utilization adjusted"]
legend_on = [true false false]
figs = Dict()
fig_hist = make_subplots(rows=3, cols=1, subplot_titles=labels,
 specs=[
     Spec(kind="bar") missing
     Spec(kind="bar") missing
     Spec(kind="bar") missing
 ]
)

         
dem_shock_standard_labels = [:Intratemporal_preference, :Discount_factor, :Gov_expenditure]
dem_shock_shop_labels = [:Shopping_disutility, :Investment_shopping, :Common_shopping]
supply_shock_labels = [:Consumption_tech, :Investment_tech, :Common_tech]

hist_dec_list = [DataFrames.DataFrame() for _ in 1:3]
for i in 1:3
    hist_dec_i = hist_dec[i, :, :]
    # Transpose and drop measurement errors
    # shocks x time
    hist_dec_i = hist_dec_i'
    #hist_dec_i = convert(DataFrames.DataFrame, hist_dec_i)
    hist_dec_i = DataFrames.DataFrame(hist_dec_i, :auto)
    hist_dec_i = hist_dec_i[:, 1:(end-5)]
    rename!(hist_dec_i, shock_labels)
    hist_dec_i[!, :date] = dates
    hist_dec_list[i] = hist_dec_i
    long_df = DataFrames.stack(hist_dec_i, variable_name=:shock, value_name=:share)
    figs[i] = PlotlyJS.Plot(long_df, kind="bar", x=:date, y=:share, color=:shock, 
    Layout(title=labels[i], barmode="relative"))
    add_trace!(figs[i], PlotlyJS.scatter(;x=hist_dec_i.date, y=obs_vars[i], mode="lines",
    marker_color="black", name="Empirical values", alpha=0.6, line_width=1.25))
    for tr in figs[i].data 
        tr.fields[:showlegend] = legend_on[i]
        add_trace!(fig_hist, tr, row=i, col=1)
    end

end
relayout!(fig_hist, title_text="Historical decomposition", barmode="relative", color="shock")
display(fig_hist)
PlotlyJS.savefig(fig_hist, "fig_hist.pdf")


fig_hist_agg = make_subplots(rows=3, cols=1, subplot_titles=labels,
specs=[
    Spec(kind="bar") missing
    Spec(kind="bar") missing
    Spec(kind="bar") missing
]
)
# Integrated demand and supply shocks in the decomposition
figs_agg = Dict()
for (i, hist_dec_i) in enumerate(hist_dec_list)
    hist_dec_i[!, :Technology] = sum(hist_dec_i[!, i] for i in 1:3)
    hist_dec_i[!, :Standard_demand] = sum(hist_dec_i[!, i] for i in dem_shock_standard_labels)
    hist_dec_i[!, :Shopping_demand] = sum(hist_dec_i[!, i] for i in dem_shock_shop_labels)
    # Select aggregated series
    hist_dec_agg_i =DataFrames.select(hist_dec_i, [:Technology, :Standard_demand, :Shopping_demand, :Labor_supply, :date])
    long_df = DataFrames.stack(hist_dec_agg_i, variable_name=:shock, value_name=:share)
    figs_agg[i] = PlotlyJS.Plot(long_df, kind="bar", x=:date, y=:share, color=:shock, Layout(title=labels[i],
        barmode="relative"))
    add_trace!(figs_agg[i], PlotlyJS.scatter(;x=hist_dec_i.date, y=obs_vars[i], mode="lines",
    marker_color="black", name="Empirical values", alpha=0.6, line_width=1.25))
    for tr in figs_agg[i].data 
        tr.fields[:showlegend] = legend_on[i]
        add_trace!(fig_hist_agg, tr, row=i, col=1)
    end
end
relayout!(fig_hist_agg, title_text="Historical decomposition: aggregated", barmode="relative", color="shock")
display(fig_hist_agg)
PlotlyJS.savefig(fig_hist_agg, "fig_hist_agg.pdf")


###################################################################################


##################################################################


