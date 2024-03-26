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

assert(length(T) >= 50);

T(1) = (1+params(18))*params(17)/(1+params(18)*params(17));
T(2) = 1+1/params(18);
T(3) = 1/params(5);
T(4) = (y(67)/y(69))^params(20);
T(5) = (y(68)/y(69))^params(20);
T(6) = exp(y(74))*y(93)^(1/params(18));
T(7) = exp(y(74))*y(93)^T(2)/T(2);
T(8) = y(59)-params(16)*y(1)-T(7);
T(9) = T(8)^params(6);
T(10) = y(14)^(1-params(6));
T(11) = params(3)*exp(y(76))*(y(171)/y(96))^(-params(1));
T(12) = exp(y(176))^(-params(1));
T(13) = T(11)*T(12);
T(14) = y(174)^2;
T(15) = T(13)*y(172)*y(169)*T(14);
T(16) = y(175)^2;
T(17) = T(13)*y(173)*y(170)*T(16);
T(18) = 1-T(1);
T(19) = 1+params(12)/params(13)-exp(params(4));
T(20) = exp(params(4))^params(1)/params(3)-1+T(19);
T(21) = params(13)*T(20)/(1+params(15));
T(22) = params(14)*T(18)/(1+params(15));
T(23) = T(1)^(params(18)/(1+params(18)));
T(24) = params(19)/((1-params(12))*T(23))^T(1);
T(25) = params(19)/(params(12)*T(23))^T(1);
T(26) = params(15)*(1-params(12))/params(19);
T(27) = params(12)*params(15)/params(19);
T(28) = exp(params(4))^(-T(21));
T(29) = (T(26)+(1-params(12))/params(19))/(T(28)*((1-params(12))*params(13)*exp(params(4)))^T(21)*((1-params(12))*params(31))^T(22));
T(30) = (T(27)+params(12)/params(19))/(T(28)*(params(12)*params(13)*exp(params(4)))^T(21)*(params(12)*params(31))^T(22));
T(31) = (1-params(12))^(-params(20));
T(32) = (1-(1-params(12)))^(-params(20));
T(33) = y(67)^(1+params(20))*T(31)+y(68)^(1+params(20))*T(32);
T(34) = exp(y(73))*params(14)/params(31)*T(18)/(params(7)*params(31)^T(3)*((1-params(12))*(1-params(16))-(T(23))^T(2)/T(2)));
T(35) = y(69)^T(3)*T(34);
T(36) = y(69)^(1+T(3))*T(34)/(1+T(3));
T(37) = y(97)*T(36);
T(38) = y(94)^T(1)*T(24);
T(39) = exp(y(107))^(-T(21));
T(40) = exp(y(70))*T(29)*T(39);
T(41) = (y(83)*y(4))^T(21);
T(42) = y(67)^T(22);
T(43) = y(95)^T(1)*T(25);
T(44) = exp(y(72))*T(30)*T(39);
T(45) = (y(84)*y(5))^T(21);
T(46) = y(68)^T(22);
T(47) = y(4)^T(21);
T(48) = T(42)*T(47)-T(26);
T(49) = y(5)^T(21);
T(50) = T(46)*T(49)-T(27);

end
