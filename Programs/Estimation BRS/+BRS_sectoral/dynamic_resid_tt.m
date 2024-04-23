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

assert(length(T) >= 76);

T(1) = (params(6)-1)/params(6);
T(2) = (1-params(18))*params(15)/(1+params(16));
T(3) = params(18)^(params(19)/(1+params(19)));
T(4) = 1+1/params(19);
T(5) = 1/params(4);
T(6) = (y(81)/y(83))^params(21);
T(7) = (y(82)/y(83))^params(21);
T(8) = params(7)*y(122)^(-params(6));
T(9) = exp(y(88))*y(115)^(1/params(19));
T(10) = exp(y(88))*y(115)^T(4)/T(4);
T(11) = y(67)-params(17)*y(1)-T(10);
T(12) = T(11)^params(5);
T(13) = y(16)^(1-params(5));
T(14) = params(11)/2;
T(15) = exp(y(136));
T(16) = exp(y(219))^(-params(1));
T(17) = params(2)*exp(y(90))*y(212)/y(124)*T(16);
T(18) = y(216)^2;
T(19) = T(17)*y(213)*y(209)*T(18);
T(20) = y(217)^2;
T(21) = T(17)*y(214)*y(210)*T(20);
T(22) = y(218)^2;
T(23) = T(17)*y(215)*y(211)*T(22);
T(24) = (1-params(7))*y(121)^(-params(6));
T(25) = params(7)^(1-T(1));
T(26) = (1-params(7))^(1-T(1));
T(27) = T(25)*y(69)^T(1)+T(26)*y(68)^T(1);
T(28) = y(79)^T(2);
T(29) = y(80)^T(2);
T(30) = y(82)^T(2);
T(31) = 1+params(13)/params(14)-exp(params(3));
T(32) = exp(params(3))^params(1)/params(2)-1+T(31);
T(33) = params(14)*T(32)/(1+params(16));
T(34) = params(20)/(T(3)*(1-params(7))*(1-params(13)))^params(18);
T(35) = params(20)/(T(3)*params(7)*(1-params(13)))^params(18);
T(36) = params(20)/(params(13)*T(3))^params(18);
T(37) = params(16)*(1-params(7))*(1-params(13))/params(20);
T(38) = params(16)*params(7)*(1-params(13))/params(20);
T(39) = params(13)*params(16)/params(20);
T(40) = exp(params(3))^(-T(33));
T(41) = (T(37)+(1-params(7))*(1-params(13))/params(20))/(T(40)*((1-params(7))*(1-params(13))*params(14)*exp(params(3)))^T(33)*((1-params(7))*(1-params(13))*params(32))^T(2));
T(42) = (T(38)+params(7)*(1-params(13))/params(20))/(T(40)*(params(7)*(1-params(13))*params(14)*exp(params(3)))^T(33)*(params(7)*(1-params(13))*params(32))^T(2));
T(43) = (T(39)+params(13)/params(20))/(T(40)*(params(13)*params(14)*exp(params(3)))^T(33)*(params(13)*params(32))^T(2));
T(44) = (1-params(13))^(-params(21));
T(45) = (1-(1-params(13)))^(-params(21));
T(46) = y(81)^(1+params(21))*T(44)+y(82)^(1+params(21))*T(45);
T(47) = exp(y(87))*(1-params(18))*params(15)/params(32)/(params(8)*params(32)^T(5)*((1-params(13))*(1-params(17))-(T(3))^T(4)/T(4)));
T(48) = y(83)^T(5)*T(47);
T(49) = y(83)^(1+T(5))*T(47)/(1+T(5));
T(50) = y(120)*T(49);
T(51) = params(9)*T(32)/2;
T(52) = y(116)^params(18)*T(34);
T(53) = T(15)^(-T(33));
T(54) = exp(y(84))*T(41)*T(53);
T(55) = (y(99)*y(5))^T(33);
T(56) = T(54)*T(55);
T(57) = T(52)*(T(28)*T(56)-T(37));
T(58) = y(117)^params(18)*T(35);
T(59) = exp(y(84))*T(42)*T(53);
T(60) = (y(100)*y(6))^T(33);
T(61) = T(59)*T(60);
T(62) = T(58)*(T(29)*T(61)-T(38));
T(63) = y(118)^params(18)*T(36);
T(64) = exp(y(86))*T(43)*T(53);
T(65) = (y(101)*y(7))^T(33);
T(66) = T(64)*T(65);
T(67) = T(63)*(T(30)*T(66)-T(39));
T(68) = y(5)^T(33);
T(69) = T(54)*T(68);
T(70) = T(28)*T(69)-T(37);
T(71) = y(6)^T(33);
T(72) = T(59)*T(71);
T(73) = T(29)*T(72)-T(38);
T(74) = y(7)^T(33);
T(75) = T(64)*T(74);
T(76) = T(30)*T(75)-T(39);

end
