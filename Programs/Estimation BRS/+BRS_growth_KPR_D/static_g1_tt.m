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

assert(length(T) >= 61);

T = BRS_growth_KPR_D.static_resid_tt(T, y, x, params);

T(47) = getPowerDeriv(y(22)*y(5),T(5),1);
T(48) = getPowerDeriv(y(23)*y(6),T(5),1);
T(49) = getPowerDeriv(T(18),1/(1+params(16)),1);
T(50) = getPowerDeriv(y(8)/y(10),params(16),1);
T(51) = getPowerDeriv(y(8),T(6),1);
T(52) = getPowerDeriv(y(9)/y(10),params(16),1);
T(53) = getPowerDeriv(y(9),T(6),1);
T(54) = T(21)*(-(getPowerDeriv(1-y(10),(-params(5)),1)));
T(55) = exp(y(15))*getPowerDeriv(y(30),1/params(14),1);
T(56) = getPowerDeriv(y(31),T(4),1);
T(57) = T(8)*T(56);
T(58) = getPowerDeriv(y(32),T(4),1);
T(59) = T(9)*T(58);
T(60) = T(3)*exp(y(39))*getPowerDeriv(exp(y(39)),(-params(1)),1);
T(61) = exp(y(39))*getPowerDeriv(exp(y(39)),(-T(5)),1);

end
