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

T = BRS_util.static_resid_tt(T, y, x, params);

T(30) = exp(y(14))*getPowerDeriv(y(18),1/params(9),1);
T(31) = T(3)*getPowerDeriv(y(19),params(8),1);
T(32) = T(4)*getPowerDeriv(y(20),params(8),1);
T(33) = getPowerDeriv(y(21),(-params(1)),1);
T(34) = exp(y(23))*getPowerDeriv(exp(y(23)),(-T(1)),1);

end
