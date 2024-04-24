function T = static_resid_tt(T, y, x, params)
% function T = static_resid_tt(T, y, x, params)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%
% Output:
%   T         [#temp variables by 1]  double   vector of temporary terms
%

assert(length(T) >= 86);

T(1) = 1+params(13)/params(14)-exp(params(3));
T(2) = T(1)+exp(params(3))^params(1)/params(2)-1;
T(3) = (params(6)-1)/params(6);
T(4) = params(14)*T(2)/(1+params(16));
T(5) = (1-params(18))*params(15)/(1+params(16));
T(6) = params(18)^(params(19)/(1+params(19)));
T(7) = params(20)/(T(6)*(1-params(7))*(1-params(13)))^params(18);
T(8) = params(20)/(T(6)*params(7)*(1-params(13)))^params(18);
T(9) = params(20)/(params(13)*T(6))^params(18);
T(10) = params(16)*(1-params(7))*(1-params(13))/params(20);
T(11) = params(16)*params(7)*(1-params(13))/params(20);
T(12) = params(13)*params(16)/params(20);
T(13) = exp(params(3))^(-T(4));
T(14) = (T(10)+(1-params(7))*(1-params(13))/params(20))/(T(13)*((1-params(7))*(1-params(13))*params(14)*exp(params(3)))^T(4)*((1-params(7))*(1-params(13))*params(30))^T(5));
T(15) = (T(11)+params(7)*(1-params(13))/params(20))/(T(13)*(params(7)*(1-params(13))*params(14)*exp(params(3)))^T(4)*(params(7)*(1-params(13))*params(30))^T(5));
T(16) = (T(12)+params(13)/params(20))/(T(13)*(params(13)*params(14)*exp(params(3)))^T(4)*(params(13)*params(30))^T(5));
T(17) = 1+1/params(19);
T(18) = 1/params(4);
T(19) = (1-params(13))^(-params(21));
T(20) = (1-(1-params(13)))^(-params(21));
T(21) = y(17)^(1+params(21))*T(19)+y(18)^(1+params(21))*T(20);
T(22) = (y(17)/y(19))^params(21);
T(23) = (1-params(18))*params(15)/params(30)/(params(8)*((1-params(13))*(1-params(17))-(T(6))^T(17)/T(17))*params(30)^T(18))*exp(y(23));
T(24) = y(19)^T(18)*T(23);
T(25) = (y(18)/y(19))^params(21);
T(26) = (1-params(7))*y(55)^(-params(6));
T(27) = params(7)*y(56)^(-params(6));
T(28) = y(49)^(1/params(19));
T(29) = y(2)-params(17)*y(2)-y(49)^T(17)/T(17);
T(30) = T(23)*y(19)^(1+T(18))/(1+T(18));
T(31) = y(54)*T(30);
T(32) = T(29)^params(5);
T(33) = y(54)^(1-params(5));
T(34) = params(7)^(1-T(3));
T(35) = (1-params(7))^(1-T(3));
T(36) = T(34)*y(4)^T(3)+T(35)*y(3)^T(3);
T(37) = params(11)/2;
T(38) = exp(y(70));
T(39) = T(2)*params(9)/2;
T(40) = params(2)*exp(y(24))*T(38)^(-params(1));
T(41) = y(62)^2;
T(42) = y(46)*y(59)*T(40)*T(41);
T(43) = y(63)^2;
T(44) = y(47)*T(40)*y(60)*T(43);
T(45) = y(64)^2;
T(46) = y(48)*T(40)*y(61)*T(45);
T(47) = T(7)*y(50)^params(18);
T(48) = y(15)^T(5);
T(49) = T(38)^(-T(4));
T(50) = exp(y(20))*T(14)*T(49);
T(51) = (y(33)*y(11))^T(4);
T(52) = T(50)*T(51);
T(53) = T(47)*(T(48)*T(52)-T(10));
T(54) = T(8)*y(51)^params(18);
T(55) = y(16)^T(5);
T(56) = exp(y(20))*T(15)*T(49);
T(57) = (y(34)*y(12))^T(4);
T(58) = T(56)*T(57);
T(59) = T(54)*(T(55)*T(58)-T(11));
T(60) = T(9)*y(52)^params(18);
T(61) = y(18)^T(5);
T(62) = exp(y(22))*T(16)*T(49);
T(63) = (y(35)*y(13))^T(4);
T(64) = T(62)*T(63);
T(65) = T(60)*(T(61)*T(64)-T(12));
T(66) = y(3)/y(1);
T(67) = y(4)/y(1);
T(68) = y(6)/y(1);
T(69) = y(11)^(1-params(15));
T(70) = y(15)^params(15);
T(71) = T(69)*T(70);
T(72) = y(12)^(1-params(15));
T(73) = y(16)^params(15);
T(74) = T(72)*T(73);
T(75) = y(13)^(1-params(15));
T(76) = y(18)^params(15);
T(77) = T(75)*T(76);
T(78) = y(11)^T(4);
T(79) = T(50)*T(78);
T(80) = T(48)*T(79)-T(10);
T(81) = y(12)^T(4);
T(82) = T(56)*T(81);
T(83) = T(55)*T(82)-T(11);
T(84) = y(13)^T(4);
T(85) = T(62)*T(84);
T(86) = T(61)*T(85)-T(12);

end
