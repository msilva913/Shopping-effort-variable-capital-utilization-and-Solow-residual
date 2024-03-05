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

assert(length(T) >= 38);

T = BRS_growth_sep.static_resid_tt(T, y, x, params);

T(34) = exp(y(14))*getPowerDeriv(y(18),1/params(11),1);
T(35) = T(7)*getPowerDeriv(y(19),T(3),1);
T(36) = T(8)*getPowerDeriv(y(20),T(3),1);
T(37) = getPowerDeriv(y(21),(-params(1)),1);
T(38) = exp(y(23))*getPowerDeriv(exp(y(23)),(-T(5)),1);

end
