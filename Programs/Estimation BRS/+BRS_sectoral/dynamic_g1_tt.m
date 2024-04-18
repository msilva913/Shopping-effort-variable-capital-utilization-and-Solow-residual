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

assert(length(T) >= 97);

T = BRS_sectoral.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(72) = getPowerDeriv(T(12),params(5),1);
T(73) = getPowerDeriv(y(66)/y(67),T(24),1);
T(74) = getPowerDeriv(y(66)/y(68),T(24),1);
T(75) = getPowerDeriv(T(27),1/T(1),1);
T(76) = getPowerDeriv(y(98)*y(5),T(33),1);
T(77) = getPowerDeriv(y(99)*y(6),T(33),1);
T(78) = getPowerDeriv(y(100)*y(7),T(33),1);
T(79) = getPowerDeriv(y(78),T(2),1);
T(80) = T(51)*T(55)*T(79);
T(81) = getPowerDeriv(T(47),1/(1+params(23)),1);
T(82) = getPowerDeriv(y(80)/y(82),params(23),1);
T(83) = getPowerDeriv(y(81)/y(82),params(23),1);
T(84) = getPowerDeriv(y(81),T(2),1);
T(85) = T(61)*T(64)*T(84);
T(86) = exp(y(86))*T(6)*T(44)*getPowerDeriv(y(82),T(5),1);
T(87) = exp(y(87))*getPowerDeriv(y(113),1/params(21),1);
T(88) = exp(y(87))*getPowerDeriv(y(113),T(4),1)/T(4);
T(89) = T(34)*getPowerDeriv(y(114),params(20),1);
T(90) = T(35)*getPowerDeriv(y(115),params(20),1);
T(91) = T(36)*getPowerDeriv(y(116),params(20),1);
T(92) = getPowerDeriv(y(117),(-params(1)),1);
T(93) = T(7)*exp(y(86))*T(44)*T(92);
T(94) = T(16)*params(2)*exp(y(89))*(-y(209))/(y(124)*y(124));
T(95) = T(16)*params(2)*exp(y(89))*1/y(124);
T(96) = T(15)*getPowerDeriv(T(15),(-T(33)),1);
T(97) = params(2)*exp(y(89))*y(209)/y(124)*exp(y(216))*getPowerDeriv(exp(y(216)),(-params(1)),1);

end
