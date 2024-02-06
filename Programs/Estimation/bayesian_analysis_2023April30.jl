
using PyPlot
using LaTeXStrings
using CSV, ArgParse
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
cd(raw"C:\Users\msilva913\Dropbox\Documents - Copy\Research\Consumption diversity, entry, and goods market frictions\Programs\Estimation")
#cd(raw"C:\Users\TJSEM\Dropbox\Documents - Copy\Research\Consumption diversity, entry, and goods market frictions\Programs\Estimation")
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
dates = range(Date(1960, 1, 1), step=Dates.Quarter(1), stop=Date(2022, 12, 31))
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
shock_labels = [:Consumption_tech, :Investment_tech, :Common_tech, 
            :Shopping_disutility, :Investment_shopping, :Common_shopping,
            :Intratemporal_preference, :Discount_factor, :Labor_supply, :Gov_expenditure,
            :e_w_ME, :e_TI_ME, :e_L_ME, :Initial_values, :Smoothed_values]
shock_labels = shock_labels[1:(end-5)]
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
# Conditional forecast error variance decomposition
function new_2s(a, i)
    i2s = CartesianIndices(a)
    return i2s[i]
end

#C_obs,Y_obs, SR_obs, TI_obs, NE, L ;
x = matopen("CFEVD.mat")
CFEVD = read(x, "CFEVD")
#CFEVD = permutedims(CFEVD, [2 1 3])
# Order follows declaration of stoch_simul
CFEVD = CFEVD[[2, 3, 4, 5], :, :]
labels = ["Output" "Solow residual"; "Solow residual: utilization adjusted"  "Investment"]

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
key_map = ["ψ", "ψ_C", "λ_1", "ρ_b", "ε", "γ", "ρ_ZI", "ρ_θ", "σ", "ψ_I", "Ψ_K", "ρ_ZC", 
"ε_i", "var_share", "λ_2", "ϕ", "ρ_κ", "ρ_ζ", "ρ_g"]

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
key_map_shocks = ["e_χ", "e_ZI", "e_L_ME", "e_kappa", "e_TI_ME", "e_shop", "e_w_ME", "e_b",
"e_Z", "e_θ", "e_ZC", "e_ζ", "e_g"]
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
    ax.set_xlim(left=mean-4*std)
    #right=min(maximum(val_prior[:, 1]), mean+2*std))
    ax.fill_between(val[:, 1], 0, val[:, 2], alpha=0.3)
    #ax.fill_between(val[:, 1], val_prior[:, 2], val[:, 2])
    ax.legend(loc="upper right")
end
display(fig)
plt.savefig("posterior_prior_shock.pdf")

#########################

dist_dic = Dict(
    "ψ" => "Gamma",
    "ψ_C" => "Beta",
    "λ_1" => "Beta", 
    "ρ_b" => "Beta",
    "ε"  => "Gamma",
    "ρ_{ZI}" => "Beta",
    #"h"    => "Beta",
    "γ" => "Beta",
    "ρ_{θ}" => "Beta",
    "σ" => "Gamma",
    "ψ_I" => "Beta", 
    "Ψ_K" => "Gamma",
    "ρ_{ZC}" => "Beta",
    "ε_i" => "Gamma",
    "var_share" => "Beta",
    "λ_2" => "Beta", 
    #"γ_{shop}" => "Normal",
    "ϕ" => "Beta",
    "ρ_{κ}" => "Beta",
    "ρ_{ζ}" => "Beta",
    "ρ_g" => "Beta"
)

post_means = collect(values(posterior_mean_struc))
post_stds = collect(values(posterior_std_struc))
#params = keys(posterior_mean_struc)
key_map = ["ψ", "ψ_C", "λ_1", "ρ_b", "ε", "γ", "ρ_{ZI}", "ρ_{θ}", "σ", "ψ_I", "Ψ_K", "ρ_{ZC}", 
"ε_i", "var_share", "λ_2", "ϕ", "ρ_{κ}", "ρ_{ζ}", "ρ_g"]


prior_shocks = ["σ", "ψ", "ε", "ε_i", "ϕ", "Ψ_K", "γ", "ψ_C", "ψ_I", "var_share", "ρ_{ZC}", "ρ_{ZI}",
    "ρ_{θ}", "ρ_b", "ρ_{κ}", "ρ_{ζ}", "ρ_g", "λ_1", "λ_2"]
