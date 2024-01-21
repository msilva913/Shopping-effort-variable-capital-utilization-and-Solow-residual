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

assert(length(T) >= 40);

T = BRS.static_resid_tt(T, y, x, params);

T(28) = getPowerDeriv(y(5),T(4),1);
T(29) = T(20)*T(28);
T(30) = getPowerDeriv(y(6),T(4),1);
T(31) = T(24)*T(30);
T(32) = T(11)*getPowerDeriv(y(7),T(10),1);
T(33) = T(11)*getPowerDeriv(y(7),1+T(10),1)/(1+T(10));
T(34) = getPowerDeriv(y(8),(1-params(8))*params(7),1);
T(35) = getPowerDeriv(y(9),(1-params(8))*params(7),1);
T(36) = exp(y(14))*getPowerDeriv(y(18),T(13),1);
T(37) = exp(y(14))*getPowerDeriv(y(18),T(15),1)/T(15);
T(38) = exp(y(10))*T(8)*T(6)*getPowerDeriv(y(19),params(8),1);
T(39) = exp(y(12))*T(9)*T(7)*getPowerDeriv(y(20),params(8),1);
T(40) = getPowerDeriv(y(21),(-params(1)),1);

end
