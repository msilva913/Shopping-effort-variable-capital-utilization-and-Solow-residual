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
T(2) = exp(params(4))^params(1)*1/(1+T(1));
T(3) = (1+params(11))*params(10)/(1+params(11)*params(10));
T(4) = params(8)*(1-T(3))/(1+params(9));
T(5) = params(7)*(T(1)+1+params(6)/params(7)-exp(params(4)))/(1+params(9));
T(6) = T(3)^(params(11)/(1+params(11)));
T(7) = params(12)/(T(6)*(1-params(6)))^T(3);
T(8) = params(12)/(params(6)*T(6))^T(3);
T(9) = params(9)*(1-params(6))/params(12);
T(10) = params(6)*params(9)/params(12);
T(11) = exp(params(4))^(-T(5));
T(12) = (T(9)+(1-params(6))/params(12))/(T(11)*((1-params(6))*params(7)*exp(params(4)))^T(5)*((1-params(6))*params(19))^T(4));
T(13) = (T(10)+params(6)/params(12))/(T(11)*(params(6)*params(7)*exp(params(4)))^T(5)*(params(6)*params(19))^T(4));
T(14) = 1/params(5);
T(15) = (1-T(3))*params(8)/params(19)/params(19)^T(14)*exp(y(13));
T(16) = y(7)^T(14)*T(15);
T(17) = exp(y(14))*y(18)^(1/params(11));
T(18) = 1+1/params(11);
T(19) = exp(y(14))*y(18)^T(18)/T(18);
T(20) = T(15)*y(7)^(1+T(14))/(1+T(14));
T(21) = y(21)^(-params(1));
T(22) = exp(y(23))^(-params(1));
T(23) = 1-(1+params(6)/params(7)-exp(params(4)));
T(24) = T(2)*((1-T(3))*y(15)+y(22)*T(23));
T(25) = T(7)*y(19)^T(3);
T(26) = exp(y(23))^(-T(5));
T(27) = exp(y(10))*T(12)*T(26);
T(28) = y(5)^T(5);
T(29) = T(27)*T(28);
T(30) = y(8)^T(4);
T(31) = T(8)*y(20)^T(3);
T(32) = exp(y(12))*T(13)*T(26);
T(33) = y(6)^T(5);
T(34) = T(32)*T(33);
T(35) = y(9)^T(4);

end
