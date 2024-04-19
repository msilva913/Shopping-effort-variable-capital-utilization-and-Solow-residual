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

assert(length(T) >= 94);

T = BRS_sectoral.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(73) = getPowerDeriv(T(11),params(5),1);
T(74) = getPowerDeriv(T(27),1/T(1),1);
T(75) = getPowerDeriv(y(98)*y(5),T(33),1);
T(76) = getPowerDeriv(y(99)*y(6),T(33),1);
T(77) = getPowerDeriv(y(100)*y(7),T(33),1);
T(78) = getPowerDeriv(y(78),T(2),1);
T(79) = T(52)*T(56)*T(78);
T(80) = getPowerDeriv(T(46),1/(1+params(21)),1);
T(81) = getPowerDeriv(y(80)/y(82),params(21),1);
T(82) = getPowerDeriv(y(81)/y(82),params(21),1);
T(83) = getPowerDeriv(y(81),T(2),1);
T(84) = T(62)*T(65)*T(83);
T(85) = T(47)*getPowerDeriv(y(82),T(5),1);
T(86) = exp(y(87))*getPowerDeriv(y(113),1/params(19),1);
T(87) = exp(y(87))*getPowerDeriv(y(113),T(4),1)/T(4);
T(88) = T(34)*getPowerDeriv(y(114),params(18),1);
T(89) = T(35)*getPowerDeriv(y(115),params(18),1);
T(90) = T(36)*getPowerDeriv(y(116),params(18),1);
T(91) = T(16)*params(2)*exp(y(89))*(-y(207))/(y(122)*y(122));
T(92) = T(16)*params(2)*exp(y(89))*1/y(122);
T(93) = T(15)*getPowerDeriv(T(15),(-T(33)),1);
T(94) = params(2)*exp(y(89))*y(207)/y(122)*exp(y(214))*getPowerDeriv(exp(y(214)),(-params(1)),1);

end
