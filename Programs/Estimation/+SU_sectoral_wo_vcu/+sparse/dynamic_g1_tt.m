function [T_order, T] = dynamic_g1_tt(y, x, params, steady_state, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = SU_sectoral_wo_vcu.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
T_order = 1;
if size(T, 1) < 84
    T = [T; NaN(84 - size(T, 1), 1)];
end
T(71) = 1/y(94);
T(72) = getPowerDeriv(T(36),1/T(1),1);
T(73) = getPowerDeriv(T(53),1/(1+params(17)),1);
T(74) = getPowerDeriv(y(110)/y(112),params(17),1);
T(75) = getPowerDeriv(y(111)/y(112),params(17),1);
T(76) = T(54)*getPowerDeriv(y(112),T(4),1);
T(77) = exp(y(118))*getPowerDeriv(y(135),1/params(15),1);
T(78) = T(41)*getPowerDeriv(y(136),params(14),1);
T(79) = T(42)*getPowerDeriv(y(137),params(14),1);
T(80) = T(43)*getPowerDeriv(y(138),params(14),1);
T(81) = T(13)*params(2)*exp(y(120))*(-y(236))/(y(143)*y(143));
T(82) = T(13)*params(2)*exp(y(120))*1/y(143);
T(83) = T(12)*getPowerDeriv(T(12),(-T(40)),1);
T(84) = params(2)*exp(y(120))*y(236)/y(143)*exp(y(248))*getPowerDeriv(exp(y(248)),(-params(1)),1);
end
