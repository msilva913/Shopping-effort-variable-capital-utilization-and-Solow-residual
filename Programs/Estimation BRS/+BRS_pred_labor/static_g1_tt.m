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

assert(length(T) >= 59);

T = BRS_pred_labor.static_resid_tt(T, y, x, params);

T(46) = getPowerDeriv(y(21)*y(5),T(5),1);
T(47) = getPowerDeriv(y(22)*y(6),T(5),1);
T(48) = getPowerDeriv(y(7),1/params(5),1);
T(49) = exp(y(13))*(-(T(6)*params(10)/params(23)*T(48)))/(T(16)*T(16));
T(50) = T(17)*T(48)+T(16)*T(49);
T(51) = getPowerDeriv(y(8),T(7),1);
T(52) = getPowerDeriv(y(9),T(7),1);
T(53) = exp(y(14))*getPowerDeriv(y(29),1/params(13),1);
T(54) = getPowerDeriv(y(30),T(4),1);
T(55) = T(9)*T(54);
T(56) = getPowerDeriv(y(31),T(4),1);
T(57) = T(10)*T(56);
T(58) = T(3)*exp(y(38))*getPowerDeriv(exp(y(38)),(-params(1)),1);
T(59) = exp(y(38))*getPowerDeriv(exp(y(38)),(-T(5)),1);

end
