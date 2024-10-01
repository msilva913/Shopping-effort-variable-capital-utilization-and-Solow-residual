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

assert(length(T) >= 26);

T(1) = params(6)*(exp(params(3))^params(1)/params(2)-1+1+params(5)/params(6)-exp(params(3)));
T(2) = exp(params(3))^(-T(1));
T(3) = 1/params(4);
T(4) = params(5)*params(7)*params(12)/(params(5)*params(13))/params(13)^T(3)*exp(y(14));
T(5) = y(8)^T(3)*T(4);
T(6) = T(4)*y(8)^(1+T(3))/(1+T(3));
T(7) = y(18)^(-params(1));
T(8) = exp(y(20))^(-params(1));
T(9) = 1-(1+params(5)/params(6)-exp(params(3)));
T(10) = y(9)^params(7);
T(11) = (1-params(5))/(T(2)*((1-params(5))*exp(params(3))*params(6))^T(1)*((1-params(5))*params(13))^params(7))*exp(y(11));
T(12) = exp(y(20))^(-T(1));
T(13) = T(11)*T(12);
T(14) = y(6)^T(1);
T(15) = T(13)*T(14);
T(16) = y(10)^params(7);
T(17) = params(5)/(T(2)*(params(5)*exp(params(3))*params(6))^T(1)*(params(5)*params(13))^params(7))*exp(y(13));
T(18) = T(12)*T(17);
T(19) = y(7)^T(1);
T(20) = T(18)*T(19);
T(21) = exp(y(20))^(1-params(7));
T(22) = y(6)^(1-params(7));
T(23) = T(10)*T(22);
T(24) = y(7)^(1-params(7));
T(25) = T(16)*T(24);
T(26) = y(2)*y(2)/y(1)/T(23)+y(3)*y(3)/y(1)/T(25);

end
