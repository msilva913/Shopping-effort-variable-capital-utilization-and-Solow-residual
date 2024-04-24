clc;
clear;
addpath c:\dynare\5.4\matlab
%% Main model estimated with sectoral data 
%%
dynare BRS_sectoral.mod
res = oo_;
M = M_;
save('res', 'res');
save('M', 'M');

mom_bas = calc_moments(res)
save('mom_bas', 'mom_bas')
% Main output
out, HPD = main_tables(res);

% var_cov = 100^2*oo_.var;
% vars = diag(var_cov); % Diagonal of variances
% var_array = [];
% var_names = {'SR_obs', 'util_obs', 'D_obs', 'h_obs'};
% % Populate variances
% for i = 1:length(var_names)
%     x = var_names{i};
%     index = strcmp(x, oo_.var_list);
%     var_x = vars(index);
%     var_array = vertcat(var_array, var_x)
% end
% 
% targets = [0.99, 11, 0.20, 0.67, 0.0045];
% [delta, r, sigma_b, alpha_K, alpha_N]  = dependent_parameters(posterior_means.parameters, targets);
% 
% ratio_util = var_array(2)/var_array(1);
% ratio_D = phi^2*var_array(3)/var_array(2);
% ratio_h = alpha_K^2*(1+nu_R)^2*var_array(4)/var_array(2);
% 
% index_D = strcmp('D_obs', oo_.var_list);
% index_h = strcmp('h_obs', oo_.var_list);
% var_cov(index_D, index_h); % negative variance covariance

%% Remove fixed cost
dynare BRS_sectoral_wo_fixed_cost.mod
%% Remove vcu
dynare BRS_sectoral_wo_vcu.mod
res_wo_vcu = oo_;
M_wo_vcu = M_;
save('res_wo_vcu', 'res_wo_vcu');
save('M_wo_vcu', 'M_wo_vcu');
[out, HPD] = main_table(res_wo_vcu, M_wo_vcu);

%% Remove search demand shocks

%% Remove goods market frictions
dynare BRS_sectoral_wo_gmf.mod


%% Proof of concept exercise in BRS
%% Basic BRS (general replication)
%dynare BRS_growth.mod

%% Basic BRS: estimate phi and eta
dynare BRS_growth_id.mod
%% estimate BRS with utilization
dynare BRS_util.mod 
% save('SR', 'SR_obs')
% save('SR_util', 'SR_util_obs')
% save('Y', 'Y_obs')
% save('L', 'L_obs')
% save('C', 'C_obs')
% save('TI', 'TI_obs')
% save('I', 'I')
% save('w', 'w_obs')
% save('L_C', 'L_C')
% save('S_H', 'S_H')
% save('p_I', 'p_I_obs' )

% Prior density
prior = oo_.prior_density.parameters;
prior_shocks = oo_.prior_density.shocks_std;
save('prior.mat', 'prior')
save('prior_shocks.mat', 'prior_shocks')

% % Posterior distribution
% Density
posterior = oo_.posterior_density.parameters;
posterior_shocks = oo_.posterior_density.shocks_std;

save('posterior.mat', 'posterior')
save('posterior_shocks.mat', 'posterior_shocks')

% Prior means and stds
prior_mean = oo_.prior.mean;
prior_std = sqrt(diag(oo_.prior.variance));
save('prior_mean.mat', 'prior_mean')
save('prior_std.mat', 'prior_std')

% Mean
posterior_mean = oo_.posterior_mean.parameters;
posterior_mean_shocks = oo_.posterior_mean.shocks_std;

save('posterior_mean.mat', 'posterior_mean')
save('posterior_mean_shocks.mat', 'posterior_mean_shocks')

% Std
posterior_std = oo_.posterior_std.parameters;
posterior_std_shocks = oo_.posterior_std.shocks_std;

save('posterior_std.mat', 'posterior_std')
save('posterior_std_shocks.mat', 'posterior_std_shocks')

%shock_names = M_.exo_names;
%names = M_.endo_names;
%Y_pos = find(strcmp(names, 'Y_obs'));
%SR_pos = find(strcmp(names, 'SR_obs'));
%SR_util_pos = find(strcmp(names, 'SR_util_obs'));
%Endogenous variables x shocks x time
% hist_dec = oo_.shock_decomposition;
% hist_dec = hist_dec([Y_pos, SR_pos, SR_util_pos], :, :);
% save('hist_dec.mat', 'hist_dec')

%Forecast horizons x Endogenous variable x Exogenous variables
CFEVD = oo_.conditional_variance_decomposition;
%CFEVD = permute(CFEVD, [2 1 3])
%C_obs,Y_obs, SR_obs, TI_obs, NE, L ;
%CFEVD = CFEVD(:, :, 1:(end-2));
save('CFEVD.mat', 'CFEVD');

% Impulse responses stoch_sim
irf = oo_.irfs
save('irf.mat', 'irf')
% FEVD
FEVD = oo_.variance_decomposition;
save('FEVD.mat', 'FEVD')
% Bayesian IRF's
bayesian_irf = oo_.PosteriorIRF.dsge;
bayesian_irf_mean = bayesian_irf.Mean;
bayesian_irf_lower = bayesian_irf.HPDinf;
bayesian_irf_higher = bayesian_irf.HPDsup;
save('bayesian_irf_mean.mat', 'bayesian_irf_mean')
save('bayesian_irf_lower.mat', 'bayesian_irf_lower')
save('bayesian_irf_higher.mat', 'bayesian_irf_higher')
