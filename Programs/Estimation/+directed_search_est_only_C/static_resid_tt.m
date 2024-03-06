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

assert(length(T) >= 12);

T(1) = 1/params(2)-1+params(3);
T(2) = params(10)*T(1)/(params(3)*params(9));
T(3) = T(2)/(1+T(2));
T(4) = 1-T(3);
T(5) = params(7)*T(4);
T(6) = params(9)*params(8)/T(4);
T(7) = 1/params(11)+T(5)*T(6)-1;
T(8) = params(1)^T(5);
T(9) = 1/params(11)+params(8)/T(8);
T(10) = (T(9)-sqrt((-T(9))^2-1.0*T(7)*4))/(2*T(7));
T(11) = 1-1/params(11)+1/T(10);
T(12) = (T(6)-1)/T(6);

end
