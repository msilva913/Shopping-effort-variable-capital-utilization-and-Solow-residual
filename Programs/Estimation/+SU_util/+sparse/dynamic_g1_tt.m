function [T_order, T] = dynamic_g1_tt(y, x, params, steady_state, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = SU_util.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
T_order = 1;
if size(T, 1) < 42
    T = [T; NaN(42 - size(T, 1), 1)];
end
T(39) = exp(y(68))*getPowerDeriv(y(72),1/params(9),1);
T(40) = T(20)*getPowerDeriv(y(73),params(8),1);
T(41) = T(21)*getPowerDeriv(y(74),params(8),1);
T(42) = exp(y(77))*getPowerDeriv(exp(y(77)),(-T(19)),1);
end
