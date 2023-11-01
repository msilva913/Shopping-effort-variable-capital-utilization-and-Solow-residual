clc;
clear;
%% 
addpath c:\dynare\5.4\matlab

%% Baseline model GHH
dynare baseline.mod

%% Simplified model (BRS preferences, immobile capital, with labor supply as observable)
dynare shopping_immobile_BRS_pref_L.mod
%% Simplified model (BRS preferences, immobile capital)
dynare shopping_immobile_BRS_pref.mod

%% Simplified model (immobility of capital)
%dynare shopping_JR_simplified_immobility.mod
%% Simplified model: fix gam = 1 1 (KR preferences)
%dynare shopping_JR_simplified_gam_fixed.mod
%% Shopping model JR preferenes: super simplified (simplified + remove variable capital utilization and adjustment costs)
%dynare shopping_JR_simplified_noadj_cost


%% Shopping model with JR preferences simplified
% only obs: C, TI, Y, SR, p_I
% only shocks: e_ZI, e_Z, e_shop, e_chi, e_TI_ME
%dynare shopping_JR_simplified
%%  Shopping model with Jaimovich-Rebelo preferences
dynare shopping_JR.mod

save('SR', 'SR_obs')
save('SR_util', 'SR_util_obs')
save('Y', 'Y_obs')
save('L', 'L_obs')
save('C', 'C_obs')
save('TI', 'TI_obs')
save('I', 'I')
save('w', 'w_obs')
save('L_C', 'L_C')
save('S_H', 'S_H')
save('p_I', 'p_I_obs' )

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

shock_names = M_.exo_names;
names = M_.endo_names;
Y_pos = find(strcmp(names, 'Y_obs'));
SR_pos = find(strcmp(names, 'SR_obs'));
SR_util_pos = find(strcmp(names, 'SR_util_obs'));
% Endogenous variables x shocks x time
hist_dec = oo_.shock_decomposition;
hist_dec = hist_dec([Y_pos, SR_pos, SR_util_pos], :, :);
save('hist_dec.mat', 'hist_dec')

%Forecast horizons x Endogenous variable x Exogenous variables
CFEVD = oo_.conditional_variance_decomposition
%CFEVD = permute(CFEVD, [2 1 3])
%C_obs,Y_obs, SR_obs, TI_obs, NE, L ;
CFEVD = CFEVD(:, :, 1:(end-2));
save('CFEVD.mat', 'CFEVD')

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

%% Shopping model with JR preferences and no SR_util
dynare shopping_JR_noSRutil.mod

shock_names = M_.exo_names;
names = M_.endo_names;
Y_pos = find(strcmp(names, 'Y_obs'));
SR_pos = find(strcmp(names, 'SR_obs'));
SR_util_pos = find(strcmp(names, 'SR_util_obs'));
% Endogenous variables x shocks x time
hist_dec = oo_.shock_decomposition;
hist_dec = hist_dec([Y_pos, SR_pos, SR_util_pos], :, :);
save('hist_dec_r.mat', 'hist_dec')

%Forecast horizons x Endogenous variable x Exogenous variables
CFEVD = oo_.conditional_variance_decomposition;
%CFEVD = permute(CFEVD, [2 1 3])
%C_obs,Y_obs, SR_obs, TI_obs, NE, L ;
CFEVD = CFEVD(:, :, 1:(end-2));
save('CFEVD_r.mat', 'CFEVD')

% FEVD
FEVD = oo_.variance_decomposition;
save('FEVD.mat', 'FEVD')
% Bayesian IRF's
bayesian_irf = oo_.PosteriorIRF.dsge;
bayesian_irf_mean = bayesian_irf.Mean;
bayesian_irf_lower = bayesian_irf.HPDinf;
bayesian_irf_higher = bayesian_irf.HPDsup;
save('bayesian_irf_mean_r.mat', 'bayesian_irf_mean')
save('bayesian_irf_lower_r.mat', 'bayesian_irf_lower')
save('bayesian_irf_higher_r.mat', 'bayesian_irf_higher')

%% Estimate without any productivity information 
dynare shopping_JR_noSR.mod
%% Shopping model with AR(2) process on labor
dynare shopping_investmentAr2.mod

