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

assert(length(T) >= 69);

T = BRS_gen.static_resid_tt(T, y, x, params);

T(53) = getPowerDeriv(T(26),params(6),1);
T(54) = getPowerDeriv(y(22)*y(5),T(5),1);
T(55) = getPowerDeriv(y(23)*y(6),T(5),1);
T(56) = getPowerDeriv(T(19),1/(1+params(17)),1);
T(57) = getPowerDeriv(y(8)/y(10),params(17),1);
T(58) = getPowerDeriv(y(8),T(6),1);
T(59) = getPowerDeriv(y(9)/y(10),params(17),1);
T(60) = getPowerDeriv(y(9),T(6),1);
T(61) = T(21)*getPowerDeriv(y(10),T(16),1);
T(62) = exp(y(15))*getPowerDeriv(y(30),1/params(15),1);
T(63) = exp(y(15))*getPowerDeriv(y(30),T(15),1)/T(15);
T(64) = getPowerDeriv(y(31),T(4),1);
T(65) = T(8)*T(64);
T(66) = getPowerDeriv(y(32),T(4),1);
T(67) = T(9)*T(66);
T(68) = T(3)*exp(y(40))*getPowerDeriv(exp(y(40)),(-params(1)),1);
T(69) = exp(y(40))*getPowerDeriv(exp(y(40)),(-T(5)),1);

end
