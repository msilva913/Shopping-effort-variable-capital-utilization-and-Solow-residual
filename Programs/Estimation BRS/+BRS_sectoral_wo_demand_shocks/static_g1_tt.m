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

assert(length(T) >= 105);

T = BRS_sectoral_wo_demand_shocks.static_resid_tt(T, y, x, params);

T(85) = 1/y(1);
T(86) = getPowerDeriv(T(32),1/T(3),1);
T(87) = getPowerDeriv(y(33)*y(11),T(4),1);
T(88) = getPowerDeriv(y(34)*y(12),T(4),1);
T(89) = getPowerDeriv(y(35)*y(13),T(4),1);
T(90) = getPowerDeriv(y(15),T(5),1);
T(91) = T(43)*T(48)*T(90);
T(92) = getPowerDeriv(y(16),T(5),1);
T(93) = T(50)*T(54)*T(92);
T(94) = getPowerDeriv(T(20),1/(1+params(19)),1);
T(95) = getPowerDeriv(y(17)/y(19),params(19),1);
T(96) = getPowerDeriv(y(18)/y(19),params(19),1);
T(97) = getPowerDeriv(y(18),T(5),1);
T(98) = T(56)*T(60)*T(97);
T(99) = T(22)*getPowerDeriv(y(19),T(17),1);
T(100) = getPowerDeriv(y(49),1/params(17),1);
T(101) = T(7)*getPowerDeriv(y(50),params(16),1);
T(102) = T(8)*getPowerDeriv(y(51),params(16),1);
T(103) = T(9)*getPowerDeriv(y(52),params(16),1);
T(104) = params(2)*exp(y(24))*T(34)*getPowerDeriv(T(34),(-params(1)),1);
T(105) = T(34)*getPowerDeriv(T(34),(-T(4)),1);

end
