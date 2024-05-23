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

assert(length(T) >= 112);

T = BRS_sectoral.static_resid_tt(T, y, x, params);

T(90) = 1/y(1);
T(91) = getPowerDeriv(T(30),params(5),1);
T(92) = getPowerDeriv(T(37),1/T(3),1);
T(93) = getPowerDeriv(y(36)*y(11),T(4),1);
T(94) = getPowerDeriv(y(37)*y(12),T(4),1);
T(95) = getPowerDeriv(y(38)*y(13),T(4),1);
T(96) = getPowerDeriv(y(15),T(5),1);
T(97) = T(48)*T(53)*T(96);
T(98) = getPowerDeriv(y(16),T(5),1);
T(99) = T(55)*T(59)*T(98);
T(100) = getPowerDeriv(T(21),1/(1+params(21)),1);
T(101) = getPowerDeriv(y(17)/y(19),params(21),1);
T(102) = getPowerDeriv(y(18)/y(19),params(21),1);
T(103) = getPowerDeriv(y(18),T(5),1);
T(104) = T(61)*T(65)*T(103);
T(105) = T(23)*getPowerDeriv(y(19),T(18),1);
T(106) = exp(y(25))*getPowerDeriv(y(52),1/params(19),1);
T(107) = exp(y(25))*getPowerDeriv(y(52),T(17),1)/T(17);
T(108) = T(7)*getPowerDeriv(y(53),params(18),1);
T(109) = T(8)*getPowerDeriv(y(54),params(18),1);
T(110) = T(9)*getPowerDeriv(y(55),params(18),1);
T(111) = params(2)*exp(y(27))*T(39)*getPowerDeriv(T(39),(-params(1)),1);
T(112) = T(39)*getPowerDeriv(T(39),(-T(4)),1);

end
