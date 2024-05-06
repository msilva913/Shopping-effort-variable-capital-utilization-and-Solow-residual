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

assert(length(T) >= 88);

T(1) = (params(6)-1)/params(6);
T(2) = (1-params(18))*params(15)/(1+params(16));
T(3) = params(18)^(params(19)/(1+params(19)));
T(4) = 1+1/params(19);
T(5) = 1/params(4);
T(6) = (y(83)/y(85))^params(21);
T(7) = (y(84)/y(85))^params(21);
T(8) = params(7)*y(125)^(-params(6));
T(9) = exp(y(91))*y(118)^(1/params(19));
T(10) = exp(y(91))*y(118)^T(4)/T(4);
T(11) = y(68)-params(17)*y(1)-T(10);
T(12) = T(11)^params(5);
T(13) = y(16)^(1-params(5));
T(14) = params(11)/2;
T(15) = exp(y(139));
T(16) = exp(y(224))^(-params(1));
T(17) = params(2)*exp(y(93))*y(217)/y(127)*T(16);
T(18) = y(221)^2;
T(19) = T(17)*y(218)*y(214)*T(18);
T(20) = y(222)^2;
T(21) = T(17)*y(219)*y(215)*T(20);
T(22) = y(223)^2;
T(23) = T(17)*y(220)*y(216)*T(22);
T(24) = y(69)/y(67);
T(25) = y(70)/y(67);
T(26) = y(72)/y(67);
T(27) = y(5)^(1-params(15));
T(28) = y(81)^params(15);
T(29) = T(27)*T(28);
T(30) = y(6)^(1-params(15));
T(31) = y(82)^params(15);
T(32) = T(30)*T(31);
T(33) = y(7)^(1-params(15));
T(34) = y(84)^params(15);
T(35) = T(33)*T(34);
T(36) = (1-params(7))*y(124)^(-params(6));
T(37) = params(7)^(1-T(1));
T(38) = (1-params(7))^(1-T(1));
T(39) = T(37)*y(70)^T(1)+T(38)*y(69)^T(1);
T(40) = y(81)^T(2);
T(41) = y(82)^T(2);
T(42) = y(84)^T(2);
T(43) = 1+params(13)/params(14)-exp(params(3));
T(44) = exp(params(3))^params(1)/params(2)-1+T(43);
T(45) = params(14)*T(44)/(1+params(16));
T(46) = params(20)/(T(3)*(1-params(7))*(1-params(13)))^params(18);
T(47) = params(20)/(T(3)*params(7)*(1-params(13)))^params(18);
T(48) = params(20)/(params(13)*T(3))^params(18);
T(49) = params(16)*(1-params(7))*(1-params(13))/params(20);
T(50) = params(16)*params(7)*(1-params(13))/params(20);
T(51) = params(13)*params(16)/params(20);
T(52) = exp(params(3))^(-T(45));
T(53) = (T(49)+(1-params(7))*(1-params(13))/params(20))/(T(52)*((1-params(7))*(1-params(13))*params(14)*exp(params(3)))^T(45)*((1-params(7))*(1-params(13))*params(32))^T(2));
T(54) = (T(50)+params(7)*(1-params(13))/params(20))/(T(52)*(params(7)*(1-params(13))*params(14)*exp(params(3)))^T(45)*(params(7)*(1-params(13))*params(32))^T(2));
T(55) = (T(51)+params(13)/params(20))/(T(52)*(params(13)*params(14)*exp(params(3)))^T(45)*(params(13)*params(32))^T(2));
T(56) = (1-params(13))^(-params(21));
T(57) = (1-(1-params(13)))^(-params(21));
T(58) = y(83)^(1+params(21))*T(56)+y(84)^(1+params(21))*T(57);
T(59) = exp(y(90))*(1-params(18))*params(15)/params(32)/(params(8)*params(32)^T(5)*((1-params(13))*(1-params(17))-(T(3))^T(4)/T(4)));
T(60) = y(85)^T(5)*T(59);
T(61) = y(85)^(1+T(5))*T(59)/(1+T(5));
T(62) = y(123)*T(61);
T(63) = params(9)*T(44)/2;
T(64) = y(119)^params(18)*T(46);
T(65) = T(15)^(-T(45));
T(66) = exp(y(86))*T(53)*T(65);
T(67) = (y(102)*y(5))^T(45);
T(68) = T(66)*T(67);
T(69) = T(64)*(T(40)*T(68)-T(49));
T(70) = y(120)^params(18)*T(47);
T(71) = exp(y(86))*T(54)*T(65);
T(72) = (y(103)*y(6))^T(45);
T(73) = T(71)*T(72);
T(74) = T(70)*(T(41)*T(73)-T(50));
T(75) = y(121)^params(18)*T(48);
T(76) = exp(y(88))*T(55)*T(65);
T(77) = (y(104)*y(7))^T(45);
T(78) = T(76)*T(77);
T(79) = T(75)*(T(42)*T(78)-T(51));
T(80) = y(5)^T(45);
T(81) = T(66)*T(80);
T(82) = T(40)*T(81)-T(49);
T(83) = y(6)^T(45);
T(84) = T(71)*T(83);
T(85) = T(41)*T(84)-T(50);
T(86) = y(7)^T(45);
T(87) = T(76)*T(86);
T(88) = T(42)*T(87)-T(51);

end
