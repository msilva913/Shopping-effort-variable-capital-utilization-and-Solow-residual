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

assert(length(T) >= 85);

T(1) = (params(5)-1)/params(5);
T(2) = (1-params(16))*params(13)/(1+params(14));
T(3) = params(16)^(params(17)/(1+params(17)));
T(4) = 1/params(4);
T(5) = (y(47)/y(49))^params(19);
T(6) = (y(48)/y(49))^params(19);
T(7) = params(6)*y(85)^(-params(5));
T(8) = y(79)^(1/params(17));
T(9) = 1+1/params(17);
T(10) = params(10)/2;
T(11) = exp(y(99));
T(12) = exp(y(150))^(-params(1));
T(13) = params(2)*exp(y(54))*y(143)/y(87)*T(12);
T(14) = y(147)^2;
T(15) = T(13)*y(144)*y(140)*T(14);
T(16) = y(148)^2;
T(17) = T(13)*y(145)*y(141)*T(16);
T(18) = y(149)^2;
T(19) = T(13)*y(146)*y(142)*T(18);
T(20) = y(33)/y(31);
T(21) = y(34)/y(31);
T(22) = y(36)/y(31);
T(23) = T(11)^(1-params(13));
T(24) = y(5)^(1-params(13));
T(25) = y(45)^params(13);
T(26) = T(24)*T(25);
T(27) = y(6)^(1-params(13));
T(28) = y(46)^params(13);
T(29) = T(27)*T(28);
T(30) = y(7)^(1-params(13));
T(31) = y(48)^params(13);
T(32) = T(30)*T(31);
T(33) = y(33)*T(20)/T(26)+y(34)*T(21)/T(29)+y(36)*T(22)/T(32);
T(34) = (1-params(6))*y(84)^(-params(5));
T(35) = params(6)^(1-T(1));
T(36) = (1-params(6))^(1-T(1));
T(37) = T(35)*y(34)^T(1)+T(36)*y(33)^T(1);
T(38) = y(45)^T(2);
T(39) = y(46)^T(2);
T(40) = y(48)^T(2);
T(41) = 1+params(11)/params(12)-exp(params(3));
T(42) = exp(params(3))^params(1)/params(2)-1+T(41);
T(43) = params(12)*T(42)/(1+params(14));
T(44) = params(18)/(T(3)*(1-params(6))*(1-params(11)))^params(16);
T(45) = params(18)/(T(3)*params(6)*(1-params(11)))^params(16);
T(46) = params(18)/(params(11)*T(3))^params(16);
T(47) = params(14)*(1-params(6))*(1-params(11))/params(18);
T(48) = params(14)*params(6)*(1-params(11))/params(18);
T(49) = params(11)*params(14)/params(18);
T(50) = exp(params(3))^(-T(43));
T(51) = (T(47)+(1-params(6))*(1-params(11))/params(18))/(T(50)*((1-params(6))*(1-params(11))*params(12)*exp(params(3)))^T(43)*((1-params(6))*(1-params(11))*params(28))^T(2));
T(52) = (T(48)+params(6)*(1-params(11))/params(18))/(T(50)*(params(6)*(1-params(11))*params(12)*exp(params(3)))^T(43)*(params(6)*(1-params(11))*params(28))^T(2));
T(53) = (T(49)+params(11)/params(18))/(T(50)*(params(11)*params(12)*exp(params(3)))^T(43)*(params(11)*params(28))^T(2));
T(54) = (1-params(11))^(-params(19));
T(55) = (1-(1-params(11)))^(-params(19));
T(56) = y(47)^(1+params(19))*T(54)+y(48)^(1+params(19))*T(55);
T(57) = exp(y(53))*(1-params(16))*params(13)/params(28)/(params(28)^T(4)*params(7));
T(58) = y(49)^T(4)*T(57);
T(59) = y(49)^(1+T(4))*T(57)/(1+T(4));
T(60) = params(8)*T(42)/2;
T(61) = y(80)^params(16)*T(44);
T(62) = T(11)^(-T(43));
T(63) = exp(y(50))*T(51)*T(62);
T(64) = (y(63)*y(5))^T(43);
T(65) = T(63)*T(64);
T(66) = T(61)*(T(38)*T(65)-T(47));
T(67) = y(81)^params(16)*T(45);
T(68) = exp(y(50))*T(52)*T(62);
T(69) = (y(64)*y(6))^T(43);
T(70) = T(68)*T(69);
T(71) = T(67)*(T(39)*T(70)-T(48));
T(72) = y(82)^params(16)*T(46);
T(73) = exp(y(52))*T(53)*T(62);
T(74) = (y(65)*y(7))^T(43);
T(75) = T(73)*T(74);
T(76) = T(72)*(T(40)*T(75)-T(49));
T(77) = y(5)^T(43);
T(78) = T(63)*T(77);
T(79) = T(38)*T(78)-T(47);
T(80) = y(6)^T(43);
T(81) = T(68)*T(80);
T(82) = T(39)*T(81)-T(48);
T(83) = y(7)^T(43);
T(84) = T(73)*T(83);
T(85) = T(40)*T(84)-T(49);

end
