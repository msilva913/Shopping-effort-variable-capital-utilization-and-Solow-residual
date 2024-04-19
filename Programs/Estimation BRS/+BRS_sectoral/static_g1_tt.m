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

assert(length(T) >= 91);

T = BRS_sectoral.static_resid_tt(T, y, x, params);

T(72) = getPowerDeriv(T(30),params(5),1);
T(73) = getPowerDeriv(T(37),1/T(3),1);
T(74) = getPowerDeriv(y(34)*y(10),T(4),1);
T(75) = getPowerDeriv(y(35)*y(11),T(4),1);
T(76) = getPowerDeriv(y(36)*y(12),T(4),1);
T(77) = getPowerDeriv(y(14),T(5),1);
T(78) = T(48)*T(53)*T(77);
T(79) = getPowerDeriv(T(21),1/(1+params(21)),1);
T(80) = getPowerDeriv(y(16)/y(18),params(21),1);
T(81) = getPowerDeriv(y(17)/y(18),params(21),1);
T(82) = getPowerDeriv(y(17),T(5),1);
T(83) = T(60)*T(64)*T(82);
T(84) = T(23)*getPowerDeriv(y(18),T(18),1);
T(85) = exp(y(23))*getPowerDeriv(y(49),1/params(19),1);
T(86) = exp(y(23))*getPowerDeriv(y(49),T(17),1)/T(17);
T(87) = T(7)*getPowerDeriv(y(50),params(18),1);
T(88) = T(8)*getPowerDeriv(y(51),params(18),1);
T(89) = T(9)*getPowerDeriv(y(52),params(18),1);
T(90) = params(2)*exp(y(25))*T(39)*getPowerDeriv(T(39),(-params(1)),1);
T(91) = T(39)*getPowerDeriv(T(39),(-T(4)),1);

end
