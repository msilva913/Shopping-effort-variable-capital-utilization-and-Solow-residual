function T = static_g1_tt(T, y, x, params)
% function T = static_g1_tt(T, y, x, params)
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

T = BRS_growth_alt.static_resid_tt(T, y, x, params);

T(32) = exp(y(12))*getPowerDeriv(y(16),1/params(9),1);
T(33) = getPowerDeriv(y(19),(-params(1)),1);
T(34) = exp(y(21))*getPowerDeriv(exp(y(21)),(-T(3)),1);

end
