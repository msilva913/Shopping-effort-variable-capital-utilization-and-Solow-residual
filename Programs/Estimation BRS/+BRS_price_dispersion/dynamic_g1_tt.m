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

assert(length(T) >= 117);

T = BRS_price_dispersion.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(93) = 1/y(67);
T(94) = getPowerDeriv(T(10),params(5),1);
T(95) = getPowerDeriv(T(41),1/T(2),1);
T(96) = getPowerDeriv(y(102)*y(5),T(44),1);
T(97) = getPowerDeriv(y(103)*y(6),T(44),1);
T(98) = getPowerDeriv(y(104)*y(7),T(44),1);
T(99) = getPowerDeriv(y(81),T(45),1);
T(100) = T(65)*T(69)*T(99);
T(101) = getPowerDeriv(y(82),T(45),1);
T(102) = T(72)*T(75)*T(101);
T(103) = getPowerDeriv(T(59),1/(1+params(21)),1);
T(104) = getPowerDeriv(y(83)/y(85),params(21),1);
T(105) = getPowerDeriv(y(84)/y(85),params(21),1);
T(106) = getPowerDeriv(y(84),T(45),1);
T(107) = T(78)*T(81)*T(106);
T(108) = T(60)*getPowerDeriv(y(85),T(4),1);
T(109) = exp(y(91))*getPowerDeriv(y(118),1/params(19),1);
T(110) = exp(y(91))*getPowerDeriv(y(118),T(3),1)/T(3);
T(111) = T(47)*getPowerDeriv(y(119),T(1),1);
T(112) = T(48)*getPowerDeriv(y(120),T(1),1);
T(113) = T(49)*getPowerDeriv(y(121),T(1),1);
T(114) = T(15)*params(2)*exp(y(93))*(-y(217))/(y(127)*y(127));
T(115) = T(15)*params(2)*exp(y(93))*1/y(127);
T(116) = T(14)*getPowerDeriv(T(14),(-T(44)),1);
T(117) = params(2)*exp(y(93))*y(217)/y(127)*exp(y(224))*getPowerDeriv(exp(y(224)),(-params(1)),1);

end
