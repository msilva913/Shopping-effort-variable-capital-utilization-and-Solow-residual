function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
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

assert(length(T) >= 37);

T(1) = params(14)/(1+params(15));
T(2) = 1/params(5);
T(3) = (y(61)/y(63))^params(17);
T(4) = (y(62)/y(63))^params(17);
T(5) = (y(53)-params(16)*y(1))^params(6);
T(6) = y(12)^(1-params(6));
T(7) = params(3)*exp(y(68))*(y(157)/y(86))^(-params(1));
T(8) = exp(y(162))^(-params(1));
T(9) = T(7)*T(8);
T(10) = y(160)^2;
T(11) = T(9)*y(158)*y(155)*T(10);
T(12) = y(161)^2;
T(13) = T(9)*y(159)*y(156)*T(12);
T(14) = y(61)^T(1);
T(15) = y(62)^T(1);
T(16) = 1+params(12)/params(13)-exp(params(4));
T(17) = exp(params(4))^params(1)/params(3)-1+T(16);
T(18) = params(13)*T(17)/(1+params(15));
T(19) = exp(params(4))^(-T(18));
T(20) = (1-params(12)+params(15)*(1-params(12)))/(T(19)*(params(13)*exp(params(4))*(1-params(12)))^T(18)*((1-params(12))*params(26))^T(1));
T(21) = (params(12)+params(12)*params(15))/(T(19)*(params(12)*params(13)*exp(params(4)))^T(18)*(params(12)*params(26))^T(1));
T(22) = (1-params(12))^(-params(17));
T(23) = (1-(1-params(12)))^(-params(17));
T(24) = y(61)^(1+params(17))*T(22)+y(62)^(1+params(17))*T(23);
T(25) = exp(y(67))*params(14)/params(26)/(params(7)*params(26)^T(2)*(1-params(12))*(1-params(16)));
T(26) = y(63)^T(2)*T(25);
T(27) = y(63)^(1+T(2))*T(25)/(1+T(2));
T(28) = y(87)*T(27);
T(29) = exp(y(97))^(-T(18));
T(30) = exp(y(64))*T(20)*T(29);
T(31) = (y(76)*y(4))^T(18);
T(32) = exp(y(66))*T(21)*T(29);
T(33) = (y(77)*y(5))^T(18);
T(34) = y(4)^T(18);
T(35) = T(14)*T(34)-params(15)*(1-params(12));
T(36) = y(5)^T(18);
T(37) = T(15)*T(36)-params(12)*params(15);

end
