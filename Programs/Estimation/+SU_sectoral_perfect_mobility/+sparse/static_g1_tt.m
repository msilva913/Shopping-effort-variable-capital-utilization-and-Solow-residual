function [T_order, T] = static_g1_tt(y, x, params, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = SU_sectoral_perfect_mobility.sparse.static_resid_tt(y, x, params, T_order, T);
T_order = 1;
if size(T, 1) < 97
    T = [T; NaN(97 - size(T, 1), 1)];
end
T(81) = 1/y(1);
T(82) = getPowerDeriv(T(28),1/T(3),1);
T(83) = getPowerDeriv(y(35)*y(11),T(4),1);
T(84) = getPowerDeriv(y(36)*y(12),T(4),1);
T(85) = getPowerDeriv(y(37)*y(13),T(4),1);
T(86) = getPowerDeriv(y(15),T(5),1);
T(87) = T(39)*T(44)*T(86);
T(88) = getPowerDeriv(y(16),T(5),1);
T(89) = T(46)*T(50)*T(88);
T(90) = getPowerDeriv(y(18),T(5),1);
T(91) = T(52)*T(56)*T(90);
T(92) = exp(y(24))*getPowerDeriv(y(51),1/params(17),1);
T(93) = T(7)*getPowerDeriv(y(52),params(16),1);
T(94) = T(8)*getPowerDeriv(y(53),params(16),1);
T(95) = T(9)*getPowerDeriv(y(54),params(16),1);
T(96) = params(2)*exp(y(26))*T(30)*getPowerDeriv(T(30),(-params(1)),1);
T(97) = T(30)*getPowerDeriv(T(30),(-T(4)),1);
end
