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

assert(length(T) >= 89);

T(1) = 1+params(13)/params(14)-exp(params(3));
T(2) = T(1)+exp(params(3))^params(1)/params(2)-1;
T(3) = (1+params(19))*params(18)/(1+params(19)*params(18));
T(4) = (params(6)-1)/params(6);
T(5) = params(14)*T(2)/(1+params(16));
T(6) = 1-T(3);
T(7) = params(15)*T(6)/(1+params(16));
T(8) = T(3)^(params(19)/(1+params(19)));
T(9) = params(20)/(T(8)*(1-params(7))*(1-params(13)))^T(3);
T(10) = params(20)/(T(8)*params(7)*(1-params(13)))^T(3);
T(11) = params(20)/(params(13)*T(8))^T(3);
T(12) = params(16)*(1-params(7))*(1-params(13))/params(20);
T(13) = params(16)*params(7)*(1-params(13))/params(20);
T(14) = params(13)*params(16)/params(20);
T(15) = exp(params(3))^(-T(5));
T(16) = (T(12)+(1-params(7))*(1-params(13))/params(20))/(T(15)*((1-params(7))*(1-params(13))*params(14)*exp(params(3)))^T(5)*((1-params(7))*(1-params(13))*params(32))^T(7));
T(17) = (T(13)+params(7)*(1-params(13))/params(20))/(T(15)*(params(7)*(1-params(13))*params(14)*exp(params(3)))^T(5)*(params(7)*(1-params(13))*params(32))^T(7));
T(18) = (T(14)+params(13)/params(20))/(T(15)*(params(13)*params(14)*exp(params(3)))^T(5)*(params(13)*params(32))^T(7));
T(19) = 1+1/params(19);
T(20) = 1/params(4);
T(21) = (1-params(13))^(-params(21));
T(22) = (1-(1-params(13)))^(-params(21));
T(23) = y(17)^(1+params(21))*T(21)+y(18)^(1+params(21))*T(22);
T(24) = (y(17)/y(19))^params(21);
T(25) = T(6)*params(15)/params(32)/(params(8)*((1-params(13))*(1-params(17))-(T(8))^T(19)/T(19))*params(32)^T(20))*exp(y(24));
T(26) = y(19)^T(20)*T(25);
T(27) = (y(18)/y(19))^params(21);
T(28) = (1-params(7))*y(58)^(-params(6));
T(29) = params(7)*y(59)^(-params(6));
T(30) = exp(y(25))*y(52)^(1/params(19));
T(31) = exp(y(25))*y(52)^T(19)/T(19);
T(32) = y(2)-params(17)*y(2)-T(31);
T(33) = T(25)*y(19)^(1+T(20))/(1+T(20));
T(34) = y(57)*T(33);
T(35) = T(32)^params(5);
T(36) = y(57)^(1-params(5));
T(37) = params(7)^(1-T(4));
T(38) = (1-params(7))^(1-T(4));
T(39) = T(37)*y(4)^T(4)+T(38)*y(3)^T(4);
T(40) = params(11)/2;
T(41) = exp(y(73));
T(42) = T(2)*params(9)/2;
T(43) = params(2)*exp(y(27))*T(41)^(-params(1));
T(44) = y(65)^2;
T(45) = y(49)*y(62)*T(43)*T(44);
T(46) = y(66)^2;
T(47) = y(50)*T(43)*y(63)*T(46);
T(48) = y(67)^2;
T(49) = y(51)*T(43)*y(64)*T(48);
T(50) = T(9)*y(53)^T(3);
T(51) = T(41)^(-T(5));
T(52) = exp(y(20))*T(16)*T(51);
T(53) = (y(36)*y(11))^T(5);
T(54) = T(52)*T(53);
T(55) = y(15)^T(7);
T(56) = T(50)*(T(54)*T(55)-T(12));
T(57) = T(10)*y(54)^T(3);
T(58) = exp(y(20))*T(17)*T(51);
T(59) = (y(37)*y(12))^T(5);
T(60) = T(58)*T(59);
T(61) = y(16)^T(7);
T(62) = T(57)*(T(60)*T(61)-T(13));
T(63) = T(11)*y(55)^T(3);
T(64) = exp(y(22))*T(18)*T(51);
T(65) = (y(38)*y(13))^T(5);
T(66) = T(64)*T(65);
T(67) = y(18)^T(7);
T(68) = T(63)*(T(66)*T(67)-T(14));
T(69) = y(3)/y(1);
T(70) = y(4)/y(1);
T(71) = y(6)/y(1);
T(72) = y(11)^(1-params(15));
T(73) = y(15)^params(15);
T(74) = T(72)*T(73);
T(75) = y(12)^(1-params(15));
T(76) = y(16)^params(15);
T(77) = T(75)*T(76);
T(78) = y(13)^(1-params(15));
T(79) = y(18)^params(15);
T(80) = T(78)*T(79);
T(81) = y(11)^T(5);
T(82) = T(52)*T(81);
T(83) = T(55)*T(82)-T(12);
T(84) = y(12)^T(5);
T(85) = T(58)*T(84);
T(86) = T(61)*T(85)-T(13);
T(87) = y(13)^T(5);
T(88) = T(64)*T(87);
T(89) = T(67)*T(88)-T(14);

end
