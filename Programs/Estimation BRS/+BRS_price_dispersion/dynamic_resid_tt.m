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

assert(length(T) >= 90);

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
T(26) = y(5)^(1-params(15));
T(27) = y(81)^params(15);
T(28) = T(26)*T(27);
T(29) = y(6)^(1-params(15));
T(30) = y(82)^params(15);
T(31) = T(29)*T(30);
T(32) = y(7)^(1-params(15));
T(33) = y(84)^params(15);
T(34) = T(32)*T(33);
T(35) = 1-T(1);
T(36) = (1-params(7))*y(124)^(-params(6));
T(37) = params(7)^(1-T(2));
T(38) = (1-params(7))^(1-T(2));
T(39) = T(37)*y(70)^T(2)+T(38)*y(69)^T(2);
T(40) = 1+params(13)/params(14)-exp(params(3));
T(41) = exp(params(3))^params(1)/params(2)-1+T(40);
T(42) = params(14)*T(41)/(1+params(16));
T(43) = params(15)*T(35)/(1+params(16));
T(44) = T(1)^(params(19)/(1+params(19)));
T(45) = params(20)/((1-params(7))*(1-params(13))*T(44))^T(1);
T(46) = params(20)/(params(7)*(1-params(13))*T(44))^T(1);
T(47) = params(20)/(params(13)*T(44))^T(1);
T(48) = params(16)*(1-params(7))*(1-params(13))/params(20);
T(49) = params(16)*params(7)*(1-params(13))/params(20);
T(50) = params(13)*params(16)/params(20);
T(51) = exp(params(3))^(-T(42));
T(52) = (T(48)+(1-params(7))*(1-params(13))/params(20))/(T(51)*((1-params(7))*(1-params(13))*params(14)*exp(params(3)))^T(42)*((1-params(7))*(1-params(13))*params(32))^T(43));
T(53) = (T(49)+params(7)*(1-params(13))/params(20))/(T(51)*(params(7)*(1-params(13))*params(14)*exp(params(3)))^T(42)*(params(7)*(1-params(13))*params(32))^T(43));
T(54) = (T(50)+params(13)/params(20))/(T(51)*(params(13)*params(14)*exp(params(3)))^T(42)*(params(13)*params(32))^T(43));
T(55) = (1-params(13))^(-params(21));
T(56) = (1-(1-params(13)))^(-params(21));
T(57) = y(83)^(1+params(21))*T(55)+y(84)^(1+params(21))*T(56);
T(58) = exp(y(90))*params(15)/params(32)*T(35)/(params(8)*params(32)^T(4)*((1-params(13))*(1-params(17))-(T(44))^T(3)/T(3)));
T(59) = y(85)^T(4)*T(58);
T(60) = y(85)^(1+T(4))*T(58)/(1+T(4));
T(61) = y(123)*T(60);
T(62) = params(9)*T(41)/2;
T(63) = y(119)^T(1)*T(45);
T(64) = T(14)^(-T(42));
T(65) = exp(y(86))*T(52)*T(64);
T(66) = (y(102)*y(5))^T(42);
T(67) = T(65)*T(66);
T(68) = y(81)^T(43);
T(69) = T(63)*(T(67)*T(68)-T(48));
T(70) = y(120)^T(1)*T(46);
T(71) = exp(y(86))*T(53)*T(64);
T(72) = (y(103)*y(6))^T(42);
T(73) = T(71)*T(72);
T(74) = y(82)^T(43);
T(75) = T(70)*(T(73)*T(74)-T(49));
T(76) = y(121)^T(1)*T(47);
T(77) = exp(y(88))*T(54)*T(64);
T(78) = (y(104)*y(7))^T(42);
T(79) = T(77)*T(78);
T(80) = y(84)^T(43);
T(81) = T(76)*(T(79)*T(80)-T(50));
T(82) = y(5)^T(42);
T(83) = T(65)*T(82);
T(84) = T(68)*T(83)-T(48);
T(85) = y(6)^T(42);
T(86) = T(71)*T(85);
T(87) = T(74)*T(86)-T(49);
T(88) = y(7)^T(42);
T(89) = T(77)*T(88);
T(90) = T(80)*T(89)-T(50);

end
