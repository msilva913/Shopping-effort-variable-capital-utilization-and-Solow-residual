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

assert(length(T) >= 67);

T = BRS_sectoral_unr_lim.static_resid_tt(T, y, x, params);

T(51) = getPowerDeriv(y(22)*y(5),T(5),1);
T(52) = getPowerDeriv(y(23)*y(6),T(5),1);
T(53) = getPowerDeriv(T(19),1/(1+params(16)),1);
T(54) = getPowerDeriv(y(8)/y(10),params(16),1);
T(55) = getPowerDeriv(y(8),T(7),1);
T(56) = getPowerDeriv(y(9)/y(10),params(16),1);
T(57) = getPowerDeriv(y(9),T(7),1);
T(58) = getPowerDeriv(y(10),1/params(5),1);
T(59) = exp(y(14))*(-(T(6)*params(10)/params(25)*T(58)))/(T(16)*T(16));
T(60) = T(21)*T(58)+T(16)*T(59);
T(61) = exp(y(15))*getPowerDeriv(y(30),1/params(14),1);
T(62) = getPowerDeriv(y(31),T(4),1);
T(63) = T(9)*T(62);
T(64) = getPowerDeriv(y(32),T(4),1);
T(65) = T(10)*T(64);
T(66) = T(3)*exp(y(39))*getPowerDeriv(exp(y(39)),(-params(1)),1);
T(67) = exp(y(39))*getPowerDeriv(exp(y(39)),(-T(5)),1);

end
