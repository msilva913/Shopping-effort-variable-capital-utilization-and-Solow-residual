function [tables] = CFEVD_sum(varargin)

% Summary of FEVD for shock groups
    %1) Technology
    %2) Labor supply
    %3) Shopping effort
    %4) Discount factor
    %5) Wage markups

res = varargin{1};
M = varargin{2};
spec = varargin{3};

technology_shocks = {'e_g', 'e_g_news', 'e_Z', 'e_Z_news', 'e_ZI', 'e_ZI_news'};
labor_supply_shocks = {'e_N'};
shopping_effort_shocks = {'e_D', 'e_D_news', 'e_DI', 'e_DI_news'};
discount_factor_shocks = {'e_b', 'e_b_news'};
wage_markup_shocks = {'e_muC', 'e_muC_news', 'e_muI', 'e_muI_news'};

shock_group_list = {technology_shocks, labor_supply_shocks, shopping_effort_shocks, discount_factor_shocks, wage_markup_shocks};
col_names = {'technology', 'labor supply', 'shopping effort', 'discount factor', 'wage markup'};

if nargin >= 4
    shock_group_list = {technology_shocks, labor_supply_shocks, discount_factor_shocks, wage_markup_shocks};
    col_names = {'technology', 'labor supply', 'discount factor', 'wage markup'};
end

if strcmp(spec,'growth')
    vars = {'Y_obs', 'SR_obs', 'I_obs', 'p_I_obs', 'NC_obs', 'NI_obs', 'util_obs', 'D_obs', 'h_obs'};

else
    vars = {'log_Y', 'log_SR', 'log_I', 'log_p_I', 'log_NC', 'log_NI', 'log_util', 'log_D', 'log_h'};
end


nvars = length(vars);
nshocks = length(shock_group_list);

cvd = 100.*res.conditional_variance_decomposition;
% Align with shock horizon in first dimension
cvd = permute(cvd, [2 1 3]);
shock_names = M.exo_names;

tables = cell(4, 1);
% Loop over forecast horizon
for h = 1:4
    cvd_h = cvd(h, :, :);
    cvd_h = squeeze(cvd_h);
    mat = zeros(nvars, nshocks);

    for i = 1:nvars
        var_index = strcmp(vars{i}, res.var_list);
        for j = 1:nshocks
            % Obtain shock group
            shock_group = shock_group_list{j};
            for k=1:length(shock_group)
                shock_index = strcmp(shock_group{k}, shock_names);
                % Add shock component to variable i, shock group j
                mat(i, j) = mat(i, j) + cvd_h(var_index, shock_index);
            end
        end
    end

    row_names = vars;
    format bank;
    CFEVD_table = array2table(mat, 'RowNames', row_names, 'VariableNames', col_names);
    tables{h} = CFEVD_table;
end

