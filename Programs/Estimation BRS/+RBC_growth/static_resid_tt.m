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

assert(length(T) >= 35);

T(1) = (1+params(3))^0.25-1.0;
T(2) = 1+params(8)/params(9)-exp(params(4));
T(3) = exp(params(4))^params(1)*1/(1+T(1));
T(4) = params(9)*(T(1)+T(2))/(1+params(11));
T(5) = params(10)/(1+params(11));
T(6) = exp(params(4))^(-T(4));
T(7) = (1-params(8)+params(11)*(1-params(8)))/(T(6)*((1-params(8))*params(9)*exp(params(4)))^T(4)*((1-params(8))*params(20))^T(5));
T(8) = (params(8)+params(8)*params(11))/(T(6)*(params(8)*params(9)*exp(params(4)))^T(4)*(params(8)*params(20))^T(5));
T(9) = 1/params(5);
T(10) = (1-params(8))^(-params(13));
T(11) = (1-(1-params(8)))^(-params(13));
T(12) = y(8)^(1+params(13))*T(10)+y(9)^(1+params(13))*T(11);
T(13) = (y(8)/y(10))^params(13);
T(14) = params(10)/params(20)/params(20)^T(9)*exp(y(14));
T(15) = y(10)^T(9)*T(14);
T(16) = (y(9)/y(10))^params(13);
T(17) = T(14)*y(10)^(1+T(9))/(1+T(9));
T(18) = y(31)^2;
T(19) = T(3)*exp(y(34))^(-params(1));
T(20) = (T(1)+T(2))*params(6)/2;
T(21) = y(8)^T(5);
T(22) = exp(y(34))^(-T(4));
T(23) = exp(y(11))*T(7)*T(22);
T(24) = (y(20)*y(5))^T(4);
T(25) = y(9)^T(5);
T(26) = exp(y(13))*T(8)*T(22);
T(27) = (y(21)*y(6))^T(4);
T(28) = y(2)/y(1);
T(29) = T(28)*(T(21)*T(24)-params(11)*(1-params(8)));
T(30) = y(5)^T(4);
T(31) = T(21)*T(30)-params(11)*(1-params(8));
T(32) = y(3)/y(1);
T(33) = T(32)*(T(25)*T(27)-params(8)*params(11));
T(34) = y(6)^T(4);
T(35) = T(25)*T(34)-params(8)*params(11);

end
