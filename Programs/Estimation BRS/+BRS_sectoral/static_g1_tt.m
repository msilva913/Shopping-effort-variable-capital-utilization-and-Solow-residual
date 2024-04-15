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

assert(length(T) >= 92);

T = BRS_sectoral.static_resid_tt(T, y, x, params);

T(69) = getPowerDeriv(y(2)/y(3),T(28),1);
T(70) = getPowerDeriv(y(2)/y(4),T(28),1);
T(71) = getPowerDeriv(T(33),params(5),1);
T(72) = getPowerDeriv(T(38),1/T(3),1);
T(73) = getPowerDeriv(y(33)*y(9),T(4),1);
T(74) = getPowerDeriv(y(34)*y(10),T(4),1);
T(75) = getPowerDeriv(y(35)*y(11),T(4),1);
T(76) = getPowerDeriv(y(13),T(5),1);
T(77) = T(45)*T(50)*T(76);
T(78) = getPowerDeriv(T(22),1/(1+params(21)),1);
T(79) = getPowerDeriv(y(15)/y(17),params(21),1);
T(80) = getPowerDeriv(y(16)/y(17),params(21),1);
T(81) = getPowerDeriv(y(16),T(5),1);
T(82) = T(57)*T(61)*T(81);
T(83) = exp(y(21))*T(19)*T(25)*getPowerDeriv(y(17),T(18),1);
T(84) = exp(y(22))*getPowerDeriv(y(46),1/params(19),1);
T(85) = exp(y(22))*getPowerDeriv(y(46),T(17),1)/T(17);
T(86) = T(7)*getPowerDeriv(y(47),params(18),1);
T(87) = T(8)*getPowerDeriv(y(48),params(18),1);
T(88) = T(9)*getPowerDeriv(y(49),params(18),1);
T(89) = getPowerDeriv(y(50),(-params(1)),1);
T(90) = T(24)*exp(y(21))*T(19)*T(89);
T(91) = params(2)*exp(y(24))*exp(y(66))*getPowerDeriv(exp(y(66)),(-params(1)),1);
T(92) = exp(y(66))*getPowerDeriv(exp(y(66)),(-T(4)),1);

end
