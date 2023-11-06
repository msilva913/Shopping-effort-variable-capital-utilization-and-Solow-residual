function [residual, g1] = static_resid_g1(T, y, x, params, T_flag)
% function [residual, g1] = static_resid_g1(T, y, x, params, T_flag)
%
% Wrapper function automatically created by Dynare
%

    if T_flag
        T = directed_search_testing.static_g1_tt(T, y, x, params);
    end
    residual = directed_search_testing.static_resid(T, y, x, params, false);
    g1       = directed_search_testing.static_g1(T, y, x, params, false);

end
