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

assert(length(T) >= 85);

T(1) = 1+params(11)/params(12)-exp(params(3));
T(2) = T(1)+exp(params(3))^params(1)/params(2)-1;
T(3) = (params(5)-1)/params(5);
T(4) = params(12)*T(2)/(1+params(14));
T(5) = (1-params(16))*params(13)/(1+params(14));
T(6) = params(16)^(params(17)/(1+params(17)));
T(7) = params(18)/(T(6)*(1-params(6))*(1-params(11)))^params(16);
T(8) = params(18)/(T(6)*params(6)*(1-params(11)))^params(16);
T(9) = params(18)/(params(11)*T(6))^params(16);
T(10) = params(14)*(1-params(6))*(1-params(11))/params(18);
T(11) = params(14)*params(6)*(1-params(11))/params(18);
T(12) = params(11)*params(14)/params(18);
T(13) = exp(params(3))^(-T(4));
T(14) = (T(10)+(1-params(6))*(1-params(11))/params(18))/(T(13)*((1-params(6))*(1-params(11))*params(12)*exp(params(3)))^T(4)*((1-params(6))*(1-params(11))*params(29))^T(5));
T(15) = (T(11)+params(6)*(1-params(11))/params(18))/(T(13)*(params(6)*(1-params(11))*params(12)*exp(params(3)))^T(4)*(params(6)*(1-params(11))*params(29))^T(5));
T(16) = (T(12)+params(11)/params(18))/(T(13)*(params(11)*params(12)*exp(params(3)))^T(4)*(params(11)*params(29))^T(5));
T(17) = 1/params(4);
T(18) = (1-params(11))^(-params(19));
T(19) = (1-(1-params(11)))^(-params(19));
T(20) = y(17)^(1+params(19))*T(18)+y(18)^(1+params(19))*T(19);
T(21) = (y(17)/y(19))^params(19);
T(22) = (1-params(16))*params(13)/params(29)/(params(29)^T(17)*params(7))*exp(y(24));
T(23) = y(19)^T(17)*T(22);
T(24) = (y(18)/y(19))^params(19);
T(25) = (1-params(6))*y(56)^(-params(5));
T(26) = params(6)*y(57)^(-params(5));
T(27) = exp(y(25))*y(51)^(1/params(17));
T(28) = 1+1/params(17);
T(29) = exp(y(25))*y(51)^T(28)/T(28);
T(30) = T(22)*y(19)^(1+T(17))/(1+T(17));
T(31) = params(6)^(1-T(3));
T(32) = (1-params(6))^(1-T(3));
T(33) = T(31)*y(4)^T(3)+T(32)*y(3)^T(3);
T(34) = params(10)/2;
T(35) = exp(y(71));
T(36) = T(2)*params(8)/2;
T(37) = params(2)*exp(y(26))*T(35)^(-params(1));
T(38) = y(63)^2;
T(39) = y(48)*y(60)*T(37)*T(38);
T(40) = y(64)^2;
T(41) = y(49)*T(37)*y(61)*T(40);
T(42) = y(65)^2;
T(43) = y(50)*T(37)*y(62)*T(42);
T(44) = T(7)*y(52)^params(16);
T(45) = y(15)^T(5);
T(46) = T(35)^(-T(4));
T(47) = exp(y(20))*T(14)*T(46);
T(48) = (y(35)*y(11))^T(4);
T(49) = T(47)*T(48);
T(50) = T(44)*(T(45)*T(49)-T(10));
T(51) = T(8)*y(53)^params(16);
T(52) = y(16)^T(5);
T(53) = exp(y(20))*T(15)*T(46);
T(54) = (y(36)*y(12))^T(4);
T(55) = T(53)*T(54);
T(56) = T(51)*(T(52)*T(55)-T(11));
T(57) = T(9)*y(54)^params(16);
T(58) = y(18)^T(5);
T(59) = exp(y(22))*T(16)*T(46);
T(60) = (y(37)*y(13))^T(4);
T(61) = T(59)*T(60);
T(62) = T(57)*(T(58)*T(61)-T(12));
T(63) = y(3)/y(1);
T(64) = y(4)/y(1);
T(65) = y(6)/y(1);
T(66) = T(35)^(1-params(13));
T(67) = y(11)^(1-params(13));
T(68) = y(15)^params(13);
T(69) = T(67)*T(68);
T(70) = y(12)^(1-params(13));
T(71) = y(16)^params(13);
T(72) = T(70)*T(71);
T(73) = y(13)^(1-params(13));
T(74) = y(18)^params(13);
T(75) = T(73)*T(74);
T(76) = y(3)*T(63)/T(69)+y(4)*T(64)/T(72)+y(6)*T(65)/T(75);
T(77) = y(11)^T(4);
T(78) = T(47)*T(77);
T(79) = T(45)*T(78)-T(10);
T(80) = y(12)^T(4);
T(81) = T(53)*T(80);
T(82) = T(52)*T(81)-T(11);
T(83) = y(13)^T(4);
T(84) = T(59)*T(83);
T(85) = T(58)*T(84)-T(12);

end
