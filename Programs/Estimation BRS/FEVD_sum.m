function [FEVD_table] = FEVD_sum(varargin)

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
col_names = {'Technology', 'Labor Supply', 'Shopping Effort', 'Discount Factor', 'Wage Markup'};

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

vd = res.variance_decomposition;
shock_names = M.exo_names;

mat = zeros(nvars, nshocks);

for i = 1:nvars
    var_index = strcmp(vars{i}, res.var_list);
    for j = 1:nshocks
        % Obtain shock group
        shock_group = shock_group_list{j};
        for k=1:length(shock_group)
            shock_index = strcmp(shock_group{k}, shock_names);
            % Add shock component to variable i, shock group j
            mat(i, j) = mat(i, j) + vd(var_index, shock_index);
        end
    end
end

%row_names = vars;
row_names = {'Y', 'SR', 'I', 'p_i', 'n_c', 'n_i', 'util', 'D', 'h'};
%round(mat,3,'significant')
format bank;
%form_mat = arrayfun(@(x) sprintf('%.3g', x), mat, 'UniformOutput', false);
FEVD_table = array2table(mat, 'RowNames', row_names, 'VariableNames', col_names);

