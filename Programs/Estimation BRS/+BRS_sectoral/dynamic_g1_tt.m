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

assert(length(T) >= 76);

T = BRS_sectoral.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(57) = getPowerDeriv(T(8),params(6),1);
T(58) = getPowerDeriv(y(53)*y(4),T(23),1);
T(59) = getPowerDeriv(y(54)*y(5),T(23),1);
T(60) = getPowerDeriv(T(35),1/(1+params(20)),1);
T(61) = getPowerDeriv(y(37)/y(39),params(20),1);
T(62) = getPowerDeriv(y(37),T(24),1);
T(63) = getPowerDeriv(y(38)/y(39),params(20),1);
T(64) = getPowerDeriv(y(38),T(24),1);
T(65) = T(36)*getPowerDeriv(y(39),T(3),1);
T(66) = exp(y(44))*getPowerDeriv(y(63),1/params(18),1);
T(67) = exp(y(44))*getPowerDeriv(y(63),T(2),1)/T(2);
T(68) = getPowerDeriv(y(64),T(1),1);
T(69) = T(26)*T(68);
T(70) = getPowerDeriv(y(65),T(1),1);
T(71) = T(27)*T(70);
T(72) = getPowerDeriv(y(107)/y(66),(-params(1)),1);
T(73) = T(12)*params(3)*exp(y(46))*(-y(107))/(y(66)*y(66))*T(72);
T(74) = T(12)*params(3)*exp(y(46))*T(72)*1/y(66);
T(75) = exp(y(75))*getPowerDeriv(exp(y(75)),(-T(23)),1);
T(76) = T(11)*exp(y(112))*getPowerDeriv(exp(y(112)),(-params(1)),1);

end
