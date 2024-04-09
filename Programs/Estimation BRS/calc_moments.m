function [moments] = calc_moments(res)
    %Calculate summary standard deviations, correlations, and autocorrelations
    
    std_vars = {'C_obs', 'I_obs', 'NC_obs', 'NI_obs', 'p_I_obs', 'util_ND_obs', 'util_D_obs'};
    var_cov = res.var;
    std_array = [];
    std_devs = sqrt(diag(var_cov));
    
    for i = 1:length(std_vars)
        x = std_vars{i}
        index = strcmp(x, res.var_list);
        std_x = std_devs(index)
        std_array = vertcat(std_array, std_x)
    end

    corr_pairs = {'C_obs', 'I_obs'; 'C_obs', 'NI_obs'; 'NC_obs', 'NI_obs'; 'C_obs', 'Y_N_obs'; 'util_ND_obs', 'util_D_obs'; 'p_I_obs', 'I_obs'}
    
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
    
    autocorr_vars = {'NC_obs', 'NI_obs'}
    autocorr_array = zeros(length(autocorr_vars), 1);
    autocorrs_input = res.autocorr{1};
    for i = 1:length(autocorr_vars)
        x = autocorr_vars{i}
        index = strcmp(x, res.var_list);
        % Compute the autocorrelation using the variance-covariance matrix
        autocorr = autocorrs_input(index, index);
        autocorr_array(i) = autocorr;
    end

    moments = vertcat(100*std_array, correlations, autocorr_array);
    moments = round(moments, 2);
end