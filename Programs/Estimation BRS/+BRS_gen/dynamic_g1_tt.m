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

T = BRS_gen.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(57) = getPowerDeriv(T(8),params(6),1);
T(58) = getPowerDeriv(y(49)*y(4),T(23),1);
T(59) = getPowerDeriv(y(50)*y(5),T(23),1);
T(60) = getPowerDeriv(T(35),1/(1+params(19)),1);
T(61) = getPowerDeriv(y(35)/y(37),params(19),1);
T(62) = getPowerDeriv(y(35),T(24),1);
T(63) = getPowerDeriv(y(36)/y(37),params(19),1);
T(64) = getPowerDeriv(y(36),T(24),1);
T(65) = T(36)*getPowerDeriv(y(37),T(3),1);
T(66) = exp(y(42))*getPowerDeriv(y(59),1/params(17),1);
T(67) = exp(y(42))*getPowerDeriv(y(59),T(2),1)/T(2);
T(68) = getPowerDeriv(y(60),T(1),1);
T(69) = T(26)*T(68);
T(70) = getPowerDeriv(y(61),T(1),1);
T(71) = T(27)*T(70);
T(72) = getPowerDeriv(y(103)/y(62),(-params(1)),1);
T(73) = T(12)*params(3)*exp(y(44))*(-y(103))/(y(62)*y(62))*T(72);
T(74) = T(12)*params(3)*exp(y(44))*T(72)*1/y(62);
T(75) = exp(y(71))*getPowerDeriv(exp(y(71)),(-T(23)),1);
T(76) = T(11)*exp(y(108))*getPowerDeriv(exp(y(108)),(-params(1)),1);

end
