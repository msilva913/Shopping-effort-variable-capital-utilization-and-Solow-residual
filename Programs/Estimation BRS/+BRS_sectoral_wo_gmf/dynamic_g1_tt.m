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

assert(length(T) >= 75);

T = BRS_sectoral_wo_gmf.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(59) = getPowerDeriv(y(55)-params(17)*y(1),params(5),1);
T(60) = getPowerDeriv(T(22),1/T(1),1);
T(61) = getPowerDeriv(y(85)*y(5),T(28),1);
T(62) = getPowerDeriv(y(86)*y(6),T(28),1);
T(63) = getPowerDeriv(y(87)*y(7),T(28),1);
T(64) = getPowerDeriv(y(67),T(2),1);
T(65) = T(44)*T(64);
T(66) = getPowerDeriv(T(35),1/(1+params(18)),1);
T(67) = getPowerDeriv(y(69)/y(71),params(18),1);
T(68) = getPowerDeriv(y(70)/y(71),params(18),1);
T(69) = getPowerDeriv(y(70),T(2),1);
T(70) = T(51)*T(69);
T(71) = T(36)*getPowerDeriv(y(71),T(3),1);
T(72) = T(11)*params(2)*exp(y(76))*(-y(180))/(y(105)*y(105));
T(73) = T(11)*params(2)*exp(y(76))*1/y(105);
T(74) = T(10)*getPowerDeriv(T(10),(-T(28)),1);
T(75) = params(2)*exp(y(76))*y(180)/y(105)*exp(y(187))*getPowerDeriv(exp(y(187)),(-params(1)),1);

end
