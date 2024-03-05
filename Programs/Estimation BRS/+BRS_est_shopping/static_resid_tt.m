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

T(1) = (1+params(3))^params(1)*1/(1+(1+params(2))^0.25-1.0);
T(2) = 1-(params(5)/params(6)-params(3));
T(3) = T(1)*(1+params(3))^(-params(1));
T(4) = params(6)*(1-T(2)*T(3))/T(3);
T(5) = params(8)^(params(9)/(1+params(9)));
T(6) = params(10)/(T(5)*(1-params(5)))^params(8);
T(7) = params(10)/(params(5)*T(5))^params(8);
T(8) = (1-params(5))/(params(10)*(params(6)*(1-params(5)))^T(4)*((1-params(5))*params(16))^((1-params(8))*params(7)));
T(9) = params(5)/(params(10)*(params(5)*params(6))^T(4)*(params(5)*params(16))^((1-params(8))*params(7)));
T(10) = 1/params(4);
T(11) = (1-params(8))*params(5)*(1-params(8))*params(7)*params(15)/(1-params(8))/(params(5)*params(16))/params(16)^T(10)*exp(y(13));
T(12) = y(7)^T(10)*T(11);
T(13) = exp(y(14))*y(18)^(1/params(9));
T(14) = 1+1/params(9);
T(15) = exp(y(14))*y(18)^T(14)/T(14);
T(16) = T(11)*y(7)^(1+T(10))/(1+T(10));
T(17) = y(21)^(-params(1));
T(18) = y(8)^((1-params(8))*params(7));
T(19) = exp(y(10))*T(8)*T(6)*y(19)^params(8);
T(20) = y(5)^T(4);
T(21) = T(19)*T(20);
T(22) = y(9)^((1-params(8))*params(7));
T(23) = exp(y(12))*T(9)*T(7)*y(20)^params(8);
T(24) = y(6)^T(4);
T(25) = T(23)*T(24);
T(26) = (1-params(8))*params(7)/T(4);

end
