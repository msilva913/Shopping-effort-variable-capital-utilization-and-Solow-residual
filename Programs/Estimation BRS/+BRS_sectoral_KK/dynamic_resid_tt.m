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

assert(length(T) >= 87);

T(1) = (params(6)-1)/params(6);
T(2) = (1-params(18))*params(15)/(1+params(16));
T(3) = params(18)^(params(19)/(1+params(19)));
T(4) = 1+1/params(19);
T(5) = 1/params(4);
T(6) = (y(72)/y(74))^params(21);
T(7) = (y(73)/y(74))^params(21);
T(8) = params(7)*y(111)^(-params(6));
T(9) = y(104)^(1/params(19));
T(10) = y(57)-params(17)*y(1)-y(104)^T(4)/T(4);
T(11) = T(10)^params(5);
T(12) = y(14)^(1-params(5));
T(13) = params(11)/2;
T(14) = exp(y(125));
T(15) = exp(y(200))^(-params(1));
T(16) = params(2)*exp(y(79))*y(193)/y(113)*T(15);
T(17) = y(197)^2;
T(18) = T(16)*y(194)*y(190)*T(17);
T(19) = y(198)^2;
T(20) = T(16)*y(195)*y(191)*T(19);
T(21) = y(199)^2;
T(22) = T(16)*y(196)*y(192)*T(21);
T(23) = y(58)/y(56);
T(24) = y(59)/y(56);
T(25) = y(61)/y(56);
T(26) = y(5)^(1-params(15));
T(27) = y(70)^params(15);
T(28) = T(26)*T(27);
T(29) = y(6)^(1-params(15));
T(30) = y(71)^params(15);
T(31) = T(29)*T(30);
T(32) = y(7)^(1-params(15));
T(33) = y(73)^params(15);
T(34) = T(32)*T(33);
T(35) = (1-params(7))*y(110)^(-params(6));
T(36) = params(7)^(1-T(1));
T(37) = (1-params(7))^(1-T(1));
T(38) = T(36)*y(59)^T(1)+T(37)*y(58)^T(1);
T(39) = y(70)^T(2);
T(40) = y(71)^T(2);
T(41) = y(73)^T(2);
T(42) = 1+params(13)/params(14)-exp(params(3));
T(43) = exp(params(3))^params(1)/params(2)-1+T(42);
T(44) = params(14)*T(43)/(1+params(16));
T(45) = params(20)/(T(3)*(1-params(7))*(1-params(13)))^params(18);
T(46) = params(20)/(T(3)*params(7)*(1-params(13)))^params(18);
T(47) = params(20)/(params(13)*T(3))^params(18);
T(48) = params(16)*(1-params(7))*(1-params(13))/params(20);
T(49) = params(16)*params(7)*(1-params(13))/params(20);
T(50) = params(13)*params(16)/params(20);
T(51) = exp(params(3))^(-T(44));
T(52) = (T(48)+(1-params(7))*(1-params(13))/params(20))/(T(51)*((1-params(7))*(1-params(13))*params(14)*exp(params(3)))^T(44)*((1-params(7))*(1-params(13))*params(30))^T(2));
T(53) = (T(49)+params(7)*(1-params(13))/params(20))/(T(51)*(params(7)*(1-params(13))*params(14)*exp(params(3)))^T(44)*(params(7)*(1-params(13))*params(30))^T(2));
T(54) = (T(50)+params(13)/params(20))/(T(51)*(params(13)*params(14)*exp(params(3)))^T(44)*(params(13)*params(30))^T(2));
T(55) = (1-params(13))^(-params(21));
T(56) = (1-(1-params(13)))^(-params(21));
T(57) = y(72)^(1+params(21))*T(55)+y(73)^(1+params(21))*T(56);
T(58) = exp(y(78))*(1-params(18))*params(15)/params(30)/(params(8)*params(30)^T(5)*((1-params(13))*(1-params(17))-(T(3))^T(4)/T(4)));
T(59) = y(74)^T(5)*T(58);
T(60) = y(74)^(1+T(5))*T(58)/(1+T(5));
T(61) = y(109)*T(60);
T(62) = params(9)*T(43)/2;
T(63) = y(105)^params(18)*T(45);
T(64) = T(14)^(-T(44));
T(65) = exp(y(75))*T(52)*T(64);
T(66) = (y(88)*y(5))^T(44);
T(67) = T(65)*T(66);
T(68) = T(63)*(T(39)*T(67)-T(48));
T(69) = y(106)^params(18)*T(46);
T(70) = exp(y(75))*T(53)*T(64);
T(71) = (y(89)*y(6))^T(44);
T(72) = T(70)*T(71);
T(73) = T(69)*(T(40)*T(72)-T(49));
T(74) = y(107)^params(18)*T(47);
T(75) = exp(y(77))*T(54)*T(64);
T(76) = (y(90)*y(7))^T(44);
T(77) = T(75)*T(76);
T(78) = T(74)*(T(41)*T(77)-T(50));
T(79) = y(5)^T(44);
T(80) = T(65)*T(79);
T(81) = T(39)*T(80)-T(48);
T(82) = y(6)^T(44);
T(83) = T(70)*T(82);
T(84) = T(40)*T(83)-T(49);
T(85) = y(7)^T(44);
T(86) = T(75)*T(85);
T(87) = T(41)*T(86)-T(50);

end
