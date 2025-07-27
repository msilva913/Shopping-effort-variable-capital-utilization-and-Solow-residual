function [T_order, T] = static_g1_tt(y, x, params, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = SU_growth_id.sparse.static_resid_tt(y, x, params, T_order, T);
T_order = 1;
if size(T, 1) < 42
    T = [T; NaN(42 - size(T, 1), 1)];
end
T(38) = exp(y(15))*getPowerDeriv(y(19),1/params(9),1);
T(39) = T(3)*getPowerDeriv(y(20),params(8),1);
T(40) = T(4)*getPowerDeriv(y(21),params(8),1);
T(41) = getPowerDeriv(y(22),(-params(1)),1);
T(42) = exp(y(24))*getPowerDeriv(exp(y(24)),(-T(1)),1);
end
