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

T = BRS_growth_ext_comovement.static_resid_tt(T, y, x, params);

T(32) = getPowerDeriv(y(17)*y(5),params(8)*(T(1)+T(2)),1);
T(33) = getPowerDeriv(y(18)*y(6),params(8)*(T(1)+T(2)),1);
T(34) = exp(y(12))*getPowerDeriv(y(23),1/params(11),1);
T(35) = params(6)/2*2*(y(29)-params(7)/params(8));
T(36) = (-(T(19)*y(28)*(params(6)*(y(29)-params(7)/params(8))+params(6)*y(29)-T(35))));
T(37) = T(3)*exp(y(30))*getPowerDeriv(exp(y(30)),(-params(1)),1);
T(38) = exp(y(30))*getPowerDeriv(exp(y(30)),(-(params(8)*(T(1)+T(2)))),1);

end
