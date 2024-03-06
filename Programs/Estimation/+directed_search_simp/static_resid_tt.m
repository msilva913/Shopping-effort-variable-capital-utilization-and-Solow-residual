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

assert(length(T) >= 8);

T(1) = params(3)*(1-params(6)*params(7))/params(6)/(1/params(2)-1+params(3));
T(2) = (params(6)+1/params(8)-sqrt((-(params(6)+1/params(8)))^2-1.0*(1/params(8)-1)*4))/(2*(1/params(8)-1));
T(3) = 1-1/params(8)+1/T(2);
T(4) = 1-T(1);
T(5) = 1-T(3);
T(6) = params(9)*T(2)*(-T(3))/params(6)*(1-T(2));
T(7) = (T(3)-1)*params(5)/(T(4)-(T(3)-1));
T(8) = params(2)*(1/params(2)-1+params(3));

end
