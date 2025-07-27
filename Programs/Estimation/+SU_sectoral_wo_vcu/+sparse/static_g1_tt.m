function [T_order, T] = static_g1_tt(y, x, params, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = SU_sectoral_wo_vcu.sparse.static_resid_tt(y, x, params, T_order, T);
T_order = 1;
if size(T, 1) < 81
    T = [T; NaN(81 - size(T, 1), 1)];
end
T(70) = 1/y(1);
T(71) = getPowerDeriv(T(31),1/T(1),1);
T(72) = getPowerDeriv(T(18),1/(1+params(17)),1);
T(73) = getPowerDeriv(y(17)/y(19),params(17),1);
T(74) = getPowerDeriv(y(18)/y(19),params(17),1);
T(75) = T(20)*getPowerDeriv(y(19),T(15),1);
T(76) = exp(y(25))*getPowerDeriv(y(42),1/params(15),1);
T(77) = T(5)*getPowerDeriv(y(43),params(14),1);
T(78) = T(6)*getPowerDeriv(y(44),params(14),1);
T(79) = T(7)*getPowerDeriv(y(45),params(14),1);
T(80) = params(2)*exp(y(27))*T(33)*getPowerDeriv(T(33),(-params(1)),1);
T(81) = T(33)*getPowerDeriv(T(33),(-T(2)),1);
end
