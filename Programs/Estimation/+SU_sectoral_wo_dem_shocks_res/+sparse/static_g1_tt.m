function [T_order, T] = static_g1_tt(y, x, params, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = SU_sectoral_wo_dem_shocks_res.sparse.static_resid_tt(y, x, params, T_order, T);
T_order = 1;
if size(T, 1) < 105
    T = [T; NaN(105 - size(T, 1), 1)];
end
T(85) = 1/y(1);
T(86) = getPowerDeriv(T(32),1/T(3),1);
T(87) = getPowerDeriv(y(33)*y(11),T(4),1);
T(88) = getPowerDeriv(y(34)*y(12),T(4),1);
T(89) = getPowerDeriv(y(35)*y(13),T(4),1);
T(90) = getPowerDeriv(y(15),T(5),1);
T(91) = T(43)*T(48)*T(90);
T(92) = getPowerDeriv(y(16),T(5),1);
T(93) = T(50)*T(54)*T(92);
T(94) = getPowerDeriv(T(20),1/(1+params(19)),1);
T(95) = getPowerDeriv(y(17)/y(19),params(19),1);
T(96) = getPowerDeriv(y(18)/y(19),params(19),1);
T(97) = getPowerDeriv(y(18),T(5),1);
T(98) = T(56)*T(60)*T(97);
T(99) = T(22)*getPowerDeriv(y(19),T(17),1);
T(100) = getPowerDeriv(y(49),1/params(17),1);
T(101) = T(7)*getPowerDeriv(y(50),params(16),1);
T(102) = T(8)*getPowerDeriv(y(51),params(16),1);
T(103) = T(9)*getPowerDeriv(y(52),params(16),1);
T(104) = params(2)*exp(y(24))*T(34)*getPowerDeriv(T(34),(-params(1)),1);
T(105) = T(34)*getPowerDeriv(T(34),(-T(4)),1);
end
