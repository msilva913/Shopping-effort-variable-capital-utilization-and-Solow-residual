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

assert(length(T) >= 69);

T(1) = 1+params(15)/params(16)-exp(params(3));
T(2) = T(1)+exp(params(3))^params(1)/params(2)-1;
T(3) = (params(6)-1)/params(6);
T(4) = params(16)*T(2)/(1+params(18));
T(5) = (1-params(20))*params(17)/(1+params(18));
T(6) = params(20)^(params(21)/(1+params(21)));
T(7) = params(22)/(T(6)*(1-params(7))*(1-params(15)))^params(20);
T(8) = params(22)/(T(6)*params(7)*(1-params(15)))^params(20);
T(9) = params(22)/(params(15)*T(6))^params(20);
T(10) = params(18)*(1-params(7))*(1-params(15))/params(22);
T(11) = params(18)*params(7)*(1-params(15))/params(22);
T(12) = params(15)*params(18)/params(22);
T(13) = exp(params(3))^(-T(4));
T(14) = (T(10)+(1-params(7))*(1-params(15))/params(22))/(T(13)*((1-params(7))*(1-params(15))*params(16)*exp(params(3)))^T(4)*((1-params(7))*(1-params(15))*params(34))^T(5));
T(15) = (T(11)+params(7)*(1-params(15))/params(22))/(T(13)*(params(7)*(1-params(15))*params(16)*exp(params(3)))^T(4)*(params(7)*(1-params(15))*params(34))^T(5));
T(16) = (T(12)+params(15)/params(22))/(T(13)*(params(15)*params(16)*exp(params(3)))^T(4)*(params(15)*params(34))^T(5));
T(17) = 1+1/params(21);
T(18) = 1/params(4);
T(19) = (1-params(15))^(-params(23));
T(20) = (1-(1-params(15)))^(-params(23));
T(21) = y(16)^(1+params(23))*T(19)+y(17)^(1+params(23))*T(20);
T(22) = (y(16)/y(18))^params(23);
T(23) = (1-params(20))*params(17)/params(34)/(params(8)*((1-params(15))*(1-params(19))-(T(6))^T(17)/T(17))*params(34)^T(18))*exp(y(22));
T(24) = y(18)^T(18)*T(23);
T(25) = (y(17)/y(18))^params(23);
T(26) = (1-params(7))*y(55)^(-params(6));
T(27) = params(7)*y(56)^(-params(6));
T(28) = exp(y(23))*y(49)^(1/params(21));
T(29) = exp(y(23))*y(49)^T(17)/T(17);
T(30) = y(2)-params(19)*y(2)-T(29);
T(31) = T(23)*y(18)^(1+T(18))/(1+T(18));
T(32) = y(54)*T(31);
T(33) = T(30)^params(5);
T(34) = y(54)^(1-params(5));
T(35) = params(7)^(1-T(3));
T(36) = (1-params(7))^(1-T(3));
T(37) = T(35)*y(4)^T(3)+T(36)*y(3)^T(3);
T(38) = exp(y(69));
T(39) = params(2)*exp(y(25))*T(38)^(-params(1));
T(40) = y(62)^2;
T(41) = y(46)*y(59)*T(39)*T(40);
T(42) = y(63)^2;
T(43) = y(47)*T(39)*y(60)*T(42);
T(44) = y(64)^2;
T(45) = y(48)*T(39)*y(61)*T(44);
T(46) = T(7)*y(50)^params(20);
T(47) = y(14)^T(5);
T(48) = T(38)^(-T(4));
T(49) = exp(y(19))*T(14)*T(48);
T(50) = (y(34)*y(10))^T(4);
T(51) = T(49)*T(50);
T(52) = T(46)*(T(47)*T(51)-T(10));
T(53) = T(8)*y(51)^params(20);
T(54) = y(15)^T(5);
T(55) = exp(y(19))*T(15)*T(48);
T(56) = (y(35)*y(11))^T(4);
T(57) = T(55)*T(56);
T(58) = T(9)*y(52)^params(20);
T(59) = y(17)^T(5);
T(60) = exp(y(21))*T(16)*T(48);
T(61) = (y(36)*y(12))^T(4);
T(62) = T(60)*T(61);
T(63) = T(58)*(T(59)*T(62)-T(12));
T(64) = y(10)^T(4);
T(65) = T(49)*T(64);
T(66) = T(47)*T(65)-T(10);
T(67) = y(12)^T(4);
T(68) = T(60)*T(67);
T(69) = T(59)*T(68)-T(12);

end
