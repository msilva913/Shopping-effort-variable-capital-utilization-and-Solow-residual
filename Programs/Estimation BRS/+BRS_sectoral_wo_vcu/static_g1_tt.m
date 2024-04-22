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

assert(length(T) >= 74);

T = BRS_sectoral_wo_vcu.static_resid_tt(T, y, x, params);

T(62) = getPowerDeriv(T(28),params(5),1);
T(63) = getPowerDeriv(T(35),1/T(1),1);
T(64) = getPowerDeriv(T(19),1/(1+params(19)),1);
T(65) = getPowerDeriv(y(16)/y(18),params(19),1);
T(66) = getPowerDeriv(y(17)/y(18),params(19),1);
T(67) = T(21)*getPowerDeriv(y(18),T(16),1);
T(68) = exp(y(23))*getPowerDeriv(y(40),1/params(17),1);
T(69) = exp(y(23))*getPowerDeriv(y(40),T(15),1)/T(15);
T(70) = T(5)*getPowerDeriv(y(41),params(16),1);
T(71) = T(6)*getPowerDeriv(y(42),params(16),1);
T(72) = T(7)*getPowerDeriv(y(43),params(16),1);
T(73) = params(2)*exp(y(25))*T(37)*getPowerDeriv(T(37),(-params(1)),1);
T(74) = T(37)*getPowerDeriv(T(37),(-T(2)),1);

end
