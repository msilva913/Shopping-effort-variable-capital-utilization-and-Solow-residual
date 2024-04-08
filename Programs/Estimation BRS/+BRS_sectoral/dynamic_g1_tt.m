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

assert(length(T) >= 88);

T = BRS_sectoral.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(65) = getPowerDeriv(T(11),params(5),1);
T(66) = getPowerDeriv(y(65)/y(66),T(20),1);
T(67) = getPowerDeriv(y(65)/y(67),T(20),1);
T(68) = getPowerDeriv(T(23),1/T(2),1);
T(69) = getPowerDeriv(y(96)*y(4),T(26),1);
T(70) = getPowerDeriv(y(97)*y(5),T(26),1);
T(71) = getPowerDeriv(y(98)*y(6),T(26),1);
T(72) = getPowerDeriv(y(76),T(27),1);
T(73) = getPowerDeriv(T(42),1/(1+params(21)),1);
T(74) = getPowerDeriv(y(78)/y(80),params(21),1);
T(75) = getPowerDeriv(y(79)/y(80),params(21),1);
T(76) = getPowerDeriv(y(79),T(27),1);
T(77) = exp(y(84))*T(5)*T(39)*getPowerDeriv(y(80),T(4),1);
T(78) = exp(y(85))*getPowerDeriv(y(109),1/params(19),1);
T(79) = exp(y(85))*getPowerDeriv(y(109),T(3),1)/T(3);
T(80) = T(29)*getPowerDeriv(y(110),T(1),1);
T(81) = T(30)*getPowerDeriv(y(111),T(1),1);
T(82) = T(31)*getPowerDeriv(y(112),T(1),1);
T(83) = getPowerDeriv(y(113),(-params(1)),1);
T(84) = T(6)*exp(y(84))*T(39)*T(83);
T(85) = T(14)*params(2)*exp(y(87))*(-y(202))/(y(120)*y(120));
T(86) = T(14)*params(2)*exp(y(87))*1/y(120);
T(87) = exp(y(129))*getPowerDeriv(exp(y(129)),(-T(26)),1);
T(88) = params(2)*exp(y(87))*y(202)/y(120)*exp(y(207))*getPowerDeriv(exp(y(207)),(-params(1)),1);

end
