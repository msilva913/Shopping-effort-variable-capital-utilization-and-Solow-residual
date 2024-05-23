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

assert(length(T) >= 72);

T(1) = (params(6)-1)/params(6);
T(2) = params(12)*(1+params(11)/params(12)-exp(params(3))+exp(params(3))^params(1)/params(2)-1)/(1+params(14));
T(3) = (1-params(16))*params(13)/(1+params(14));
T(4) = params(16)^(params(17)/(1+params(17)));
T(5) = params(18)/(T(4)*(1-params(7))*(1-params(11)))^params(16);
T(6) = params(18)/(T(4)*params(7)*(1-params(11)))^params(16);
T(7) = params(18)/(params(11)*T(4))^params(16);
T(8) = params(14)*(1-params(7))*(1-params(11))/params(18);
T(9) = params(14)*params(7)*(1-params(11))/params(18);
T(10) = params(11)*params(14)/params(18);
T(11) = exp(params(3))^(-T(2));
T(12) = (T(8)+(1-params(7))*(1-params(11))/params(18))/(T(11)*((1-params(7))*(1-params(11))*params(12)*exp(params(3)))^T(2)*((1-params(7))*(1-params(11))*params(30))^T(3));
T(13) = (T(9)+params(7)*(1-params(11))/params(18))/(T(11)*(params(7)*(1-params(11))*params(12)*exp(params(3)))^T(2)*(params(7)*(1-params(11))*params(30))^T(3));
T(14) = (T(10)+params(11)/params(18))/(T(11)*(params(11)*params(12)*exp(params(3)))^T(2)*(params(11)*params(30))^T(3));
T(15) = 1+1/params(17);
T(16) = 1/params(4);
T(17) = (1-params(11))^(-params(19));
T(18) = (1-(1-params(11)))^(-params(19));
T(19) = y(17)^(1+params(19))*T(17)+y(18)^(1+params(19))*T(18);
T(20) = (y(17)/y(19))^params(19);
T(21) = (1-params(16))*params(13)/params(30)/(params(8)*((1-params(11))*(1-params(15))-(T(4))^T(15)/T(15))*params(30)^T(16))*exp(y(23));
T(22) = y(19)^T(16)*T(21);
T(23) = (y(18)/y(19))^params(19);
T(24) = (1-params(7))*y(47)^(-params(6));
T(25) = params(7)*y(48)^(-params(6));
T(26) = exp(y(24))*y(41)^(1/params(17));
T(27) = exp(y(24))*y(41)^T(15)/T(15);
T(28) = y(2)-params(15)*y(2)-T(27);
T(29) = T(21)*y(19)^(1+T(16))/(1+T(16));
T(30) = y(46)*T(29);
T(31) = T(28)^params(5);
T(32) = y(46)^(1-params(5));
T(33) = params(7)^(1-T(1));
T(34) = (1-params(7))^(1-T(1));
T(35) = T(33)*y(4)^T(1)+T(34)*y(3)^T(1);
T(36) = params(9)/2;
T(37) = exp(y(61));
T(38) = params(2)*exp(y(26))*T(37)^(-params(1));
T(39) = y(54)^2;
T(40) = y(38)*y(51)*T(38)*T(39);
T(41) = y(55)^2;
T(42) = y(39)*T(38)*y(52)*T(41);
T(43) = y(56)^2;
T(44) = y(40)*T(38)*y(53)*T(43);
T(45) = 1-(1+params(11)/params(12)-exp(params(3)));
T(46) = T(5)*y(42)^params(16);
T(47) = y(15)^T(3);
T(48) = T(37)^(-T(2));
T(49) = exp(y(20))*T(12)*T(48);
T(50) = y(11)^T(2);
T(51) = T(49)*T(50);
T(52) = T(6)*y(43)^params(16);
T(53) = y(16)^T(3);
T(54) = exp(y(20))*T(13)*T(48);
T(55) = y(12)^T(2);
T(56) = T(54)*T(55);
T(57) = T(7)*y(44)^params(16);
T(58) = y(18)^T(3);
T(59) = exp(y(22))*T(14)*T(48);
T(60) = y(13)^T(2);
T(61) = T(59)*T(60);
T(62) = T(37)^(1-params(13));
T(63) = y(11)^(1-params(13));
T(64) = y(15)^params(13);
T(65) = T(63)*T(64);
T(66) = y(12)^(1-params(13));
T(67) = y(16)^params(13);
T(68) = T(66)*T(67);
T(69) = y(13)^(1-params(13));
T(70) = y(18)^params(13);
T(71) = T(69)*T(70);
T(72) = y(3)*y(3)/y(1)/T(65)+y(4)*y(4)/y(1)/T(68)+y(6)*y(6)/y(1)/T(71);

end
