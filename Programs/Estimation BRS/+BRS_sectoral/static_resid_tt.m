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

assert(length(T) >= 52);

T(1) = (1+params(3))^0.25-1.0;
T(2) = 1+params(11)/params(12)-exp(params(4));
T(3) = exp(params(4))^params(1)*1/(1+T(1));
T(4) = (1+params(17))*params(16)/(1+params(17)*params(16));
T(5) = params(12)*(T(1)+T(2))/(1+params(14));
T(6) = params(13)*(1-T(4))/(1+params(14));
T(7) = T(4)^(params(17)/(1+params(17)));
T(8) = params(18)/(T(7)*(1-params(11)))^T(4);
T(9) = params(18)/(params(11)*T(7))^T(4);
T(10) = params(14)*(1-params(11))/params(18);
T(11) = params(11)*params(14)/params(18);
T(12) = exp(params(4))^(-T(5));
T(13) = (T(10)+(1-params(11))/params(18))/(T(12)*((1-params(11))*params(12)*exp(params(4)))^T(5)*((1-params(11))*params(28))^T(6));
T(14) = (T(11)+params(11)/params(18))/(T(12)*(params(11)*params(12)*exp(params(4)))^T(5)*(params(11)*params(28))^T(6));
T(15) = 1+1/params(17);
T(16) = 1/params(5);
T(17) = (1-params(11))^(-params(19));
T(18) = (1-(1-params(11)))^(-params(19));
T(19) = y(10)^(1+params(19))*T(17)+y(11)^(1+params(19))*T(18);
T(20) = (y(10)/y(12))^params(19);
T(21) = (1-T(4))*params(13)/params(28)/(((1-params(11))*(1-params(15))-(T(7))^T(15)/T(15))*params(28)^T(16))*exp(y(16));
T(22) = y(12)^T(16)*T(21);
T(23) = (y(11)/y(12))^params(19);
T(24) = exp(y(17))*y(34)^(1/params(17));
T(25) = exp(y(17))*y(34)^T(15)/T(15);
T(26) = exp(y(19))*(y(2)-params(15)*y(2))-T(25);
T(27) = T(21)*y(12)^(1+T(16))/(1+T(16));
T(28) = y(38)*T(27);
T(29) = T(26)^params(6);
T(30) = y(38)^(1-params(6));
T(31) = y(42)^2;
T(32) = T(3)*exp(y(46))^(-params(1));
T(33) = y(43)^2;
T(34) = y(35)^T(4);
T(35) = T(8)*T(34);
T(36) = exp(y(46))^(-T(5));
T(37) = exp(y(13))*T(13)*T(36);
T(38) = (y(24)*y(7))^T(5);
T(39) = y(10)^T(6);
T(40) = y(36)^T(4);
T(41) = T(9)*T(40);
T(42) = exp(y(15))*T(14)*T(36);
T(43) = (y(25)*y(8))^T(5);
T(44) = y(11)^T(6);
T(45) = T(34)*T(8)*y(2)/y(1);
T(46) = T(45)*(T(38)*T(39)-T(10));
T(47) = y(7)^T(5);
T(48) = T(39)*T(47)-T(10);
T(49) = T(40)*T(9)*y(3)/y(1);
T(50) = T(49)*(T(43)*T(44)-T(11));
T(51) = y(8)^T(5);
T(52) = T(44)*T(51)-T(11);

end
