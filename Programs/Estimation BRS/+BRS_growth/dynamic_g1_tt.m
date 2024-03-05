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

assert(length(T) >= 70);

T = BRS_growth.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(52) = getPowerDeriv(y(45)*y(3),T(16),1);
T(53) = getPowerDeriv(y(46)*y(4),T(16),1);
T(54) = getPowerDeriv(T(28),1/(1+params(16)),1);
T(55) = getPowerDeriv(y(31)/y(33),params(16),1);
T(56) = getPowerDeriv(y(31),T(17),1);
T(57) = getPowerDeriv(y(32)/y(33),params(16),1);
T(58) = getPowerDeriv(y(32),T(17),1);
T(59) = T(29)*getPowerDeriv(y(33),T(3),1);
T(60) = T(10)*T(9)*(-(exp(y(40))*T(32)))/(exp(y(40))*exp(y(40)));
T(61) = exp(y(38))*getPowerDeriv(y(53),1/params(14),1);
T(62) = getPowerDeriv(y(54),T(2),1);
T(63) = T(19)*T(62);
T(64) = getPowerDeriv(y(55),T(2),1);
T(65) = T(20)*T(64);
T(66) = getPowerDeriv(y(94)/y(56),(-params(1)),1);
T(67) = T(10)*T(32)/exp(y(40))*(-y(94))/(y(56)*y(56))*T(66);
T(68) = T(10)*T(32)/exp(y(40))*T(66)*1/y(56);
T(69) = exp(y(62))*getPowerDeriv(exp(y(62)),(-T(16)),1);
T(70) = T(9)*T(32)/exp(y(40))*exp(y(97))*getPowerDeriv(exp(y(97)),(-params(1)),1);

end
