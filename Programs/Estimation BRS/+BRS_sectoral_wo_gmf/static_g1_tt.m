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

assert(length(T) >= 71);

T = BRS_sectoral_wo_gmf.static_resid_tt(T, y, x, params);

T(58) = getPowerDeriv(T(26),1/T(3),1);
T(59) = getPowerDeriv(y(32)*y(10),T(4),1);
T(60) = getPowerDeriv(y(33)*y(11),T(4),1);
T(61) = getPowerDeriv(y(34)*y(12),T(4),1);
T(62) = getPowerDeriv(y(14),T(5),1);
T(63) = T(41)*T(62);
T(64) = getPowerDeriv(T(13),1/(1+params(18)),1);
T(65) = getPowerDeriv(y(16)/y(18),params(18),1);
T(66) = getPowerDeriv(y(17)/y(18),params(18),1);
T(67) = getPowerDeriv(y(17),T(5),1);
T(68) = T(50)*T(67);
T(69) = T(15)*getPowerDeriv(y(18),T(10),1);
T(70) = params(2)*exp(y(23))*T(28)*getPowerDeriv(T(28),(-params(1)),1);
T(71) = T(28)*getPowerDeriv(T(28),(-T(4)),1);

end
