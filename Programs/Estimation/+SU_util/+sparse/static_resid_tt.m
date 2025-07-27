function [T_order, T] = static_resid_tt(y, x, params, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 37
    T = [T; NaN(37 - size(T, 1), 1)];
end
T(1) = params(6)*(exp(params(3))^params(1)/params(2)-1+1+params(5)/params(6)-exp(params(3)));
T(2) = params(8)^(params(9)/(1+params(9)));
T(3) = params(10)/(T(2)*(1-params(5)))^params(8);
T(4) = params(10)/(params(5)*T(2))^params(8);
T(5) = params(10)*exp(params(3))^(-T(1));
T(6) = (1-params(5))/(T(5)*((1-params(5))*exp(params(3))*params(6))^T(1)*((1-params(5))*params(17))^((1-params(8))*params(7)));
T(7) = params(5)/(T(5)*(params(5)*exp(params(3))*params(6))^T(1)*(params(5)*params(17))^((1-params(8))*params(7)));
T(8) = 1/params(4);
T(9) = (1-params(8))*params(5)*(1-params(8))*params(7)*params(16)/(1-params(8))/(params(5)*params(17))/params(17)^T(8)*exp(y(14));
T(10) = y(8)^T(8)*T(9);
T(11) = exp(y(15))*y(19)^(1/params(9));
T(12) = 1+1/params(9);
T(13) = exp(y(15))*y(19)^T(12)/T(12);
T(14) = T(9)*y(8)^(1+T(8))/(1+T(8));
T(15) = y(22)^(-params(1));
T(16) = exp(y(24))^(-params(1));
T(17) = 1-(1+params(5)/params(6)-exp(params(3)));
T(18) = params(2)*((1-params(8))*y(16)+y(23)*T(17));
T(19) = y(9)^((1-params(8))*params(7));
T(20) = T(3)*y(20)^params(8);
T(21) = exp(y(24))^(-T(1));
T(22) = exp(y(11))*T(6)*T(20)*T(21);
T(23) = y(6)^T(1);
T(24) = T(22)*T(23);
T(25) = y(10)^((1-params(8))*params(7));
T(26) = T(4)*y(21)^params(8);
T(27) = T(21)*exp(y(13))*T(7)*T(26);
T(28) = y(7)^T(1);
T(29) = T(27)*T(28);
T(30) = exp(y(24))^(1-params(7));
T(31) = y(6)^(1-params(7));
T(32) = y(9)^params(7);
T(33) = T(31)*T(32);
T(34) = y(7)^(1-params(7));
T(35) = y(10)^params(7);
T(36) = T(34)*T(35);
T(37) = y(2)*y(2)/y(1)/T(33)+y(3)*y(3)/y(1)/T(36);
end
