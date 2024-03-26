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

assert(length(T) >= 68);

T = BRS_sectoral.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(51) = getPowerDeriv(T(8),params(6),1);
T(52) = getPowerDeriv(y(83)*y(4),T(21),1);
T(53) = getPowerDeriv(y(84)*y(5),T(21),1);
T(54) = getPowerDeriv(T(33),1/(1+params(20)),1);
T(55) = getPowerDeriv(y(67)/y(69),params(20),1);
T(56) = getPowerDeriv(y(67),T(22),1);
T(57) = getPowerDeriv(y(68)/y(69),params(20),1);
T(58) = getPowerDeriv(y(68),T(22),1);
T(59) = T(34)*getPowerDeriv(y(69),T(3),1);
T(60) = exp(y(74))*getPowerDeriv(y(93),1/params(18),1);
T(61) = exp(y(74))*getPowerDeriv(y(93),T(2),1)/T(2);
T(62) = T(24)*getPowerDeriv(y(94),T(1),1);
T(63) = T(25)*getPowerDeriv(y(95),T(1),1);
T(64) = getPowerDeriv(y(171)/y(96),(-params(1)),1);
T(65) = T(12)*params(3)*exp(y(76))*(-y(171))/(y(96)*y(96))*T(64);
T(66) = T(12)*params(3)*exp(y(76))*T(64)*1/y(96);
T(67) = exp(y(107))*getPowerDeriv(exp(y(107)),(-T(21)),1);
T(68) = T(11)*exp(y(176))*getPowerDeriv(exp(y(176)),(-params(1)),1);

end
