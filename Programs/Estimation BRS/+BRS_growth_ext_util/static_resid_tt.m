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

assert(length(T) >= 34);

T(1) = (1+params(2))^0.25-1.0;
T(2) = 1+params(7)/params(8)-exp(params(3));
T(3) = exp(params(3))^params(1)*1/(1+T(1));
T(4) = params(10)^(params(11)/(1+params(11)));
T(5) = params(12)/(T(4)*(1-params(7)))^params(10);
T(6) = params(12)/(params(7)*T(4))^params(10);
T(7) = params(12)*exp(params(3))^(-(params(8)*(T(1)+T(2))));
T(8) = (1-params(7))/(T(7)*((1-params(7))*params(8)*exp(params(3)))^(params(8)*(T(1)+T(2)))*((1-params(7))*params(20))^((1-params(10))*params(9)));
T(9) = params(7)/(T(7)*(params(7)*params(8)*exp(params(3)))^(params(8)*(T(1)+T(2)))*(params(7)*params(20))^((1-params(10))*params(9)));
T(10) = 1/params(4);
T(11) = (1-params(10))*params(7)*(1-params(10))*params(9)*params(19)/(1-params(10))/(params(7)*params(20))/params(20)^T(10)*exp(y(11));
T(12) = y(7)^T(10)*T(11);
T(13) = exp(y(12))*y(23)^(1/params(11));
T(14) = 1+1/params(11);
T(15) = exp(y(12))*y(23)^T(14)/T(14);
T(16) = T(11)*y(7)^(1+T(10))/(1+T(10));
T(17) = exp(y(13))*y(2)-T(15)-T(16);
T(18) = (1-params(6)*(y(30)-params(7)/params(8)))^(-1);
T(19) = params(6)/2*(y(30)-params(7)/params(8))^2;
T(20) = T(3)*exp(y(32))^(-params(1));
T(21) = (T(1)+T(2))*params(5)/2;
T(22) = y(8)^((1-params(10))*params(9));
T(23) = y(24)^params(10);
T(24) = exp(y(32))^(-(params(8)*(T(1)+T(2))));
T(25) = T(8)*T(5)*T(23)*T(24);
T(26) = (y(17)*y(5))^(params(8)*(T(1)+T(2)));
T(27) = T(25)*T(26);
T(28) = y(9)^((1-params(10))*params(9));
T(29) = y(25)^params(10);
T(30) = T(24)*exp(y(10))*T(9)*T(6)*T(29);
T(31) = (y(18)*y(6))^(params(8)*(T(1)+T(2)));
T(32) = T(30)*T(31);
T(33) = y(17)^(params(8)*(T(1)+T(2)));
T(34) = y(18)^(params(8)*(T(1)+T(2)));

end