save('SR', 'SR_obs')
save('SR_util', 'SR_util_obs')
save('Y', 'Y_obs')
save('L', 'L_obs')
save('C', 'C_obs')
save('TI', 'TI_obs')
save('I', 'I')
save('w', 'w_obs')
save('L_C', 'L_C')
save('S_H', 'S_H')
save('p_I', 'p_I_obs' )



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

shock_names = M_.exo_names;
names = M_.endo_names;
Y_pos = find(strcmp(names, 'Y_obs'));
SR_pos = find(strcmp(names, 'SR_obs'));
SR_util_pos = find(strcmp(names, 'SR_util_obs'));
% Endogenous variables x shocks x time
hist_dec = oo_.shock_decomposition;
hist_dec = hist_dec([Y_pos, SR_pos, SR_util_pos], :, :);
save('hist_dec.mat', 'hist_dec')

%Forecast horizons x Endogenous variable x Exogenous variables
CFEVD = oo_.conditional_variance_decomposition
%CFEVD = permute(CFEVD, [2 1 3])
%C_obs,Y_obs, SR_obs, TI_obs, NE, L ;
CFEVD = CFEVD(:, :, 1:(end-2));
save('CFEVD.mat', 'CFEVD')

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

%% Shopping model with investment frictions (missing SR_util)
dynare shopping_investment_noSRutil.mod

shock_names = M_.exo_names;
names = M_.endo_names;
Y_pos = find(strcmp(names, 'Y_obs'));
SR_pos = find(strcmp(names, 'SR_obs'));
SR_util_pos = find(strcmp(names, 'SR_util_obs'));
% Endogenous variables x shocks x time
hist_dec = oo_.shock_decomposition;
hist_dec = hist_dec([Y_pos, SR_pos, SR_util_pos], :, :);
save('hist_dec_r.mat', 'hist_dec')

%Forecast horizons x Endogenous variable x Exogenous variables
CFEVD = oo_.conditional_variance_decomposition;
%CFEVD = permute(CFEVD, [2 1 3])
%C_obs,Y_obs, SR_obs, TI_obs, NE, L ;
CFEVD = CFEVD(:, :, 1:(end-2));
save('CFEVD_r.mat', 'CFEVD')

% FEVD
FEVD = oo_.variance_decomposition;
save('FEVD.mat', 'FEVD')
% Bayesian IRF's
bayesian_irf = oo_.PosteriorIRF.dsge;
bayesian_irf_mean = bayesian_irf.Mean;
bayesian_irf_lower = bayesian_irf.HPDinf;
bayesian_irf_higher = bayesian_irf.HPDsup;
save('bayesian_irf_mean_r.mat', 'bayesian_irf_mean')
save('bayesian_irf_lower_r.mat', 'bayesian_irf_lower')
save('bayesian_irf_higher_r.mat', 'bayesian_irf_higher')
%% Shopping model with investment frictions (includes SR_util and relative price as observables)
%%dynare shopping_investment.mod

%% Full model: Utilization plus government
dynare multisector_2023Feb7.mod
%dynare multisector_2023Feb7EE2.mod
%% Full model with government sector
%dynare multisector_government.mod

save('SR', 'SR_obs')
save('Y', 'Y_obs')
save('L', 'L_obs')
save('C', 'C_obs')
save('TI', 'TI_obs')
save('NE', 'NE_obs')
save('I', 'I')
save('w', 'w_obs')
save('L_C', 'L_C')
save('S_h', 'S_h')



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

shock_names = M_.exo_names;
names = M_.endo_names;
Y_pos = find(strcmp(names, 'Y_obs'));
SR_pos = find(strcmp(names, 'SR_obs'));
NE_pos = find(strcmp(names, 'NE_obs'));
% Endogenous variables x shocks x time
hist_dec = oo_.shock_decomposition;
hist_dec = hist_dec([Y_pos, SR_pos, NE_pos], :, :)
save('hist_dec.mat', 'hist_dec')

%Forecast horizons x Endogenous variable x Exogenous variables
CFEVD = oo_.conditional_variance_decomposition
%CFEVD = permute(CFEVD, [2 1 3])
%C_obs,Y_obs, SR_obs, TI_obs, NE, L ;
CFEVD = CFEVD(:, :, 1:(end-2))
save('CFEVD.mat', 'CFEVD')

