function [T_order, T] = dynamic_g1_tt(y, x, params, steady_state, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = SU_sectoral_wo_fixed_cost.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
T_order = 1;
if size(T, 1) < 109
    T = [T; NaN(109 - size(T, 1), 1)];
end
T(87) = 1/y(106);
T(88) = getPowerDeriv(T(38),1/T(1),1);
T(89) = getPowerDeriv(y(141)*y(11),T(44),1);
T(90) = getPowerDeriv(y(142)*y(12),T(44),1);
T(91) = getPowerDeriv(y(143)*y(13),T(44),1);
T(92) = getPowerDeriv(y(120),T(2),1);
T(93) = T(62)*T(66)*T(92);
T(94) = getPowerDeriv(y(121),T(2),1);
T(95) = T(68)*T(71)*T(94);
T(96) = getPowerDeriv(T(57),1/(1+params(19)),1);
T(97) = getPowerDeriv(y(122)/y(124),params(19),1);
T(98) = getPowerDeriv(y(123)/y(124),params(19),1);
T(99) = getPowerDeriv(y(123),T(2),1);
T(100) = T(73)*T(76)*T(99);
T(101) = T(58)*getPowerDeriv(y(124),T(4),1);
T(102) = exp(y(130))*getPowerDeriv(y(157),1/params(17),1);
T(103) = T(45)*getPowerDeriv(y(158),params(16),1);
T(104) = T(46)*getPowerDeriv(y(159),params(16),1);
T(105) = T(47)*getPowerDeriv(y(160),params(16),1);
T(106) = T(13)*params(2)*exp(y(132))*(-y(270))/(y(165)*y(165));
T(107) = T(13)*params(2)*exp(y(132))*1/y(165);
T(108) = T(12)*getPowerDeriv(T(12),(-T(44)),1);
T(109) = params(2)*exp(y(132))*y(270)/y(165)*exp(y(282))*getPowerDeriv(exp(y(282)),(-params(1)),1);
end
