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

assert(length(T) >= 109);

T = BRS_sectoral_wo_demand_shocks.static_resid_tt(T, y, x, params);

T(87) = 1/y(1);
T(88) = getPowerDeriv(T(29),params(5),1);
T(89) = getPowerDeriv(T(36),1/T(3),1);
T(90) = getPowerDeriv(y(33)*y(11),T(4),1);
T(91) = getPowerDeriv(y(34)*y(12),T(4),1);
T(92) = getPowerDeriv(y(35)*y(13),T(4),1);
T(93) = getPowerDeriv(y(15),T(5),1);
T(94) = T(47)*T(52)*T(93);
T(95) = getPowerDeriv(y(16),T(5),1);
T(96) = T(54)*T(58)*T(95);
T(97) = getPowerDeriv(T(21),1/(1+params(21)),1);
T(98) = getPowerDeriv(y(17)/y(19),params(21),1);
T(99) = getPowerDeriv(y(18)/y(19),params(21),1);
T(100) = getPowerDeriv(y(18),T(5),1);
T(101) = T(60)*T(64)*T(100);
T(102) = T(23)*getPowerDeriv(y(19),T(18),1);
T(103) = getPowerDeriv(y(49),1/params(19),1);
T(104) = getPowerDeriv(y(49),T(17),1)/T(17);
T(105) = T(7)*getPowerDeriv(y(50),params(18),1);
T(106) = T(8)*getPowerDeriv(y(51),params(18),1);
T(107) = T(9)*getPowerDeriv(y(52),params(18),1);
T(108) = params(2)*exp(y(24))*T(38)*getPowerDeriv(T(38),(-params(1)),1);
T(109) = T(38)*getPowerDeriv(T(38),(-T(4)),1);

end
