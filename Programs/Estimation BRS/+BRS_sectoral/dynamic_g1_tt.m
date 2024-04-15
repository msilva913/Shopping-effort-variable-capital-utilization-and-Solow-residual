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

assert(length(T) >= 95);

T = BRS_sectoral.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(70) = getPowerDeriv(T(12),params(5),1);
T(71) = getPowerDeriv(y(65)/y(66),T(21),1);
T(72) = getPowerDeriv(y(65)/y(67),T(21),1);
T(73) = getPowerDeriv(T(24),1/T(1),1);
T(74) = getPowerDeriv(y(96)*y(4),T(30),1);
T(75) = getPowerDeriv(y(97)*y(5),T(30),1);
T(76) = getPowerDeriv(y(98)*y(6),T(30),1);
T(77) = getPowerDeriv(y(76),T(2),1);
T(78) = T(49)*T(53)*T(77);
T(79) = getPowerDeriv(T(44),1/(1+params(21)),1);
T(80) = getPowerDeriv(y(78)/y(80),params(21),1);
T(81) = getPowerDeriv(y(79)/y(80),params(21),1);
T(82) = getPowerDeriv(y(79),T(2),1);
T(83) = T(59)*T(62)*T(82);
T(84) = exp(y(84))*T(6)*T(41)*getPowerDeriv(y(80),T(5),1);
T(85) = exp(y(85))*getPowerDeriv(y(109),1/params(19),1);
T(86) = exp(y(85))*getPowerDeriv(y(109),T(4),1)/T(4);
T(87) = T(31)*getPowerDeriv(y(110),params(18),1);
T(88) = T(32)*getPowerDeriv(y(111),params(18),1);
T(89) = T(33)*getPowerDeriv(y(112),params(18),1);
T(90) = getPowerDeriv(y(113),(-params(1)),1);
T(91) = T(7)*exp(y(84))*T(41)*T(90);
T(92) = T(15)*params(2)*exp(y(87))*(-y(202))/(y(120)*y(120));
T(93) = T(15)*params(2)*exp(y(87))*1/y(120);
T(94) = exp(y(129))*getPowerDeriv(exp(y(129)),(-T(30)),1);
T(95) = params(2)*exp(y(87))*y(202)/y(120)*exp(y(207))*getPowerDeriv(exp(y(207)),(-params(1)),1);

end
