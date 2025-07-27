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

assert(length(T) >= 81);

T = SU_sectoral_wo_vcu.static_resid_tt(T, y, x, params);

T(70) = 1/y(1);
T(71) = getPowerDeriv(T(31),1/T(1),1);
T(72) = getPowerDeriv(T(18),1/(1+params(17)),1);
T(73) = getPowerDeriv(y(17)/y(19),params(17),1);
T(74) = getPowerDeriv(y(18)/y(19),params(17),1);
T(75) = T(20)*getPowerDeriv(y(19),T(15),1);
T(76) = exp(y(25))*getPowerDeriv(y(42),1/params(15),1);
T(77) = T(5)*getPowerDeriv(y(43),params(14),1);
T(78) = T(6)*getPowerDeriv(y(44),params(14),1);
T(79) = T(7)*getPowerDeriv(y(45),params(14),1);
T(80) = params(2)*exp(y(27))*T(33)*getPowerDeriv(T(33),(-params(1)),1);
T(81) = T(33)*getPowerDeriv(T(33),(-T(2)),1);

end
