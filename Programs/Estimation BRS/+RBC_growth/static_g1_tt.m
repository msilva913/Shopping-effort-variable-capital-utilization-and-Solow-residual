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

assert(length(T) >= 45);

T = RBC_growth.static_resid_tt(T, y, x, params);

T(36) = getPowerDeriv(y(20)*y(5),T(4),1);
T(37) = getPowerDeriv(y(21)*y(6),T(4),1);
T(38) = getPowerDeriv(T(12),1/(1+params(13)),1);
T(39) = getPowerDeriv(y(8)/y(10),params(13),1);
T(40) = getPowerDeriv(y(8),T(5),1);
T(41) = getPowerDeriv(y(9)/y(10),params(13),1);
T(42) = getPowerDeriv(y(9),T(5),1);
T(43) = T(14)*getPowerDeriv(y(10),T(9),1);
T(44) = T(3)*exp(y(34))*getPowerDeriv(exp(y(34)),(-params(1)),1);
T(45) = exp(y(34))*getPowerDeriv(exp(y(34)),(-T(4)),1);

end
