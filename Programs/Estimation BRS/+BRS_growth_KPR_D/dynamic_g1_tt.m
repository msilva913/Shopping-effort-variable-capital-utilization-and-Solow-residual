function T = dynamic_g1_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_g1_tt(T, y, x, params, steady_state, it_)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double  vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double  vector of endogenous variables in the order stored
%                                                    in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double  matrix of exogenous variables (in declaration order)
%                                                    for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double  vector of steady state values
%   params        [M_.param_nbr by 1]        double  vector of parameter values in declaration order
%   it_           scalar                     double  time period for exogenous variables for which
%                                                    to evaluate the model
%
% Output:
%   T           [#temp variables by 1]       double  vector of temporary terms
%

assert(length(T) >= 67);

T = BRS_growth_KPR_D.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(49) = getPowerDeriv(y(45)*y(3),T(14),1);
T(50) = getPowerDeriv(y(46)*y(4),T(14),1);
T(51) = getPowerDeriv(T(26),1/(1+params(16)),1);
T(52) = getPowerDeriv(y(31)/y(33),params(16),1);
T(53) = getPowerDeriv(y(31),T(15),1);
T(54) = getPowerDeriv(y(32)/y(33),params(16),1);
T(55) = getPowerDeriv(y(32),T(15),1);
T(56) = T(27)*(-(getPowerDeriv(1-y(33),(-params(5)),1)));
T(57) = T(9)*T(8)*(-(exp(y(40))*T(29)))/(exp(y(40))*exp(y(40)));
T(58) = exp(y(38))*getPowerDeriv(y(53),1/params(14),1);
T(59) = getPowerDeriv(y(54),T(2),1);
T(60) = T(17)*T(59);
T(61) = getPowerDeriv(y(55),T(2),1);
T(62) = T(18)*T(61);
T(63) = getPowerDeriv(y(94)/y(56),(-params(1)),1);
T(64) = T(9)*T(29)/exp(y(40))*(-y(94))/(y(56)*y(56))*T(63);
T(65) = T(9)*T(29)/exp(y(40))*T(63)*1/y(56);
T(66) = exp(y(62))*getPowerDeriv(exp(y(62)),(-T(14)),1);
T(67) = T(8)*T(29)/exp(y(40))*exp(y(97))*getPowerDeriv(exp(y(97)),(-params(1)),1);

end
