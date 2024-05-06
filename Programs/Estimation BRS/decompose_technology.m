function [FEVD_table] = decompose_technology(varargin)

% Summary of FEVD for shock groups
    %1) Technology
    %2) Labor supply
    %3) Shopping effort
    %4) Discount factor
    %5) Wage markups

res = varargin{1};
M = varargin{2};

technology_shocks = {'e_g', 'e_g_news', 'e_Z', 'e_Z_news', 'e_ZI', 'e_ZI_news'};
col_names = {'technology'}
nshocks = length(technology_shocks);

vars = {'Y_obs', 'SR_obs', 'I_obs', 'p_I_obs', 'NC_obs', 'NI_obs', 'util_obs', 'D_obs', 'h_obs', 'tech_obs'};
nvars = length(vars);

vd = res.variance_decomposition;
shock_names = M.exo_names;

mat = zeros(nvars, nshocks);

for i = 1:nvars
    var_index = strcmp(vars{i}, res.var_list);
    for j = 1:nshocks
        shock_index = strcmp(technology_shocks{j}, shock_names);
        % Add shock component to variable i, shock group j
        mat(i, j) = mat(i, j) + vd(var_index, shock_index);
    end
    % Express as proportion of technology shock
    mat(i, :) = 100.*mat(i, :)/sum(mat(i, :));
end

row_names = vars;
format bank;
FEVD_table = array2table(mat, 'RowNames', row_names, 'VariableNames', technology_shocks);

