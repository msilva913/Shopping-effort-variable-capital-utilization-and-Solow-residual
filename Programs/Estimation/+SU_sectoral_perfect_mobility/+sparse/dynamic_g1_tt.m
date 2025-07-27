function [T_order, T] = dynamic_g1_tt(y, x, params, steady_state, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = SU_sectoral_perfect_mobility.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
T_order = 1;
if size(T, 1) < 100
    T = [T; NaN(100 - size(T, 1), 1)];
end
T(82) = 1/y(105);
T(83) = getPowerDeriv(T(36),1/T(1),1);
T(84) = getPowerDeriv(y(139)*y(11),T(42),1);
T(85) = getPowerDeriv(y(140)*y(12),T(42),1);
T(86) = getPowerDeriv(y(141)*y(13),T(42),1);
T(87) = getPowerDeriv(y(119),T(2),1);
T(88) = T(57)*T(61)*T(87);
T(89) = getPowerDeriv(y(120),T(2),1);
T(90) = T(63)*T(66)*T(89);
T(91) = getPowerDeriv(y(122),T(2),1);
T(92) = T(68)*T(71)*T(91);
T(93) = exp(y(128))*getPowerDeriv(y(155),1/params(17),1);
T(94) = T(43)*getPowerDeriv(y(156),params(16),1);
T(95) = T(44)*getPowerDeriv(y(157),params(16),1);
T(96) = T(45)*getPowerDeriv(y(158),params(16),1);
T(97) = T(11)*params(2)*exp(y(130))*(-y(267))/(y(163)*y(163));
T(98) = T(11)*params(2)*exp(y(130))*1/y(163);
T(99) = T(10)*getPowerDeriv(T(10),(-T(42)),1);
T(100) = params(2)*exp(y(130))*y(267)/y(163)*exp(y(279))*getPowerDeriv(exp(y(279)),(-params(1)),1);
end
