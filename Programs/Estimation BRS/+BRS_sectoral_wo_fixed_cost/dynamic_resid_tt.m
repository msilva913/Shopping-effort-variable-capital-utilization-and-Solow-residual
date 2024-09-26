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

assert(length(T) >= 86);

T(1) = (params(5)-1)/params(5);
T(2) = (1-params(16))*params(13)/(1+params(14));
T(3) = params(16)^(params(17)/(1+params(17)));
T(4) = 1/params(4);
T(5) = (y(50)/y(52))^params(19);
T(6) = (y(51)/y(52))^params(19);
T(7) = params(6)*y(91)^(-params(5));
T(8) = exp(y(58))*y(85)^(1/params(17));
T(9) = 1+1/params(17);
T(10) = exp(y(58))*y(85)^T(9)/T(9);
T(11) = params(10)/2;
T(12) = exp(y(105));
T(13) = exp(y(158))^(-params(1));
T(14) = params(2)*exp(y(60))*y(151)/y(93)*T(13);
T(15) = y(155)^2;
T(16) = T(14)*y(152)*y(148)*T(15);
T(17) = y(156)^2;
T(18) = T(14)*y(153)*y(149)*T(17);
T(19) = y(157)^2;
T(20) = T(14)*y(154)*y(150)*T(19);
T(21) = y(36)/y(34);
T(22) = y(37)/y(34);
T(23) = y(39)/y(34);
T(24) = T(12)^(1-params(13));
T(25) = y(5)^(1-params(13));
T(26) = y(48)^params(13);
T(27) = T(25)*T(26);
T(28) = y(6)^(1-params(13));
T(29) = y(49)^params(13);
T(30) = T(28)*T(29);
T(31) = y(7)^(1-params(13));
T(32) = y(51)^params(13);
T(33) = T(31)*T(32);
T(34) = y(36)*T(21)/T(27)+y(37)*T(22)/T(30)+y(39)*T(23)/T(33);
T(35) = (1-params(6))*y(90)^(-params(5));
T(36) = params(6)^(1-T(1));
T(37) = (1-params(6))^(1-T(1));
T(38) = T(36)*y(37)^T(1)+T(37)*y(36)^T(1);
T(39) = y(48)^T(2);
T(40) = y(49)^T(2);
T(41) = y(51)^T(2);
T(42) = 1+params(11)/params(12)-exp(params(3));
T(43) = exp(params(3))^params(1)/params(2)-1+T(42);
T(44) = params(12)*T(43)/(1+params(14));
T(45) = params(18)/(T(3)*(1-params(6))*(1-params(11)))^params(16);
T(46) = params(18)/(T(3)*params(6)*(1-params(11)))^params(16);
T(47) = params(18)/(params(11)*T(3))^params(16);
T(48) = params(14)*(1-params(6))*(1-params(11))/params(18);
T(49) = params(14)*params(6)*(1-params(11))/params(18);
T(50) = params(11)*params(14)/params(18);
T(51) = exp(params(3))^(-T(44));
T(52) = (T(48)+(1-params(6))*(1-params(11))/params(18))/(T(51)*((1-params(6))*(1-params(11))*params(12)*exp(params(3)))^T(44)*((1-params(6))*(1-params(11))*params(30))^T(2));
T(53) = (T(49)+params(6)*(1-params(11))/params(18))/(T(51)*(params(6)*(1-params(11))*params(12)*exp(params(3)))^T(44)*(params(6)*(1-params(11))*params(30))^T(2));
T(54) = (T(50)+params(11)/params(18))/(T(51)*(params(11)*params(12)*exp(params(3)))^T(44)*(params(11)*params(30))^T(2));
T(55) = (1-params(11))^(-params(19));
T(56) = (1-(1-params(11)))^(-params(19));
T(57) = y(50)^(1+params(19))*T(55)+y(51)^(1+params(19))*T(56);
T(58) = exp(y(57))*(1-params(16))*params(13)/params(30)/(params(30)^T(4)*params(7));
T(59) = y(52)^T(4)*T(58);
T(60) = y(52)^(1+T(4))*T(58)/(1+T(4));
T(61) = params(8)*T(43)/2;
T(62) = y(86)^params(16)*T(45);
T(63) = T(12)^(-T(44));
T(64) = exp(y(53))*T(52)*T(63);
T(65) = (y(69)*y(5))^T(44);
T(66) = T(64)*T(65);
T(67) = T(62)*(T(39)*T(66)-T(48));
T(68) = y(87)^params(16)*T(46);
T(69) = exp(y(53))*T(53)*T(63);
T(70) = (y(70)*y(6))^T(44);
T(71) = T(69)*T(70);
T(72) = T(68)*(T(40)*T(71)-T(49));
T(73) = y(88)^params(16)*T(47);
T(74) = exp(y(55))*T(54)*T(63);
T(75) = (y(71)*y(7))^T(44);
T(76) = T(74)*T(75);
T(77) = T(73)*(T(41)*T(76)-T(50));
T(78) = y(5)^T(44);
T(79) = T(64)*T(78);
T(80) = T(39)*T(79)-T(48);
T(81) = y(6)^T(44);
T(82) = T(69)*T(81);
T(83) = T(40)*T(82)-T(49);
T(84) = y(7)^T(44);
T(85) = T(74)*T(84);
T(86) = T(41)*T(85)-T(50);

end
