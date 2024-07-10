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

assert(length(T) >= 85);

T = BRS_sectoral_wo_vcu.static_resid_tt(T, y, x, params);

T(73) = getPowerDeriv(T(28),params(5),1);
T(74) = getPowerDeriv(T(35),1/T(1),1);
T(75) = getPowerDeriv(T(19),1/(1+params(19)),1);
T(76) = getPowerDeriv(y(17)/y(19),params(19),1);
T(77) = getPowerDeriv(y(18)/y(19),params(19),1);
T(78) = T(21)*getPowerDeriv(y(19),T(16),1);
T(79) = exp(y(24))*getPowerDeriv(y(41),1/params(17),1);
T(80) = exp(y(24))*getPowerDeriv(y(41),T(15),1)/T(15);
T(81) = T(5)*getPowerDeriv(y(42),params(16),1);
T(82) = T(6)*getPowerDeriv(y(43),params(16),1);
T(83) = T(7)*getPowerDeriv(y(44),params(16),1);
T(84) = params(2)*exp(y(26))*T(37)*getPowerDeriv(T(37),(-params(1)),1);
T(85) = T(37)*getPowerDeriv(T(37),(-T(2)),1);

end
