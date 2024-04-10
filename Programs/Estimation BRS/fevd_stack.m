%Group FEVD into Technology (all, including news), Labor Supply, Shopping Effort, Discount Factor, Wage Markup

%Original shock names
shock_names = {'e_g', 'e_g_news', 'e_Z', 'e_Z_news', 'e_ZI', 'e_ZI_news', 'e_N', 'e_D', 'e_D_news', 'e_DI', 'e_DI_news', 'e_b', 'e_b_news', 'e_muC', 'e_muC_news', 'e_muI', 'e_muI_news'};

%Define array for groups of shocks 
shock_stack = {'Technology', {'e_g', 'e_g_news', 'e_Z', 'e_Z_news', 'e_ZI', 'e_ZI_news'}; 'Labor Supply', {'e_N'}; 'Shopping Effort', {'e_D', 'e_D_news', 'e_DI', 'e_DI_news'}; 'Discount Factor', {'e_b', 'e_b_news'}; 'Wage Markup', {'e_muC', 'e_muC_news', 'e_muI', 'e_muI_news'}};

%Create arrays for shocks in each group 
for i = 1:size(shock_stack, 1)
    group_name = shock_stack{i, 1};
    shocks = shock_stack{i, 2};
    total_shocks = length(shocks);
    new_shock = zeros(size(shocks, 1), 1);

    for j = 1:total_shocks
        shock_index = find(strcmp(shocks{j}, shock_names));
        new_shock = new_shock + oo_.variance_decomposition(:, shock_index);
    end
     % Store the new shock series in the oo_ structure
    oo_.variance_decomposition(:, length(oo_.variance_decomposition)+1) = new_shock;
    shock_names{length(oo_.variance_decomposition)+1} = group_name;
end

names = shock_stack(:,1);
names_sym = str2sym(names);
data_to_string = cellfun(@(x) sprintf('%.15f', x), num2cell(oo_.variance_decomposition(:,end-length(shock_stack)+1:end)), 'UniformOutput', false);
fevd_stack_matrix = [names_sym'; data_to_string];
latex_code = latex(sym(fevd_stack_matrix));
display(latex_code)