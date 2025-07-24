clc;
clear;
addpath c:\dynare\6.3\matlab

%% ========================================================================
%% MODEL FILES USED
%   - BRS_sectoral.mod 
%   - BRS_sectoral_perfect_mobility.mod
%   - BRS_sectoral_com_wage_markup.mod
%   - BRS_sectoral_wo_fixed_cost.mod
%   - BRS_sectoral_wo_vcu.mod
%   - BRS_sectoral_wo_demand_shocks.mod
%   - BRS_sectoral_wo_dem_shocks_res.mod
%   - BRS_growth_id.mod
%   - BRS_util.mod
%   - BRS_sectoral_artificial_data.mod
%% ========================================================================

%% ========================================================================
%% 1. MAIN MODEL: Estimate with sectoral data
% ------------------------------------------------------------------------
dynare BRS_sectoral.mod

% Save results for further use
res = oo_;
M = M_;
save('res', 'res');
save('M', 'M');

% Collect indices for selected variables
var_labels = {'NC_obs', 'NI_obs', 'C_obs', 'I_obs', 'p_I_obs', 'util_ND_obs', 'util_D_obs'};
indices = [];
for i = 1:length(var_labels)
    idx = strmatch(var_labels{i}, M.endo_names, 'exact');
    indices = vertcat(indices, idx);
end

% Extract artificial data
sim = res.endo_simul';
sim = sim(:, indices);
NC_obs      = sim(:, 1);
NI_obs      = sim(:, 2);
C_obs       = sim(:, 3);
I_obs       = sim(:, 4);
p_I_obs     = sim(:, 5);
util_ND_obs = sim(:, 6);
util_D_obs  = sim(:, 7);
% save('artificial_data.mat', 'NC_obs', 'NI_obs', 'C_obs', 'I_obs', 'p_I_obs', 'util_ND_obs', 'util_D_obs');

% Save posterior summaries
posterior_density = res.posterior_density.parameters;
posterior_mode    = res.posterior_mode.parameters;
posterior_mean    = res.posterior_mean.parameters;
save('posterior_density', 'posterior_density')
save('posterior_mode', 'posterior_mode');
save('posterior_mean', 'posterior_mean');

% Calculate moments and variance decompositions
mom_bas = calc_moments(res); save('mom_bas', 'mom_bas');
FEVD_table = FEVD_sum(res, M, 'growth');
FEVD_dem   = decompose_demand(res, M);
FEVD_tech  = decompose_technology(res, M);
[out, HPD] = main_table(res, M);

% Save smoothed variables and IRFs
sv  = res.SmoothedVariables; save('sv', 'sv')
irf = res.irfs; save('irf.mat', 'irf');
%% ========================================================================

%% ========================================================================
%% 2. ALTERNATIVE SPECIFICATION: Perfect mobility
% ------------------------------------------------------------------------
dynare BRS_sectoral_perfect_mobility.mod
res_pm = oo_; M_pm = M_;
save('res_pm', 'res_pm'); save('M_pm', 'M_pm');
[out_pm, HPD_pm] = main_table(res_pm, M_pm);
%% ========================================================================

%% ========================================================================
%% 3. ALTERNATIVE: Common wage markup shock
% ------------------------------------------------------------------------
dynare BRS_sectoral_com_wage_markup.mod
res_cwm = oo_; M_cwm = M_;
save('res_cwm', 'res_cwm'); save('M_cwm', 'M_cwm');
[out_cwm, HPD_cwm] = main_table(res_cwm, M_cwm);
%% ========================================================================

%% ========================================================================
%% 4. ALTERNATIVE: Remove fixed cost
% ------------------------------------------------------------------------
dynare BRS_sectoral_wo_fixed_cost.mod
res_wo_fc = oo_; M_wo_fc = M_;
save('res_wo_fc', 'res_wo_fc'); save('M_wo_fc', 'M_wo_fc');
[out_wo_fc, HPD_wo_fc] = main_table(res_wo_fc, M_wo_fc);
%% ========================================================================

%% ========================================================================
%% 5. ALTERNATIVE: Remove VCU
% ------------------------------------------------------------------------
dynare BRS_sectoral_wo_vcu.mod
res_wo_vcu = oo_; M_wo_vcu = M_;
save('res_wo_vcu', 'res_wo_vcu'); save('M_wo_vcu', 'M_wo_vcu');
[out_wo_vcu, HPD_wo_vcu] = main_table(res_wo_vcu, M_wo_vcu);
%% ========================================================================

%% ========================================================================
%% 6. ALTERNATIVE: Remove demand shocks
% ------------------------------------------------------------------------
dynare BRS_sectoral_wo_demand_shocks.mod
res_wo_dem = oo_; M_wo_dem = M_;
save('res_wo_dem', 'res_wo_dem'); save('M_wo_dem', 'M_wo_dem');
[out_wo_dem, HPD_wo_dem] = main_table(res_wo_dem, M_wo_dem);
%% ========================================================================

%% ========================================================================
%% 7. ALTERNATIVE: Remove utilization (fit without utilization)
% ------------------------------------------------------------------------
dynare BRS_sectoral_wo_dem_shocks_res.mod
res_wo_dem_shock_res = oo_; M_wo_dem_shock_res = M_;
save('res_wo_dem_shock_res', 'res_wo_dem_shock_res');
save('M_wo_dem_shock_res', 'M_wo_dem_shock_res');
mom_wo_dem_shock_res = calc_moments(res_wo_dem_shock_res);
[out_wo_dem_shock_res, HPD_wo_dem_shock_res] = main_table(res_wo_dem_shock_res, M_wo_dem_shock_res);
%% ========================================================================

%% ========================================================================
%% 8. ESTIMATE MAIN MODEL ON ARTIFICIAL DATA
% ------------------------------------------------------------------------
dynare BRS_sectoral_artificial_data.mod
res_art = oo_; M_art = M_;
save('res_art', 'res_art'); save('M_art', 'M_art');

% Load true parameter values from main model estimation
load res.mat

summ_tables = cell(2, 1);
parameter_types = {'parameters', 'shocks_std'};
for j = 1:2
    p = parameter_types{j};
    HPD_inf = getfield(res_art.posterior_hpdinf, p);
    posterior_median = getfield(res_art.posterior_median, p);
    HPD_sup = getfield(res_art.posterior_hpdsup, p);

    HPD_inf_array = cell2mat(struct2cell(HPD_inf));
    posterior_median_array = cell2mat(struct2cell(posterior_median));
    HPD_sup_array = cell2mat(struct2cell(HPD_sup));

    true_values = getfield(res.posterior_mean, p);
    true_values_array = cell2mat(struct2cell(true_values));

    fields = fieldnames(HPD_inf);
    cols = [true_values_array, posterior_median_array, HPD_inf_array, HPD_sup_array];

    col_names = ["True value", "Median", "5%", "95%"];
    summ_tables{j} = array2table(cols, 'RowNames', fields, 'VariableNames', col_names);
end

format short;
table_ident = vertcat(summ_tables{1}, summ_tables{2});
%% ========================================================================

%% ========================================================================
%% 9. PROOF OF CONCEPT: Simple BRS Models
% ------------------------------------------------------------------------

% (a) Basic BRS: Estimate phi and eta
dynare BRS_growth_id.mod

% (b) BRS with utilization data
dynare BRS_util.mod

%% ========================================================================
