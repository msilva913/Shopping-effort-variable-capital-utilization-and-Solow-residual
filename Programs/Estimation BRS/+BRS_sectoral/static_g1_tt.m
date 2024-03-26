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

assert(length(T) >= 63);

T = BRS_sectoral.static_resid_tt(T, y, x, params);

T(49) = getPowerDeriv(T(26),params(6),1);
T(50) = getPowerDeriv(y(27)*y(7),T(4),1);
T(51) = getPowerDeriv(y(28)*y(8),T(4),1);
T(52) = getPowerDeriv(T(19),1/(1+params(20)),1);
T(53) = getPowerDeriv(y(10)/y(12),params(20),1);
T(54) = getPowerDeriv(y(10),T(6),1);
T(55) = getPowerDeriv(y(11)/y(12),params(20),1);
T(56) = getPowerDeriv(y(11),T(6),1);
T(57) = T(21)*getPowerDeriv(y(12),T(16),1);
T(58) = exp(y(17))*getPowerDeriv(y(37),1/params(18),1);
T(59) = exp(y(17))*getPowerDeriv(y(37),T(15),1)/T(15);
T(60) = T(8)*getPowerDeriv(y(38),T(3),1);
T(61) = T(9)*getPowerDeriv(y(39),T(3),1);
T(62) = params(3)*exp(y(19))*exp(y(51))*getPowerDeriv(exp(y(51)),(-params(1)),1);
T(63) = exp(y(51))*getPowerDeriv(exp(y(51)),(-T(4)),1);

end
