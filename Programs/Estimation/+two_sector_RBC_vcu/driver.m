%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'two_sector_RBC_vcu';
M_.dynare_version = '5.4';
oo_.dynare_version = '5.4';
options_.dynare_version = '5.4';
%
% Some global variables initialization
%
global_initialization;
M_.exo_names = cell(1,1);
M_.exo_names_tex = cell(1,1);
M_.exo_names_long = cell(1,1);
M_.exo_names(1) = {'e_Z'};
M_.exo_names_tex(1) = {'e\_Z'};
M_.exo_names_long(1) = {'e_Z'};
M_.endo_names = cell(25,1);
M_.endo_names_tex = cell(25,1);
M_.endo_names_long = cell(25,1);
M_.endo_names(1) = {'p_C'};
M_.endo_names_tex(1) = {'p\_C'};
M_.endo_names_long(1) = {'p_C'};
M_.endo_names(2) = {'p_I'};
M_.endo_names_tex(2) = {'p\_I'};
M_.endo_names_long(2) = {'p_I'};
M_.endo_names(3) = {'P_C'};
M_.endo_names_tex(3) = {'P\_C'};
M_.endo_names_long(3) = {'P_C'};
M_.endo_names(4) = {'C'};
M_.endo_names_tex(4) = {'C'};
M_.endo_names_long(4) = {'C'};
M_.endo_names(5) = {'I'};
M_.endo_names_tex(5) = {'I'};
M_.endo_names_long(5) = {'I'};
M_.endo_names(6) = {'Y'};
M_.endo_names_tex(6) = {'Y'};
M_.endo_names_long(6) = {'Y'};
M_.endo_names(7) = {'c_A'};
M_.endo_names_tex(7) = {'c\_A'};
M_.endo_names_long(7) = {'c_A'};
M_.endo_names(8) = {'r_K'};
M_.endo_names_tex(8) = {'r\_K'};
M_.endo_names_long(8) = {'r_K'};
M_.endo_names(9) = {'w'};
M_.endo_names_tex(9) = {'w'};
M_.endo_names_long(9) = {'w'};
M_.endo_names(10) = {'L_C'};
M_.endo_names_tex(10) = {'L\_C'};
M_.endo_names_long(10) = {'L_C'};
M_.endo_names(11) = {'L_I'};
M_.endo_names_tex(11) = {'L\_I'};
M_.endo_names_long(11) = {'L_I'};
M_.endo_names(12) = {'L'};
M_.endo_names_tex(12) = {'L'};
M_.endo_names_long(12) = {'L'};
M_.endo_names(13) = {'K_C'};
M_.endo_names_tex(13) = {'K\_C'};
M_.endo_names_long(13) = {'K_C'};
M_.endo_names(14) = {'K_I'};
M_.endo_names_tex(14) = {'K\_I'};
M_.endo_names_long(14) = {'K_I'};
M_.endo_names(15) = {'K'};
M_.endo_names_tex(15) = {'K'};
M_.endo_names_long(15) = {'K'};
M_.endo_names(16) = {'lam'};
M_.endo_names_tex(16) = {'lam'};
M_.endo_names_long(16) = {'lam'};
M_.endo_names(17) = {'u'};
M_.endo_names_tex(17) = {'u'};
M_.endo_names_long(17) = {'u'};
M_.endo_names(18) = {'Z'};
M_.endo_names_tex(18) = {'Z'};
M_.endo_names_long(18) = {'Z'};
M_.endo_names(19) = {'Y_obs'};
M_.endo_names_tex(19) = {'Y\_obs'};
M_.endo_names_long(19) = {'Y_obs'};
M_.endo_names(20) = {'C_obs'};
M_.endo_names_tex(20) = {'C\_obs'};
M_.endo_names_long(20) = {'C_obs'};
M_.endo_names(21) = {'TI_obs'};
M_.endo_names_tex(21) = {'TI\_obs'};
M_.endo_names_long(21) = {'TI_obs'};
M_.endo_names(22) = {'p_I_obs'};
M_.endo_names_tex(22) = {'p\_I\_obs'};
M_.endo_names_long(22) = {'p_I_obs'};
M_.endo_names(23) = {'lab_prod_obs'};
M_.endo_names_tex(23) = {'lab\_prod\_obs'};
M_.endo_names_long(23) = {'lab_prod_obs'};
M_.endo_names(24) = {'labor_share'};
M_.endo_names_tex(24) = {'labor\_share'};
M_.endo_names_long(24) = {'labor_share'};
M_.endo_names(25) = {'SR_obs'};
M_.endo_names_tex(25) = {'SR\_obs'};
M_.endo_names_long(25) = {'SR_obs'};
M_.endo_partitions = struct();
M_.param_names = cell(13,1);
M_.param_names_tex = cell(13,1);
M_.param_names_long = cell(13,1);
M_.param_names(1) = {'beta'};
M_.param_names_tex(1) = {'beta'};
M_.param_names_long(1) = {'beta'};
M_.param_names(2) = {'delta_K'};
M_.param_names_tex(2) = {'delta\_K'};
M_.param_names_long(2) = {'delta_K'};
M_.param_names(3) = {'sigma_a_inv'};
M_.param_names_tex(3) = {'sigma\_a\_inv'};
M_.param_names_long(3) = {'sigma_a_inv'};
M_.param_names(4) = {'psi_inv'};
M_.param_names_tex(4) = {'psi\_inv'};
M_.param_names_long(4) = {'psi_inv'};
M_.param_names(5) = {'sigma'};
M_.param_names_tex(5) = {'sigma'};
M_.param_names_long(5) = {'sigma'};
M_.param_names(6) = {'Gamma_bar'};
M_.param_names_tex(6) = {'Gamma\_bar'};
M_.param_names_long(6) = {'Gamma_bar'};
M_.param_names(7) = {'wL_Y'};
M_.param_names_tex(7) = {'wL\_Y'};
M_.param_names_long(7) = {'wL_Y'};
M_.param_names(8) = {'iota'};
M_.param_names_tex(8) = {'iota'};
M_.param_names_long(8) = {'iota'};
M_.param_names(9) = {'scale'};
M_.param_names_tex(9) = {'scale'};
M_.param_names_long(9) = {'scale'};
M_.param_names(10) = {'rho_Z'};
M_.param_names_tex(10) = {'rho\_Z'};
M_.param_names_long(10) = {'rho_Z'};
M_.param_names(11) = {'rho_ZI'};
M_.param_names_tex(11) = {'rho\_ZI'};
M_.param_names_long(11) = {'rho_ZI'};
M_.param_names(12) = {'lambda_1'};
M_.param_names_tex(12) = {'lambda\_1'};
M_.param_names_long(12) = {'lambda_1'};
M_.param_names(13) = {'lambda_2'};
M_.param_names_tex(13) = {'lambda\_2'};
M_.param_names_long(13) = {'lambda_2'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 25;
M_.param_nbr = 13;
M_.orig_endo_nbr = 25;
M_.aux_vars = [];
M_ = setup_solvers(M_);
M_.Sigma_e = zeros(1, 1);
M_.Correlation_matrix = eye(1, 1);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = true;
M_.det_shocks = [];
M_.surprise_shocks = [];
M_.heteroskedastic_shocks.Qvalue_orig = [];
M_.heteroskedastic_shocks.Qscale_orig = [];
options_.linear = true;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
M_.nonzero_hessian_eqs = [];
M_.hessian_eq_zero = isempty(M_.nonzero_hessian_eqs);
M_.orig_eq_nbr = 25;
M_.eq_nbr = 25;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./+' M_.fname '/set_auxiliary_variables.m'], 'file') == 2;
M_.epilogue_names = {};
M_.epilogue_var_list_ = {};
M_.orig_maximum_endo_lag = 1;
M_.orig_maximum_endo_lead = 1;
M_.orig_maximum_exo_lag = 0;
M_.orig_maximum_exo_lead = 0;
M_.orig_maximum_exo_det_lag = 0;
M_.orig_maximum_exo_det_lead = 0;
M_.orig_maximum_lag = 1;
M_.orig_maximum_lead = 1;
M_.orig_maximum_lag_with_diffs_expanded = 1;
M_.lead_lag_incidence = [
 0 4 0;
 0 5 0;
 0 6 0;
 0 7 0;
 0 8 0;
 0 9 0;
 1 10 0;
 0 11 29;
 0 12 0;
 0 13 0;
 0 14 0;
 0 15 0;
 0 16 0;
 0 17 0;
 2 18 0;
 0 19 30;
 0 20 0;
 3 21 0;
 0 22 0;
 0 23 0;
 0 24 0;
 0 25 0;
 0 26 0;
 0 27 0;
 0 28 0;]';
M_.nstatic = 20;
M_.nfwrd   = 2;
M_.npred   = 3;
M_.nboth   = 0;
M_.nsfwrd   = 2;
M_.nspred   = 3;
M_.ndynamic   = 5;
M_.dynamic_tmp_nbr = [2; 0; 0; 0; ];
M_.model_local_variables_dynamic_tt_idxs = {
};
M_.equations_tags = {
  1 , 'name' , 'Variety effect: household' ;
  2 , 'name' , 'Variety effect (investment)' ;
  3 , 'name' , 'Consumption aggregation' ;
  4 , 'name' , 'Labor C' ;
  5 , 'name' , 'Labor in I' ;
  6 , 'name' , 'Capital in C' ;
  7 , 'name' , 'Capital in I' ;
  8 , 'name' , 'Labor intratemporal' ;
  9 , 'name' , 'Capital accumulation (consumption)' ;
  10 , 'name' , 'Consumption multiplier' ;
  11 , 'name' , 'Euler equation of capital (C))' ;
  12 , 'name' , 'Capital utilization (C)' ;
  13 , 'name' , 'Relative price of investment' ;
  14 , 'name' , 'C production' ;
  15 , 'name' , 'I production' ;
  16 , 'name' , 'Labor composition' ;
  17 , 'name' , 'Capital composition' ;
  18 , 'name' , 'Aggregate accounting (income = expenditures)' ;
  19 , 'name' , 'Z' ;
  20 , 'name' , 'C_obs' ;
  21 , 'name' , 'TI_obs' ;
  22 , 'name' , 'Y_obs' ;
  23 , 'name' , 'SR_obs' ;
  24 , 'name' , 'lab_prod_obs' ;
  25 , 'name' , 'labor_share' ;
};
M_.mapping.p_C.eqidx = [1 13 14 20 22 ];
M_.mapping.p_I.eqidx = [2 ];
M_.mapping.P_C.eqidx = [1 3 10 ];
M_.mapping.C.eqidx = [3 4 14 18 20 22 ];
M_.mapping.I.eqidx = [5 9 15 18 21 22 ];
M_.mapping.Y.eqidx = [18 ];
M_.mapping.c_A.eqidx = [3 10 ];
M_.mapping.r_K.eqidx = [6 7 11 12 ];
M_.mapping.w.eqidx = [4 5 6 7 8 25 ];
M_.mapping.L_C.eqidx = [4 6 14 16 ];
M_.mapping.L_I.eqidx = [5 7 15 16 ];
M_.mapping.L.eqidx = [8 16 23 24 25 ];
M_.mapping.K_C.eqidx = [6 14 17 ];
M_.mapping.K_I.eqidx = [7 15 17 ];
M_.mapping.K.eqidx = [9 17 23 ];
M_.mapping.lam.eqidx = [8 10 11 ];
M_.mapping.u.eqidx = [6 7 9 12 14 15 ];
M_.mapping.Z.eqidx = [14 15 19 ];
M_.mapping.Y_obs.eqidx = [22 23 24 25 ];
M_.mapping.C_obs.eqidx = [20 ];
M_.mapping.TI_obs.eqidx = [21 ];
M_.mapping.p_I_obs.eqidx = [13 ];
M_.mapping.lab_prod_obs.eqidx = [24 ];
M_.mapping.labor_share.eqidx = [25 ];
M_.mapping.SR_obs.eqidx = [23 ];
M_.mapping.e_Z.eqidx = [19 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [7 15 18 ];
M_.exo_names_orig_ord = [1:1];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(25, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(13, 1);
M_.endo_trends = struct('deflator', cell(25, 1), 'log_deflator', cell(25, 1), 'growth_factor', cell(25, 1), 'log_growth_factor', cell(25, 1));
M_.NNZDerivatives = [83; 0; -1; ];
M_.static_tmp_nbr = [2; 0; 0; 0; ];
M_.model_local_variables_static_tt_idxs = {
};
M_.params(1) = 0.993;
beta = M_.params(1);
M_.params(4) = 0.72;
psi_inv = M_.params(4);
M_.params(5) = 1.0;
sigma = M_.params(5);
M_.params(8) = 0.0;
iota = M_.params(8);
M_.params(11) = 0.979;
rho_ZI = M_.params(11);
M_.params(10) = 0.979;
rho_Z = M_.params(10);
M_.params(12) = 0.979;
lambda_1 = M_.params(12);
M_.params(13) = 0.0;
lambda_2 = M_.params(13);
M_.params(7) = 0.667;
wL_Y = M_.params(7);
M_.params(2) = 0.04325;
delta_K = M_.params(2);
M_.params(6) = 1.1;
Gamma_bar = M_.params(6);
M_.params(3) = 3.125;
sigma_a_inv = M_.params(3);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = 0.0072;
options_.irf = 100;
options_.nofunctions = true;
options_.order = 1;
options_.periods = 0;
options_.conditional_variance_decomposition = [1;4;8;40;];
var_list_ = {'C_obs';'TI_obs';'Y_obs';'lab_prod_obs';'labor_share';'L_C';'L_I';'L';'p_I_obs'};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'two_sector_RBC_vcu_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'two_sector_RBC_vcu_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'two_sector_RBC_vcu_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'two_sector_RBC_vcu_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'two_sector_RBC_vcu_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'two_sector_RBC_vcu_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'two_sector_RBC_vcu_results.mat'], 'oo_recursive_', '-append');
end
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
