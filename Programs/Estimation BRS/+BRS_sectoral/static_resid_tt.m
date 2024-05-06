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

assert(length(T) >= 87);

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
T(14) = (T(10)+(1-params(7))*(1-params(13))/params(20))/(T(13)*((1-params(7))*(1-params(13))*params(14)*exp(params(3)))^T(4)*((1-params(7))*(1-params(13))*params(32))^T(5));
T(15) = (T(11)+params(7)*(1-params(13))/params(20))/(T(13)*(params(7)*(1-params(13))*params(14)*exp(params(3)))^T(4)*(params(7)*(1-params(13))*params(32))^T(5));
T(16) = (T(12)+params(13)/params(20))/(T(13)*(params(13)*params(14)*exp(params(3)))^T(4)*(params(13)*params(32))^T(5));
T(17) = 1+1/params(19);
T(18) = 1/params(4);
T(19) = (1-params(13))^(-params(21));
T(20) = (1-(1-params(13)))^(-params(21));
T(21) = y(17)^(1+params(21))*T(19)+y(18)^(1+params(21))*T(20);
T(22) = (y(17)/y(19))^params(21);
T(23) = (1-params(18))*params(15)/params(32)/(params(8)*((1-params(13))*(1-params(17))-(T(6))^T(17)/T(17))*params(32)^T(18))*exp(y(24));
T(24) = y(19)^T(18)*T(23);
T(25) = (y(18)/y(19))^params(21);
T(26) = (1-params(7))*y(58)^(-params(6));
T(27) = params(7)*y(59)^(-params(6));
T(28) = exp(y(25))*y(52)^(1/params(19));
T(29) = exp(y(25))*y(52)^T(17)/T(17);
T(30) = y(2)-params(17)*y(2)-T(29);
T(31) = T(23)*y(19)^(1+T(18))/(1+T(18));
T(32) = y(57)*T(31);
T(33) = T(30)^params(5);
T(34) = y(57)^(1-params(5));
T(35) = params(7)^(1-T(3));
T(36) = (1-params(7))^(1-T(3));
T(37) = T(35)*y(4)^T(3)+T(36)*y(3)^T(3);
T(38) = params(11)/2;
T(39) = exp(y(73));
T(40) = T(2)*params(9)/2;
T(41) = params(2)*exp(y(27))*T(39)^(-params(1));
T(42) = y(65)^2;
T(43) = y(49)*y(62)*T(41)*T(42);
T(44) = y(66)^2;
T(45) = y(50)*T(41)*y(63)*T(44);
T(46) = y(67)^2;
T(47) = y(51)*T(41)*y(64)*T(46);
T(48) = T(7)*y(53)^params(18);
T(49) = y(15)^T(5);
T(50) = T(39)^(-T(4));
T(51) = exp(y(20))*T(14)*T(50);
T(52) = (y(36)*y(11))^T(4);
T(53) = T(51)*T(52);
T(54) = T(48)*(T(49)*T(53)-T(10));
T(55) = T(8)*y(54)^params(18);
T(56) = y(16)^T(5);
T(57) = exp(y(20))*T(15)*T(50);
T(58) = (y(37)*y(12))^T(4);
T(59) = T(57)*T(58);
T(60) = T(55)*(T(56)*T(59)-T(11));
T(61) = T(9)*y(55)^params(18);
T(62) = y(18)^T(5);
T(63) = exp(y(22))*T(16)*T(50);
T(64) = (y(38)*y(13))^T(4);
T(65) = T(63)*T(64);
T(66) = T(61)*(T(62)*T(65)-T(12));
T(67) = y(3)/y(1);
T(68) = y(4)/y(1);
T(69) = y(6)/y(1);
T(70) = y(11)^(1-params(15));
T(71) = y(15)^params(15);
T(72) = T(70)*T(71);
T(73) = y(12)^(1-params(15));
T(74) = y(16)^params(15);
T(75) = T(73)*T(74);
T(76) = y(13)^(1-params(15));
T(77) = y(18)^params(15);
T(78) = T(76)*T(77);
T(79) = y(11)^T(4);
T(80) = T(51)*T(79);
T(81) = T(49)*T(80)-T(10);
T(82) = y(12)^T(4);
T(83) = T(57)*T(82);
T(84) = T(56)*T(83)-T(11);
T(85) = y(13)^T(4);
T(86) = T(63)*T(85);
T(87) = T(62)*T(86)-T(12);

end
