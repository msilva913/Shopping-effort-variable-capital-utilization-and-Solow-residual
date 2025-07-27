function [T_order, T] = dynamic_g1_tt(y, x, params, steady_state, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = SU_growth_id.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
T_order = 1;
if size(T, 1) < 42
    T = [T; NaN(42 - size(T, 1), 1)];
end
T(39) = exp(y(64))*getPowerDeriv(y(68),1/params(9),1);
T(40) = T(20)*getPowerDeriv(y(69),params(8),1);
T(41) = T(21)*getPowerDeriv(y(70),params(8),1);
T(42) = exp(y(73))*getPowerDeriv(exp(y(73)),(-T(19)),1);
end
