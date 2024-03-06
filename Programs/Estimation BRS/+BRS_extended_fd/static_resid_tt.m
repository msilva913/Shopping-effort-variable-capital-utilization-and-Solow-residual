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

assert(length(T) >= 29);

T(1) = (1+params(2))^0.25-1.0;
T(2) = (1+params(3))^params(1)*1/(1+T(1));
T(3) = params(7)/params(8)-params(3);
T(4) = T(2)*(1+params(3))^(-params(1));
T(5) = params(8)*(1-T(4)*(1-T(3)))/T(4);
T(6) = params(10)^(params(11)/(1+params(11)));
T(7) = params(12)/(T(6)*(1-params(7)))^params(10);
T(8) = params(12)/(params(7)*T(6))^params(10);
T(9) = (1-params(7))/(params(12)*(params(8)*(1-params(7)))^T(5)*((1-params(7))*params(18))^((1-params(10))*params(9)));
T(10) = params(7)/(params(12)*(params(7)*params(8))^T(5)*(params(7)*params(18))^((1-params(10))*params(9)));
T(11) = 1/params(4);
T(12) = (1-params(10))*params(7)*(1-params(10))*params(9)*params(17)/(1-params(10))/(params(7)*params(18))/params(18)^T(11)*exp(y(13));
T(13) = y(7)^T(11)*T(12);
T(14) = exp(y(14))*y(24)^(1/params(11));
T(15) = 1+1/params(11);
T(16) = exp(y(14))*y(24)^T(15)/T(15);
T(17) = T(12)*y(7)^(1+T(11))/(1+T(11));
T(18) = (1-params(6)*(y(30)-T(3)))^(-1);
T(19) = params(6)/2*(y(30)-T(3))^2;
T(20) = (T(1)+T(3))*params(5)/2;
T(21) = y(8)^((1-params(10))*params(9));
T(22) = exp(y(10))*T(9)*T(7)*y(25)^params(10);
T(23) = (y(18)*y(5))^T(5);
T(24) = T(22)*T(23);
T(25) = y(9)^((1-params(10))*params(9));
T(26) = exp(y(12))*T(10)*T(8)*y(26)^params(10);
T(27) = (y(19)*y(6))^T(5);
T(28) = T(26)*T(27);
T(29) = (1-params(10))*params(9)/T(5);

end
