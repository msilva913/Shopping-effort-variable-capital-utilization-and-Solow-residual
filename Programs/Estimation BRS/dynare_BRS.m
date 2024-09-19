clc;
clear;
addpath c:\dynare\5.4\matlab
%% Make preferences GHH in consumption, shopping effort, and labor supply

%% Main model estimated with sectoral data 
%%
dynare BRS_sectoral.mod
load res
load M
res = oo_;
M = M_;
save('res', 'res');
save('M', 'M');

posterior_mode = res.posterior_mode.parameters;
save('posterior_mode', 'posterior_mode');
mom_bas = calc_moments(res);
save('mom_bas', 'mom_bas');
% Main output
FEVD_table = FEVD_sum(res, M, 'growth');
FEVD_table_level = FEVD_sum(res, M, 'level');
% Decompose FEVD of demand and technology into components
FEVD_dem = decompose_demand(res, M);
FEVD_tech = decompose_technology(res, M)
[out, HPD] = main_table(res, M);

% Impulse responses
irf = res.irfs;
save('irf.mat', 'irf');

% Smoothed variables
smoothed_var = res.SmoothedVariables;
save('smoothed_var','smoothed_var')

% CFEVD
tables = CFEVD_sum(res, M, 'level');
%C_obs,Y_obs, SR_obs, TI_obs, NE, L ;
%CFEVD = CFEVD(:, :, 1:(end-2));
save('CFEVD.mat', 'CFEVD');
%% Remove fixed cost
dynare BRS_sectoral_wo_fixed_cost.mod
load res_wo_fc 
load M_wo_fc
res_wo_fc = oo_;
M_wo_fc = M_;
save('res_wo_fc', 'res_wo_fc');
save('M_wo_fc', 'M_wo_fc');
%mom_bas = calc_moments(res);
%save('mom_bas', 'mom_bas');
% Main output
FEVD_table = FEVD_sum(res_wo_fc, M_wo_fc);
[out, HPD] = main_table(res_wo_fc, M_wo_fc);
%% Remove vcu
dynare BRS_sectoral_wo_vcu.mod
load res_wo_vcu
load M_wo_vcu
res_wo_vcu = oo_;
M_wo_vcu = M_;
save('res_wo_vcu', 'res_wo_vcu');
save('M_wo_vcu', 'M_wo_vcu');
[out, HPD] = main_table(res_wo_vcu, M_wo_vcu);

%% Remove search demand shocks
dynare BRS_sectoral_wo_demand_shocks.mod 
load res_wo_dem
load M_wo_dem
res_wo_dem = oo_;
M_wo_dem = M_;
save('res_wo_dem', 'res_wo_dem');
save('M_wo_dem', 'M_wo_dem');
mom_wo_dem = calc_moments(res_wo_dem)
[out, HPD] = main_table(res_wo_dem, M_wo_dem);
FEVD_table = FEVD_sum(res_wo_dem, M_wo_dem, '');
%% Examine ability to fit data without utilization
dynare BRS_sectoral_KK.mod 
load res_KK
load M_KK
res_KK = oo_;
M_KK = M_;
save('res_KK', 'res_KK');
save('M_KK', 'M_KK');
%load res_KK.mat
mom_KK = calc_moments(res_KK);
[out, HPD] = main_table(res_KK, M_KK);
FEVD_table = FEVD_sum(res_KK, M_KK, '');

%% Estimate general model but with fitting cross sectional price dispersion
dynare BRS_price_dispersion.mod

res_pd = oo_;
M_pd = M_;
save('res_pd', 'res_pd');
save('M_pd', 'M_pd');
load res_pd
load M_pd
posterior_mean = res_pd.posterior_mean.parameters;

% Main output
FEVD_table = FEVD_sum(res_pd, M_pd, 'growth');

[out, HPD] = main_table(res_pd, M_pd, '');

HPD_inf = res_pd.posterior_hpdinf.parameters;
posterior_median = res_pd.posterior_median.parameters;
HPD_sup = res_pd.posterior_hpdsup.parameters;
HPD_eta = [HPD_inf.eta, posterior_median.eta, HPD_sup.eta];

m = 0.15/0.524;
HPD_phi = (HPD_eta+1)*m./(1+HPD_eta*m);
HPD = [HPD_eta; HPD_phi]
%% Estimate main model on artificial data
dynare BRS_sectoral_artificial_data.mod 
res_art = oo_;
M_art = M_;
save('res_art', 'res_art');
save('M_art', 'M_art');
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
    
    % True values
    true_values = getfield(res.posterior_mean, p);
    true_values_array = cell2mat(struct2cell(true_values));

    % Field names
    fields = fieldnames(HPD_inf);
    cols = [true_values_array posterior_median_array  HPD_inf_array  HPD_sup_array];

    col_names = ["True value", "Median", "5%", "95%"];
    summ_tables{j} = array2table(cols, 'RowNames', fields, 'VariableNames', col_names);
end

format short;
table_ident = vertcat(summ_tables{1}, summ_tables{2})
%% Proof of concept exercise in BRS
%% Basic BRS (general replication)
%dynare BRS_growth.mod

%% Basic BRS: estimate phi and eta
dynare BRS_growth_id.mod
%% estimate BRS with utilization data
dynare BRS_util.mod 

