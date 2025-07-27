function [T_order, T] = static_g1_tt(y, x, params, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = SU_sectoral_artificial_data.sparse.static_resid_tt(y, x, params, T_order, T);
T_order = 1;
if size(T, 1) < 106
    T = [T; NaN(106 - size(T, 1), 1)];
end
T(86) = 1/y(1);
T(87) = getPowerDeriv(T(33),1/T(3),1);
T(88) = getPowerDeriv(y(36)*y(11),T(4),1);
T(89) = getPowerDeriv(y(37)*y(12),T(4),1);
T(90) = getPowerDeriv(y(38)*y(13),T(4),1);
T(91) = getPowerDeriv(y(15),T(5),1);
T(92) = T(44)*T(49)*T(91);
T(93) = getPowerDeriv(y(16),T(5),1);
T(94) = T(51)*T(55)*T(93);
T(95) = getPowerDeriv(T(20),1/(1+params(19)),1);
T(96) = getPowerDeriv(y(17)/y(19),params(19),1);
T(97) = getPowerDeriv(y(18)/y(19),params(19),1);
T(98) = getPowerDeriv(y(18),T(5),1);
T(99) = T(57)*T(61)*T(98);
T(100) = T(22)*getPowerDeriv(y(19),T(17),1);
T(101) = exp(y(25))*getPowerDeriv(y(52),1/params(17),1);
T(102) = T(7)*getPowerDeriv(y(53),params(16),1);
T(103) = T(8)*getPowerDeriv(y(54),params(16),1);
T(104) = T(9)*getPowerDeriv(y(55),params(16),1);
T(105) = params(2)*exp(y(27))*T(35)*getPowerDeriv(T(35),(-params(1)),1);
T(106) = T(35)*getPowerDeriv(T(35),(-T(4)),1);
end
