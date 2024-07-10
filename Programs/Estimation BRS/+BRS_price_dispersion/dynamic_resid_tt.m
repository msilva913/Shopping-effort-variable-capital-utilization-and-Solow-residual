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

assert(length(T) >= 92);

T(1) = (1+params(19))*params(18)/(1+params(19)*params(18));
T(2) = (params(6)-1)/params(6);
T(3) = 1+1/params(19);
T(4) = 1/params(4);
T(5) = (y(83)/y(85))^params(21);
T(6) = (y(84)/y(85))^params(21);
T(7) = params(7)*y(125)^(-params(6));
T(8) = exp(y(91))*y(118)^(1/params(19));
T(9) = exp(y(91))*y(118)^T(3)/T(3);
T(10) = y(68)-params(17)*y(1)-T(9);
T(11) = T(10)^params(5);
T(12) = y(16)^(1-params(5));
T(13) = params(11)/2;
T(14) = exp(y(139));
T(15) = exp(y(224))^(-params(1));
T(16) = params(2)*exp(y(93))*y(217)/y(127)*T(15);
T(17) = y(221)^2;
T(18) = T(16)*y(218)*y(214)*T(17);
T(19) = y(222)^2;
T(20) = T(16)*y(219)*y(215)*T(19);
T(21) = y(223)^2;
T(22) = T(16)*y(220)*y(216)*T(21);
T(23) = y(69)/y(67);
T(24) = y(70)/y(67);
T(25) = y(72)/y(67);
T(26) = T(14)^(1-params(15));
T(27) = y(5)^(1-params(15));
T(28) = y(81)^params(15);
T(29) = T(27)*T(28);
T(30) = y(6)^(1-params(15));
T(31) = y(82)^params(15);
T(32) = T(30)*T(31);
T(33) = y(7)^(1-params(15));
T(34) = y(84)^params(15);
T(35) = T(33)*T(34);
T(36) = y(69)*T(23)/T(29)+y(70)*T(24)/T(32)+y(72)*T(25)/T(35);
T(37) = 1-T(1);
T(38) = (1-params(7))*y(124)^(-params(6));
T(39) = params(7)^(1-T(2));
T(40) = (1-params(7))^(1-T(2));
T(41) = T(39)*y(70)^T(2)+T(40)*y(69)^T(2);
T(42) = 1+params(13)/params(14)-exp(params(3));
T(43) = exp(params(3))^params(1)/params(2)-1+T(42);
T(44) = params(14)*T(43)/(1+params(16));
T(45) = params(15)*T(37)/(1+params(16));
T(46) = T(1)^(params(19)/(1+params(19)));
T(47) = params(20)/((1-params(7))*(1-params(13))*T(46))^T(1);
T(48) = params(20)/(params(7)*(1-params(13))*T(46))^T(1);
T(49) = params(20)/(params(13)*T(46))^T(1);
T(50) = params(16)*(1-params(7))*(1-params(13))/params(20);
T(51) = params(16)*params(7)*(1-params(13))/params(20);
T(52) = params(13)*params(16)/params(20);
T(53) = exp(params(3))^(-T(44));
T(54) = (T(50)+(1-params(7))*(1-params(13))/params(20))/(T(53)*((1-params(7))*(1-params(13))*params(14)*exp(params(3)))^T(44)*((1-params(7))*(1-params(13))*params(32))^T(45));
T(55) = (T(51)+params(7)*(1-params(13))/params(20))/(T(53)*(params(7)*(1-params(13))*params(14)*exp(params(3)))^T(44)*(params(7)*(1-params(13))*params(32))^T(45));
T(56) = (T(52)+params(13)/params(20))/(T(53)*(params(13)*params(14)*exp(params(3)))^T(44)*(params(13)*params(32))^T(45));
T(57) = (1-params(13))^(-params(21));
T(58) = (1-(1-params(13)))^(-params(21));
T(59) = y(83)^(1+params(21))*T(57)+y(84)^(1+params(21))*T(58);
T(60) = exp(y(90))*params(15)/params(32)*T(37)/(params(8)*params(32)^T(4)*((1-params(13))*(1-params(17))-(T(46))^T(3)/T(3)));
T(61) = y(85)^T(4)*T(60);
T(62) = y(85)^(1+T(4))*T(60)/(1+T(4));
T(63) = y(123)*T(62);
T(64) = params(9)*T(43)/2;
T(65) = y(119)^T(1)*T(47);
T(66) = T(14)^(-T(44));
T(67) = exp(y(86))*T(54)*T(66);
T(68) = (y(102)*y(5))^T(44);
T(69) = T(67)*T(68);
T(70) = y(81)^T(45);
T(71) = T(65)*(T(69)*T(70)-T(50));
T(72) = y(120)^T(1)*T(48);
T(73) = exp(y(86))*T(55)*T(66);
T(74) = (y(103)*y(6))^T(44);
T(75) = T(73)*T(74);
T(76) = y(82)^T(45);
T(77) = T(72)*(T(75)*T(76)-T(51));
T(78) = y(121)^T(1)*T(49);
T(79) = exp(y(88))*T(56)*T(66);
T(80) = (y(104)*y(7))^T(44);
T(81) = T(79)*T(80);
T(82) = y(84)^T(45);
T(83) = T(78)*(T(81)*T(82)-T(52));
T(84) = y(5)^T(44);
T(85) = T(67)*T(84);
T(86) = T(70)*T(85)-T(50);
T(87) = y(6)^T(44);
T(88) = T(73)*T(87);
T(89) = T(76)*T(88)-T(51);
T(90) = y(7)^T(44);
T(91) = T(79)*T(90);
T(92) = T(82)*T(91)-T(52);

end
