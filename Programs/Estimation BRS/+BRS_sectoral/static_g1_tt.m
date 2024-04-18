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

assert(length(T) >= 94);

T = BRS_sectoral.static_resid_tt(T, y, x, params);

T(71) = getPowerDeriv(y(2)/y(3),T(28),1);
T(72) = getPowerDeriv(y(2)/y(4),T(28),1);
T(73) = getPowerDeriv(T(33),params(5),1);
T(74) = getPowerDeriv(T(38),1/T(3),1);
T(75) = getPowerDeriv(y(34)*y(10),T(4),1);
T(76) = getPowerDeriv(y(35)*y(11),T(4),1);
T(77) = getPowerDeriv(y(36)*y(12),T(4),1);
T(78) = getPowerDeriv(y(14),T(5),1);
T(79) = T(47)*T(52)*T(78);
T(80) = getPowerDeriv(T(22),1/(1+params(23)),1);
T(81) = getPowerDeriv(y(16)/y(18),params(23),1);
T(82) = getPowerDeriv(y(17)/y(18),params(23),1);
T(83) = getPowerDeriv(y(17),T(5),1);
T(84) = T(59)*T(63)*T(83);
T(85) = exp(y(22))*T(19)*T(25)*getPowerDeriv(y(18),T(18),1);
T(86) = exp(y(23))*getPowerDeriv(y(49),1/params(21),1);
T(87) = exp(y(23))*getPowerDeriv(y(49),T(17),1)/T(17);
T(88) = T(7)*getPowerDeriv(y(50),params(20),1);
T(89) = T(8)*getPowerDeriv(y(51),params(20),1);
T(90) = T(9)*getPowerDeriv(y(52),params(20),1);
T(91) = getPowerDeriv(y(53),(-params(1)),1);
T(92) = T(24)*exp(y(22))*T(19)*T(91);
T(93) = params(2)*exp(y(25))*T(39)*getPowerDeriv(T(39),(-params(1)),1);
T(94) = T(39)*getPowerDeriv(T(39),(-T(4)),1);

end
