function [T_order, T] = dynamic_resid_tt(y, x, params, steady_state, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 38
    T = [T; NaN(38 - size(T, 1), 1)];
end
T(1) = params(8)^(params(9)/(1+params(9)));
T(2) = 1/params(4);
T(3) = exp(y(64))*y(68)^(1/params(9));
T(4) = 1+1/params(9);
T(5) = exp(y(64))*y(68)^T(4)/T(4);
T(6) = y(71)^(-params(1));
T(7) = y(120)^(-params(1));
T(8) = exp(y(122))^(-params(1));
T(9) = exp(y(73))^(1-params(7));
T(10) = y(6)^(1-params(7));
T(11) = y(58)^params(7);
T(12) = T(10)*T(11);
T(13) = y(7)^(1-params(7));
T(14) = y(59)^params(7);
T(15) = T(13)*T(14);
T(16) = y(51)*y(51)/y(50)/T(12)+y(52)*y(52)/y(50)/T(15);
T(17) = y(58)^((1-params(8))*params(7));
T(18) = y(59)^((1-params(8))*params(7));
T(19) = params(6)*(exp(params(3))^params(1)/params(2)-1+1+params(5)/params(6)-exp(params(3)));
T(20) = params(10)/(T(1)*(1-params(5)))^params(8);
T(21) = params(10)/(params(5)*T(1))^params(8);
T(22) = params(10)*exp(params(3))^(-T(19));
T(23) = (1-params(5))/(T(22)*((1-params(5))*exp(params(3))*params(6))^T(19)*((1-params(5))*params(17))^((1-params(8))*params(7)));
T(24) = params(5)/(T(22)*(params(5)*exp(params(3))*params(6))^T(19)*(params(5)*params(17))^((1-params(8))*params(7)));
T(25) = exp(y(63))*(1-params(8))*params(5)*(1-params(8))*params(7)*params(16)/(1-params(8))/(params(5)*params(17))/params(17)^T(2);
T(26) = y(57)^T(2)*T(25);
T(27) = y(57)^(1+T(2))*T(25)/(1+T(2));
T(28) = 1-(1+params(5)/params(6)-exp(params(3)));
T(29) = params(2)*((1-params(8))*y(114)+y(121)*T(28));
T(30) = y(69)^params(8)*T(20);
T(31) = exp(y(73))^(-T(19));
T(32) = exp(y(60))*T(23)*T(30)*T(31);
T(33) = y(6)^T(19);
T(34) = T(32)*T(33);
T(35) = y(70)^params(8)*T(21);
T(36) = T(31)*exp(y(62))*T(24)*T(35);
T(37) = y(7)^T(19);
T(38) = T(36)*T(37);
end
