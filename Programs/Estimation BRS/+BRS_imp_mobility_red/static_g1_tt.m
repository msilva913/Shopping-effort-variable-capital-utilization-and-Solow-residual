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

assert(length(T) >= 53);

T = BRS_imp_mobility_red.static_resid_tt(T, y, x, params);

T(41) = getPowerDeriv(y(20)*y(5),params(9)*(T(1)+T(2)),1);
T(42) = getPowerDeriv(y(21)*y(6),params(9)*(T(1)+T(2)),1);
T(43) = getPowerDeriv(T(16),1/(1+params(15)),1);
T(44) = getPowerDeriv(y(10),1/params(5),1);
T(45) = (T(22)*exp(y(14))*(-(T(12)*T(44)))/(T(13)*T(13))+T(17)*getPowerDeriv(y(10),T(21),1))/T(21);
T(46) = exp(y(15))*getPowerDeriv(y(26),1/params(12),1);
T(47) = exp(y(15))*getPowerDeriv(y(26),T(19),1)/T(19);
T(48) = getPowerDeriv(y(27),T(4),1);
T(49) = getPowerDeriv(y(28),T(4),1);
T(50) = params(7)/2*2*(y(33)-params(8)/params(9));
T(51) = (-(T(26)*y(32)*(params(7)*(y(33)-params(8)/params(9))+params(7)*y(33)-T(50))));
T(52) = T(3)*exp(y(35))*getPowerDeriv(exp(y(35)),(-params(1)),1);
T(53) = exp(y(35))*getPowerDeriv(exp(y(35)),(-(params(9)*(T(1)+T(2)))),1);

end
