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

assert(length(T) >= 33);

T = BRS_extended_fd.static_resid_tt(T, y, x, params);

T(30) = getPowerDeriv(y(18)*y(5),T(5),1);
T(31) = getPowerDeriv(y(19)*y(6),T(5),1);
T(32) = exp(y(14))*getPowerDeriv(y(24),1/params(11),1);
T(33) = (-(T(2)*y(29)*(params(6)*(y(30)-T(3))+params(6)*y(30)-params(6)/2*2*(y(30)-T(3)))));

end
