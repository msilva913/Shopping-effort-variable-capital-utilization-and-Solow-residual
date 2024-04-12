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

assert(length(T) >= 96);

T = BRS_sectoral.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(71) = getPowerDeriv(T(11),params(5),1);
T(72) = getPowerDeriv(y(129)/y(130),T(20),1);
T(73) = getPowerDeriv(y(129)/y(131),T(20),1);
T(74) = getPowerDeriv(T(23),1/T(2),1);
T(75) = getPowerDeriv(y(160)*y(4),T(26),1);
T(76) = getPowerDeriv(y(161)*y(5),T(26),1);
T(77) = getPowerDeriv(y(162)*y(6),T(26),1);
T(78) = getPowerDeriv(y(140),T(27),1);
T(79) = T(47)*T(51)*T(78);
T(80) = getPowerDeriv(T(42),1/(1+params(21)),1);
T(81) = getPowerDeriv(y(142)/y(144),params(21),1);
T(82) = getPowerDeriv(y(143)/y(144),params(21),1);
T(83) = getPowerDeriv(y(143),T(27),1);
T(84) = T(59)*T(62)*T(83);
T(85) = exp(y(148))*T(5)*T(39)*getPowerDeriv(y(144),T(4),1);
T(86) = exp(y(149))*getPowerDeriv(y(173),1/params(19),1);
T(87) = exp(y(149))*getPowerDeriv(y(173),T(3),1)/T(3);
T(88) = T(29)*getPowerDeriv(y(174),T(1),1);
T(89) = T(30)*getPowerDeriv(y(175),T(1),1);
T(90) = T(31)*getPowerDeriv(y(176),T(1),1);
T(91) = getPowerDeriv(y(177),(-params(1)),1);
T(92) = T(6)*exp(y(148))*T(39)*T(91);
T(93) = T(14)*params(2)*exp(y(151))*(-y(330))/(y(184)*y(184));
T(94) = T(14)*params(2)*exp(y(151))*1/y(184);
T(95) = exp(y(193))*getPowerDeriv(exp(y(193)),(-T(26)),1);
T(96) = params(2)*exp(y(151))*y(330)/y(184)*exp(y(335))*getPowerDeriv(exp(y(335)),(-params(1)),1);

end
