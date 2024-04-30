function [out, HPD] = main_table(res, M)
% Generates main output
 %1) Marginal density
 marginal_density = res.MarginalDensity.LaplaceApproximation;

%2) Posterior probability band
 % Access the posterior density samples
HPD_inf = res.posterior_hpdinf.parameters;
posterior_median = res.posterior_median.parameters;
HPD_sup = res.posterior_hpdsup.parameters;
HPD = [HPD_inf.phi, posterior_median.phi, HPD_sup.phi];

% Display the 90% HPDI
%disp(['Lower bound of 90% HPDI: ', num2str(lower_quantile)]);
%disp(['Upper bound of 90% HPDI: ', num2str(upper_quantile)]);

%3) FEVD
index_Y = strcmp('Y_obs', res.var_list);
index_SR = strcmp('SR_obs', res.var_list);

vd = res.variance_decomposition;
shock_names = M.exo_names;
demand_shocks = {'e_D', 'e_D_news', 'e_DI', 'e_DI_news'};
FEVD_Y = 0.0;
FEVD_SR = 0.0;

 for i = 1:length(demand_shocks)
    shock_indices = strcmp(demand_shocks{i},shock_names);
    FEVD_Y = FEVD_Y + vd(index_Y, shock_indices);
    FEVD_SR = FEVD_SR + vd(index_SR, shock_indices);
 end


 % Var(util)/Var(SR)
var_cov = res.var;
vars = diag(var_cov);
var_names = {'SR_obs', 'util_obs'};
var_array = [];
% Populate variances
for i = 1:length(var_names)
    x = var_names{i};
    index = strcmp(x, res.var_list);
    var_x = vars(index);
    var_array = vertcat(var_array, var_x);
end
ratio_util = var_array(2)/var_array(1);
    
% General standard deviations
std_vars = {'Y_obs', 'util_ND_obs', 'util_D_obs', 'NC_obs', 'NI_obs'};
std_array = [];
std_devs = sqrt(vars);
    
for i = 1:length(std_vars)
    x = std_vars{i}
    index = strcmp(x, res.var_list);
    std_x = std_devs(index);
    std_array = vertcat(std_array, std_x);
end
    
   
corr_pairs = {'C_obs', 'I_obs'; 'util_ND_obs', 'util_D_obs'; 'NC_obs', 'NI_obs'};

correlations = zeros(size(corr_pairs, 1), 1);
for i = 1:size(corr_pairs, 1)
    variable1 = corr_pairs{i, 1};
    variable2 = corr_pairs{i, 2};

    % Find the indices of the variables in the var_cov_matrix
    index1 = strcmp(variable1, res.var_list);
    index2 = strcmp(variable2, res.var_list);

    % Compute the correlation using the variance-covariance matrix
    correlation = var_cov(index1, index2) / sqrt(var_cov(index1, index1) * var_cov(index2, index2));
    correlations(i) = correlation;
end

% Autocorrelations
autocorr_vars = {'util_ND_obs', 'util_D_obs'}
    autocorr_array = zeros(length(autocorr_vars), 1);
    autocorrs_input = res.autocorr{1};
    for i = 1:length(autocorr_vars)
        x = autocorr_vars{i}
        index = strcmp(x, res.var_list);
        % Compute the autocorrelation using the variance-covariance matrix
        autocorr = autocorrs_input(index, index);
        autocorr_array(i) = autocorr;
    end

    out = vertcat(marginal_density, FEVD_Y, FEVD_SR, ratio_util, 100*std_array, correlations, autocorr_array);
    %format long g
    round(out, 3);
end