% FEVD
FEVD = oo_.variance_decomposition;
save('FEVD.mat', 'FEVD')
% Bayesian IRF's
bayesian_irf = oo_.PosteriorIRF.dsge
bayesian_irf_mean = bayesian_irf.Mean
bayesian_irf_lower = bayesian_irf.HPDinf
bayesian_irf_higher = bayesian_irf.HPDsup
save('bayesian_irf_mean.mat', 'bayesian_irf_mean')
save('bayesian_irf_lower.mat', 'bayesian_irf_lower')
save('bayesian_irf_higher.mat', 'bayesian_irf_higher')
%%
dynare multisector_model_NEME.mod

save('SR', 'SR_obs')
save('Y', 'Y_obs')
save('L', 'L_obs')
save('C', 'C_obs')
save('TI', 'TI_obs')
save('NE', 'NE_obs')
save('I', 'I')
save('w', 'w_obs')
save('L_C', 'L_C')
save('S', 'S')



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

shock_names = M_.exo_names;
names = M_.endo_names;
Y_pos = find(strcmp(names, 'Y_obs'));
SR_pos = find(strcmp(names, 'SR_obs'));
NE_pos = find(strcmp(names, 'NE_obs'));
% Endogenous variables x shocks x time
hist_dec = oo_.shock_decomposition;
hist_dec = hist_dec([Y_pos, SR_pos, NE_pos], :, :)
save('hist_dec.mat', 'hist_dec')

%Forecast horizons x Endogenous variable x Exogenous variables
CFEVD = oo_.conditional_variance_decomposition
%CFEVD = permute(CFEVD, [2 1 3])
%C_obs,Y_obs, SR_obs, TI_obs, NE, L ;
CFEVD = CFEVD(:, :, 1:(end-2))
save('CFEVD.mat', 'CFEVD')

% FEVD
FEVD = oo_.variance_decomposition;
save('FEVD.mat', 'FEVD')
% Bayesian IRF's
bayesian_irf = oo_.PosteriorIRF.dsge
bayesian_irf_mean = bayesian_irf.Mean
bayesian_irf_lower = bayesian_irf.HPDinf
bayesian_irf_higher = bayesian_irf.HPDsup
save('bayesian_irf_mean.mat', 'bayesian_irf_mean')
save('bayesian_irf_lower.mat', 'bayesian_irf_lower')
save('bayesian_irf_higher.mat', 'bayesian_irf_higher')
%%
dynare multisector_model_entry_rev

save('SR', 'SR_obs')
save('Y', 'Y_r')
save('L', 'L_obs')
save('C', 'C_obs')
save('TI', 'TI_obs')
save('NE', 'NE_obs')
save('I', 'I')
save('w', 'w_obs')
save('L_C', 'L_C')

% FEVD
FEVD = oo_.variance_decomposition;
save('FEVD.mat', 'FEVD')
FEVD_unc = oo_.conditional_variance_decomposition;
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

shock_names = M_.exo_names;
names = M_.endo_names;
Y_pos = find(strcmp(names, 'Y_obs'));
SR_pos = find(strcmp(names, 'SR_obs'));
% Endogenous variables x shocks x time
hist_dec = oo_.shock_decomposition;
hist_dec = hist_dec([Y_pos, SR_pos], :, :)
save('hist_dec.mat', 'hist_dec')

%Forecast horizons x Endogenous variable x Exogenous variables
%C, C_obs, Y_obs, Y_r, TI_obs, NE, I, SR_obs, L_C, L, w, Z_C ;
CFEVD = oo_.conditional_variance_decomposition
%CFEVD = permute(CFEVD, [2 1 3])
%C_obs,Y_obs, SR_obs, TI_obs, NE, L ;
CFEVD = CFEVD([1, 2, 3, 5], :, 1:(end-2))
save('CFEVD.mat', 'CFEVD')

% Bayesian IRF's
bayesian_irf = oo_.PosteriorIRF.dsge
bayesian_irf = [bayesian_irf.Mean, bayesian_irf.HPDinf, bayesian_irf.HPDsup]
save('bayesian_irf.mat', 'bayesian_irf')


