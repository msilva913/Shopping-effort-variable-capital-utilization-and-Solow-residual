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

assert(length(T) >= 64);

T(1) = 1+params(13)/params(14)-exp(params(3));
T(2) = T(1)+exp(params(3))^params(1)/params(2)-1;
T(3) = (1+params(19))*params(18)/(1+params(19)*params(18));
T(4) = (params(6)-1)/params(6);
T(5) = params(14)*T(2)/(1+params(16));
T(6) = 1-T(3);
T(7) = params(15)*T(6)/(1+params(16));
T(8) = T(3)^(params(19)/(1+params(19)));
T(9) = params(20)/(T(8)*(1-params(13))*(1-params(7)))^T(3);
T(10) = params(20)/(T(8)*(1-params(13))*params(7))^T(3);
T(11) = params(20)/(params(13)*T(8))^T(3);
T(12) = params(16)*(1-params(13))*(1-params(7))/params(20);
T(13) = params(16)*(1-params(13))*params(7)/params(20);
T(14) = params(13)*params(16)/params(20);
T(15) = exp(params(3))^(-T(5));
T(16) = (T(12)+(1-params(13))*(1-params(7))/params(20))/(T(15)*((1-params(13))*(1-params(7))*params(14)*exp(params(3)))^T(5)*((1-params(13))*(1-params(7))*params(32))^T(7));
T(17) = (T(13)+(1-params(13))*params(7)/params(20))/(T(15)*((1-params(13))*params(7)*params(14)*exp(params(3)))^T(5)*((1-params(13))*params(7)*params(32))^T(7));
T(18) = (T(14)+params(13)/params(20))/(T(15)*(params(13)*params(14)*exp(params(3)))^T(5)*(params(13)*params(32))^T(7));
T(19) = 1+1/params(19);
T(20) = 1/params(4);
T(21) = (1-params(13))^(-params(21));
T(22) = (1-(1-params(13)))^(-params(21));
T(23) = y(15)^(1+params(21))*T(21)+y(16)^(1+params(21))*T(22);
T(24) = (y(15)/y(17))^params(21);
T(25) = T(6)*params(15)/params(32)/(params(8)*((1-params(13))*(1-params(17))-(T(8))^T(19)/T(19))*params(32)^T(20))*exp(y(21));
T(26) = y(17)^T(20)*T(25);
T(27) = (y(16)/y(17))^params(21);
T(28) = 1-T(4);
T(29) = (1-params(7))^T(28);
T(30) = params(7)^T(28);
T(31) = y(50)^(-params(1));
T(32) = T(6)*y(55)*T(31);
T(33) = exp(y(22))*y(46)^(1/params(19));
T(34) = exp(y(22))*y(46)^T(19)/T(19);
T(35) = y(2)-params(17)*y(2)-T(34);
T(36) = T(25)*y(17)^(1+T(20))/(1+T(20));
T(37) = y(51)*T(36);
T(38) = T(35)^params(5);
T(39) = y(51)^(1-params(5));
T(40) = T(30)*y(4)^T(4)+T(29)*y(3)^T(4);
T(41) = T(2)*params(9)/2;
T(42) = params(2)*exp(y(24))*exp(y(66))^(-params(1));
T(43) = y(60)^2;
T(44) = y(44)*y(58)*T(42)*T(43);
T(45) = y(61)^2;
T(46) = y(45)*T(42)*y(59)*T(45);
T(47) = T(9)*y(47)^T(3);
T(48) = exp(y(66))^(-T(5));
T(49) = exp(y(18))*T(16)*T(48);
T(50) = (y(33)*y(9))^T(5);
T(51) = y(13)^T(7);
T(52) = T(10)*y(48)^T(3);
T(53) = exp(y(18))*T(17)*T(48);
T(54) = (y(34)*y(10))^T(5);
T(55) = T(53)*T(54);
T(56) = y(14)^T(7);
T(57) = T(11)*y(49)^T(3);
T(58) = exp(y(20))*T(18)*T(48);
T(59) = (y(35)*y(11))^T(5);
T(60) = y(16)^T(7);
T(61) = y(9)^T(5);
T(62) = T(51)*T(61)-T(12);
T(63) = y(11)^T(5);
T(64) = T(60)*T(63)-T(14);

end
