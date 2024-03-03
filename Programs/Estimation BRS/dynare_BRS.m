clc;
clear;
%% 
addpath c:\dynare\5.4\matlab
dynare RBC_growth.mod
%%
dynare BRS_growth.mod
% Impulse responses
irf = oo_.irfs;
save('irf.mat', 'irf')
%% Estimate with sectoral data
dynare BRS_growth_util_sectoral.mod
%%


%% Estimate sectoral data, separable preferences
dynare BRS_growth_util_sectoral_separable_alt.mod
%dynare BRS_growth_util_sectoral_exc.mod
%% Intersector labor market friction
dynare BRS_imp_mobility.mod

%% Estimate intersectoral labor market friction with new g. Estimate gam
dynare BRS_imp_mobility_est.mod
% Too high volatility



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
