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

assert(length(T) >= 57);

T(1) = 1+params(13)/params(14)-exp(params(3));
T(2) = T(1)+exp(params(3))^params(1)/params(2)-1;
T(3) = (params(6)-1)/params(6);
T(4) = params(14)*T(2)/(1+params(16));
T(5) = params(15)/(1+params(16));
T(6) = exp(params(3))^(-T(4));
T(7) = ((1-params(7))*(1-params(13))+params(16)*(1-params(7))*(1-params(13)))/(T(6)*((1-params(7))*(1-params(13))*params(14)*exp(params(3)))^T(4)*((1-params(7))*(1-params(13))*params(27))^T(5));
T(8) = (params(7)*(1-params(13))+params(16)*params(7)*(1-params(13)))/(T(6)*(params(7)*(1-params(13))*params(14)*exp(params(3)))^T(4)*(params(7)*(1-params(13))*params(27))^T(5));
T(9) = (params(13)+params(13)*params(16))/(T(6)*(params(13)*params(14)*exp(params(3)))^T(4)*(params(13)*params(27))^T(5));
T(10) = 1/params(4);
T(11) = (1-params(13))^(-params(18));
T(12) = (1-(1-params(13)))^(-params(18));
T(13) = y(16)^(1+params(18))*T(11)+y(17)^(1+params(18))*T(12);
T(14) = (y(16)/y(18))^params(18);
T(15) = params(15)/params(27)/(params(8)*(1-params(13))*(1-params(17))*params(27)^T(10))*exp(y(22));
T(16) = y(18)^T(10)*T(15);
T(17) = (y(17)/y(18))^params(18);
T(18) = (1-params(7))*y(49)^(-params(6));
T(19) = params(7)*y(50)^(-params(6));
T(20) = T(15)*y(18)^(1+T(10))/(1+T(10));
T(21) = y(48)*T(20);
T(22) = (y(2)-params(17)*y(2))^params(5);
T(23) = y(48)^(1-params(5));
T(24) = params(7)^(1-T(3));
T(25) = (1-params(7))^(1-T(3));
T(26) = T(24)*y(4)^T(3)+T(25)*y(3)^T(3);
T(27) = params(11)/2;
T(28) = exp(y(63));
T(29) = T(2)*params(9)/2;
T(30) = params(2)*exp(y(23))*T(28)^(-params(1));
T(31) = y(56)^2;
T(32) = y(44)*y(53)*T(30)*T(31);
T(33) = y(57)^2;
T(34) = y(45)*T(30)*y(54)*T(33);
T(35) = y(58)^2;
T(36) = y(46)*T(30)*y(55)*T(35);
T(37) = y(14)^T(5);
T(38) = T(28)^(-T(4));
T(39) = exp(y(19))*T(7)*T(38);
T(40) = (y(32)*y(10))^T(4);
T(41) = T(39)*T(40);
T(42) = T(37)*T(41)-params(16)*(1-params(7))*(1-params(13));
T(43) = y(15)^T(5);
T(44) = exp(y(19))*T(8)*T(38);
T(45) = (y(33)*y(11))^T(4);
T(46) = T(44)*T(45);
T(47) = y(17)^T(5);
T(48) = exp(y(21))*T(9)*T(38);
T(49) = (y(34)*y(12))^T(4);
T(50) = T(48)*T(49);
T(51) = T(47)*T(50)-params(13)*params(16);
T(52) = y(10)^T(4);
T(53) = T(39)*T(52);
T(54) = T(37)*T(53)-params(16)*(1-params(7))*(1-params(13));
T(55) = y(12)^T(4);
T(56) = T(48)*T(55);
T(57) = T(47)*T(56)-params(13)*params(16);

end
