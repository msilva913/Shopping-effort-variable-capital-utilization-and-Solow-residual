function [T_order, T] = dynamic_g1_tt(y, x, params, steady_state, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = SU_sectoral_wo_demand_shocks.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
T_order = 1;
if size(T, 1) < 108
    T = [T; NaN(108 - size(T, 1), 1)];
end
T(86) = 1/y(101);
T(87) = getPowerDeriv(T(37),1/T(1),1);
T(88) = getPowerDeriv(y(133)*y(11),T(43),1);
T(89) = getPowerDeriv(y(134)*y(12),T(43),1);
T(90) = getPowerDeriv(y(135)*y(13),T(43),1);
T(91) = getPowerDeriv(y(115),T(2),1);
T(92) = T(61)*T(65)*T(91);
T(93) = getPowerDeriv(y(116),T(2),1);
T(94) = T(67)*T(70)*T(93);
T(95) = getPowerDeriv(T(56),1/(1+params(19)),1);
T(96) = getPowerDeriv(y(117)/y(119),params(19),1);
T(97) = getPowerDeriv(y(118)/y(119),params(19),1);
T(98) = getPowerDeriv(y(118),T(2),1);
T(99) = T(72)*T(75)*T(98);
T(100) = T(57)*getPowerDeriv(y(119),T(4),1);
T(101) = getPowerDeriv(y(149),1/params(17),1);
T(102) = T(44)*getPowerDeriv(y(150),params(16),1);
T(103) = T(45)*getPowerDeriv(y(151),params(16),1);
T(104) = T(46)*getPowerDeriv(y(152),params(16),1);
T(105) = T(12)*params(2)*exp(y(124))*(-y(257))/(y(157)*y(157));
T(106) = T(12)*params(2)*exp(y(124))*1/y(157);
T(107) = T(11)*getPowerDeriv(T(11),(-T(43)),1);
T(108) = params(2)*exp(y(124))*y(257)/y(157)*exp(y(269))*getPowerDeriv(exp(y(269)),(-params(1)),1);
end