prior_means_dic = Dict( zip(prior_shocks, prior_mean[14:end]))
prior_mean_vals = getindex.(Ref(prior_means_dic), key_map)

prior_stds_dic = Dict( zip(prior_shocks, prior_std[14:end]))
prior_stds_vals = getindex.(Ref(prior_stds_dic), key_map)


#dist = collect(values(dist_dic))
dist = getindex.(Ref(dist_dic), key_map)
#Table of prior-posterior estimates 
summ = [key_map dist prior_mean_vals post_means prior_stds_vals  post_stds ]
summ_dat = DataFrame(summ, :auto)
summ_dat[:, 3:end] = round.(summ_dat[:,3:end], digits=3)
#DataFrames.rename!(summ_dat, [:Parameter, :Distribution, :Prior_mean, :Posterior_mean, :Prior_stds, :Posterior_std])
DataFrames.rename!(summ_dat, [:Parameter, :Distribution, :Prior_mean, :Posterior_mean, :Prior_std, :Posterior_std])
print(summ_dat)

# Create Latex Table 
tab1 = latexify(summ_dat[:, 1:2], env=:tabular, latex=false)
tab2 = latexify(summ_dat[:,3:end], env=:tabular)


### Conditional standard deviations 
post_means = collect(values(posterior_mean_struc_shocks))
post_stds = collect(values(posterior_std_struc_shocks))

key_map_shocks = ["e_{χ}", "e_{ZI}", "e_L_ME", "e_κ", "e_TI_ME", "e_shop", "e_w_ME", "e_b",
"e_Z", "e_{θ}", "e_{ZC}", "e_{ζ}", "e_g"]

dist_shocks = fill("Inverse Gamma", 13)
summ = [key_map_shocks dist_shocks prior_mean[1:13] post_means prior_std[1:13] post_stds ]
summ_dat = DataFrame(summ, :auto)
summ_dat[:, 3:end] = round.(summ_dat[:,3:end], digits=3)
#DataFrames.rename!(summ_dat, [:Parameter, :Distribution, :Prior_mean, :Posterior_mean, :Prior_stds, :Posterior_std])
DataFrames.rename!(summ_dat, [:Parameter, :Distribution, :Prior_mean, :Posterior_mean, :Prior_std, :Posterior_std])

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

key_vars = ["C_obs", "TI_obs", "Y_obs", "L", "SR_obs", "SR_util_obs", "S_H", "p_I_obs"]
key_shocks = ["e_Z", "e_ZC", "e_ZI", "e_zeta", "e_kappa", "e_shop", "e_theta", "e_b", "e_chi", "e_g"]

# From variance decomposition, we focus on 
#-- consumption tech shock (important for consumption and output)
#-- entry tech shock (important for entry and Solow residual)
#-- shopping disutility shock (consumption and Solow residual)
#-- intratemporal preference (consumption and output)

function bayesian_irf_fun(key_shock; savefig=true)
    # Fix shock type and loop over variables in key_vars
    fig = plt.figure(figsize=(20, 10))
    periods = 1:40
    for (i, key) in enumerate(key_vars)
        str = key*"_"*key_shock
        print(str)
        mean = 100*bayesian_irf_mean[str][:,1]
        high = 100*bayesian_irf_high[str][:,1]
        low = 100*bayesian_irf_low[str][:,1]
        ax = fig.add_subplot(2, 4, i)
        ax.plot(periods, mean, linewidth=2, color="black")
        ax.plot(periods, high, linewidth=0.5)
        ax.plot(periods, low, linewidth=0.5)
        ax.fill_between(periods, low, high, alpha=0.3, facecolor="teal")
        ax.tick_params(labelsize=12)
        vals = ax.get_yticks()
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
irf_e_Z = bayesian_irf_fun("e_Z")
# Consumption technology
irf_e_ZC = bayesian_irf_fun("e_ZC")

# Common shopping shock
irf_e_shop = bayesian_irf_fun("e_shop")
# Household shopping disutility shock
#irf_e_kappa = bayesian_irf_fun("e_kappa")

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

##################################################################


