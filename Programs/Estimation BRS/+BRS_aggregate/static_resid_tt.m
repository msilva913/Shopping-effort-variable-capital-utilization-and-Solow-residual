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

assert(length(T) >= 63);

T(1) = 1+params(13)/params(14)-exp(params(3));
T(2) = T(1)+exp(params(3))^params(1)/params(2)-1;
T(3) = (1+params(19))*params(18)/(1+params(19)*params(18));
T(4) = (params(6)-1)/params(6);
T(5) = params(14)*T(2)/(1+params(16));
T(6) = params(15)*(1-T(3))/(1+params(16));
T(7) = T(3)^(params(19)/(1+params(19)));
T(8) = params(20)/(T(7)*(1-params(13))*(1-params(7)))^T(3);
T(9) = params(20)/(T(7)*(1-params(13))*params(7))^T(3);
T(10) = params(20)/(params(13)*T(7))^T(3);
T(11) = params(16)*(1-params(13))*(1-params(7))/params(20);
T(12) = params(16)*(1-params(13))*params(7)/params(20);
T(13) = params(13)*params(16)/params(20);
T(14) = exp(params(3))^(-T(5));
T(15) = (T(11)+(1-params(13))*(1-params(7))/params(20))/(T(14)*((1-params(13))*(1-params(7))*params(14)*exp(params(3)))^T(5)*((1-params(13))*(1-params(7))*params(32))^T(6));
T(16) = (T(12)+(1-params(13))*params(7)/params(20))/(T(14)*((1-params(13))*params(7)*params(14)*exp(params(3)))^T(5)*((1-params(13))*params(7)*params(32))^T(6));
T(17) = (T(13)+params(13)/params(20))/(T(14)*(params(13)*params(14)*exp(params(3)))^T(5)*(params(13)*params(32))^T(6));
T(18) = 1+1/params(19);
T(19) = 1/params(4);
T(20) = (1-T(3))*params(15)/params(32)/(params(8)*((1-params(13))*(1-params(17))-(T(7))^T(18)/T(18))*params(32)^T(19));
T(21) = (1-params(13))^(-params(21));
T(22) = (1-(1-params(13)))^(-params(21));
T(23) = y(15)^(1+params(21))*T(21)+y(16)^(1+params(21))*T(22);
T(24) = (y(15)/y(17))^params(21);
T(25) = y(17)^T(19);
T(26) = y(50)^(-params(1));
T(27) = T(25)*exp(y(21))*T(20)*T(26);
T(28) = (y(16)/y(17))^params(21);
T(29) = 1-T(4);
T(30) = (1-params(7))^T(29);
T(31) = params(7)^T(29);
T(32) = exp(y(22))*y(46)^(1/params(19));
T(33) = exp(y(22))*y(46)^T(18)/T(18);
T(34) = y(2)-params(17)*y(2)-T(33);
T(35) = y(17)^(1+T(19))*T(20)*exp(y(21))/(1+T(19));
T(36) = y(51)*T(35);
T(37) = T(34)^params(5);
T(38) = y(51)^(1-params(5));
T(39) = T(31)*y(4)^T(4)+T(30)*y(3)^T(4);
T(40) = T(2)*params(9)/2;
T(41) = params(2)*exp(y(24))*exp(y(66))^(-params(1));
T(42) = y(60)^2;
T(43) = y(44)*y(58)*T(41)*T(42);
T(44) = y(61)^2;
T(45) = y(45)*T(41)*y(59)*T(44);
T(46) = T(8)*y(47)^T(3);
T(47) = exp(y(66))^(-T(5));
T(48) = exp(y(18))*T(15)*T(47);
T(49) = (y(33)*y(9))^T(5);
T(50) = y(13)^T(6);
T(51) = T(9)*y(48)^T(3);
T(52) = exp(y(18))*T(16)*T(47);
T(53) = (y(34)*y(10))^T(5);
T(54) = T(52)*T(53);
T(55) = y(14)^T(6);
T(56) = T(10)*y(49)^T(3);
T(57) = exp(y(20))*T(17)*T(47);
T(58) = (y(35)*y(11))^T(5);
T(59) = y(16)^T(6);
T(60) = y(9)^T(5);
T(61) = T(50)*T(60)-T(11);
T(62) = y(11)^T(5);
T(63) = T(59)*T(62)-T(13);

end
