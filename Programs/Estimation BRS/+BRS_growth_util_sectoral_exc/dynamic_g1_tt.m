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

assert(length(T) >= 67);

T = BRS_growth_util_sectoral_exc.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(50) = getPowerDeriv(y(43)*y(2),T(16),1);
T(51) = getPowerDeriv(y(44)*y(3),T(16),1);
T(52) = getPowerDeriv(y(29),1/params(5),1);
T(53) = exp(y(36))*(-(params(10)/params(24)*T(12)*T(52)))/(T(3)*T(3));
T(54) = getPowerDeriv(T(28),1/(1+params(15)),1);
T(55) = getPowerDeriv(y(30),T(17),1);
T(56) = getPowerDeriv(y(31),T(17),1);
T(57) = T(10)*T(9)*(-(exp(y(39))*T(30)))/(exp(y(39))*exp(y(39)));
T(58) = exp(y(37))*getPowerDeriv(y(51),1/params(13),1);
T(59) = getPowerDeriv(y(52),T(2),1);
T(60) = T(19)*T(59);
T(61) = getPowerDeriv(y(53),T(2),1);
T(62) = T(20)*T(61);
T(63) = getPowerDeriv(y(92)/y(54),(-params(1)),1);
T(64) = T(10)*T(30)/exp(y(39))*(-y(92))/(y(54)*y(54))*T(63);
T(65) = T(10)*T(30)/exp(y(39))*T(63)*1/y(54);
T(66) = exp(y(60))*getPowerDeriv(exp(y(60)),(-T(16)),1);
T(67) = T(9)*T(30)/exp(y(39))*exp(y(95))*getPowerDeriv(exp(y(95)),(-params(1)),1);

end
