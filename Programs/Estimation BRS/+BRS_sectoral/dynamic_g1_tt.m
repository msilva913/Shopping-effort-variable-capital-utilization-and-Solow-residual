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

assert(length(T) >= 101);

T = BRS_sectoral.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(77) = 1/y(66);
T(78) = getPowerDeriv(T(11),params(5),1);
T(79) = getPowerDeriv(T(27),1/T(1),1);
T(80) = getPowerDeriv(y(99)*y(5),T(33),1);
T(81) = getPowerDeriv(y(100)*y(6),T(33),1);
T(82) = getPowerDeriv(y(101)*y(7),T(33),1);
T(83) = getPowerDeriv(y(79),T(2),1);
T(84) = T(52)*T(56)*T(83);
T(85) = getPowerDeriv(y(80),T(2),1);
T(86) = T(58)*T(61)*T(85);
T(87) = getPowerDeriv(T(46),1/(1+params(21)),1);
T(88) = getPowerDeriv(y(81)/y(83),params(21),1);
T(89) = getPowerDeriv(y(82)/y(83),params(21),1);
T(90) = getPowerDeriv(y(82),T(2),1);
T(91) = T(63)*T(66)*T(90);
T(92) = T(47)*getPowerDeriv(y(83),T(5),1);
T(93) = exp(y(88))*getPowerDeriv(y(115),1/params(19),1);
T(94) = exp(y(88))*getPowerDeriv(y(115),T(4),1)/T(4);
T(95) = T(34)*getPowerDeriv(y(116),params(18),1);
T(96) = T(35)*getPowerDeriv(y(117),params(18),1);
T(97) = T(36)*getPowerDeriv(y(118),params(18),1);
T(98) = T(16)*params(2)*exp(y(90))*(-y(212))/(y(124)*y(124));
T(99) = T(16)*params(2)*exp(y(90))*1/y(124);
T(100) = T(15)*getPowerDeriv(T(15),(-T(33)),1);
T(101) = params(2)*exp(y(90))*y(212)/y(124)*exp(y(219))*getPowerDeriv(exp(y(219)),(-params(1)),1);

end
