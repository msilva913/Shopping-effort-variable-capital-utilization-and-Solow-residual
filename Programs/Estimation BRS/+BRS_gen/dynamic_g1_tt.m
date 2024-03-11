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

assert(length(T) >= 75);

T = BRS_gen.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(55) = getPowerDeriv(T(9),params(6),1);
T(56) = getPowerDeriv(y(46)*y(3),T(18),1);
T(57) = getPowerDeriv(y(47)*y(4),T(18),1);
T(58) = getPowerDeriv(T(30),1/(1+params(17)),1);
T(59) = getPowerDeriv(y(32)/y(34),params(17),1);
T(60) = getPowerDeriv(y(32),T(19),1);
T(61) = getPowerDeriv(y(33)/y(34),params(17),1);
T(62) = getPowerDeriv(y(33),T(19),1);
T(63) = T(31)*getPowerDeriv(y(34),T(4),1);
T(64) = T(13)*T(12)*(-(exp(y(41))*T(35)))/(exp(y(41))*exp(y(41)));
T(65) = exp(y(39))*getPowerDeriv(y(54),1/params(15),1);
T(66) = exp(y(39))*getPowerDeriv(y(54),T(3),1)/T(3);
T(67) = getPowerDeriv(y(55),T(2),1);
T(68) = T(21)*T(67);
T(69) = getPowerDeriv(y(56),T(2),1);
T(70) = T(22)*T(69);
T(71) = getPowerDeriv(y(96)/y(57),(-params(1)),1);
T(72) = T(13)*T(35)/exp(y(41))*(-y(96))/(y(57)*y(57))*T(71);
T(73) = T(13)*T(35)/exp(y(41))*T(71)*1/y(57);
T(74) = exp(y(64))*getPowerDeriv(exp(y(64)),(-T(18)),1);
T(75) = T(12)*T(35)/exp(y(41))*exp(y(99))*getPowerDeriv(exp(y(99)),(-params(1)),1);

end
