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

assert(length(T) >= 73);

T = BRS_growth_util_sectoral_alt.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(53) = getPowerDeriv(y(44)*y(2),T(18),1);
T(54) = getPowerDeriv(y(45)*y(3),T(18),1);
T(55) = getPowerDeriv(T(30),1/(1+params(15)),1);
T(56) = getPowerDeriv(y(30)/y(32),params(15),1);
T(57) = getPowerDeriv(y(30),T(19),1);
T(58) = getPowerDeriv(y(31)/y(32),params(15),1);
T(59) = getPowerDeriv(y(31),T(19),1);
T(60) = getPowerDeriv(y(32),1/params(5),1);
T(61) = exp(y(36))*(-(params(10)/params(24)*T(14)*T(60)))/(T(3)*T(3));
T(62) = T(31)*T(60)+T(3)*T(61);
T(63) = T(12)*T(11)*(-(exp(y(39))*T(33)))/(exp(y(39))*exp(y(39)));
T(64) = exp(y(37))*getPowerDeriv(y(52),1/params(13),1);
T(65) = getPowerDeriv(y(53),T(2),1);
T(66) = T(21)*T(65);
T(67) = getPowerDeriv(y(54),T(2),1);
T(68) = T(22)*T(67);
T(69) = getPowerDeriv(y(93)/y(55),(-params(1)),1);
T(70) = T(12)*T(33)/exp(y(39))*(-y(93))/(y(55)*y(55))*T(69);
T(71) = T(12)*T(33)/exp(y(39))*T(69)*1/y(55);
T(72) = exp(y(61))*getPowerDeriv(exp(y(61)),(-T(18)),1);
T(73) = T(11)*T(33)/exp(y(39))*exp(y(96))*getPowerDeriv(exp(y(96)),(-params(1)),1);

end
