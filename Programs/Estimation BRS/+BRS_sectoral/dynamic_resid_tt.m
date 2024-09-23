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

assert(length(T) >= 81);

T(1) = (params(5)-1)/params(5);
T(2) = (1-params(16))*params(13)/(1+params(14));
T(3) = params(16)^(params(17)/(1+params(17)));
T(4) = 1/params(4);
T(5) = params(6)*y(88)^(-params(5));
T(6) = exp(y(57))*y(82)^(1/params(17));
T(7) = 1+1/params(17);
T(8) = exp(y(57))*y(82)^T(7)/T(7);
T(9) = params(10)/2;
T(10) = exp(y(102));
T(11) = exp(y(155))^(-params(1));
T(12) = params(2)*exp(y(59))*y(148)/y(90)*T(11);
T(13) = y(152)^2;
T(14) = T(12)*y(149)*y(145)*T(13);
T(15) = y(153)^2;
T(16) = T(12)*y(150)*y(146)*T(15);
T(17) = y(154)^2;
T(18) = T(12)*y(151)*y(147)*T(17);
T(19) = y(36)/y(34);
T(20) = y(37)/y(34);
T(21) = y(39)/y(34);
T(22) = T(10)^(1-params(13));
T(23) = y(5)^(1-params(13));
T(24) = y(48)^params(13);
T(25) = T(23)*T(24);
T(26) = y(6)^(1-params(13));
T(27) = y(49)^params(13);
T(28) = T(26)*T(27);
T(29) = y(7)^(1-params(13));
T(30) = y(51)^params(13);
T(31) = T(29)*T(30);
T(32) = y(36)*T(19)/T(25)+y(37)*T(20)/T(28)+y(39)*T(21)/T(31);
T(33) = (1-params(6))*y(87)^(-params(5));
T(34) = params(6)^(1-T(1));
T(35) = (1-params(6))^(1-T(1));
T(36) = T(34)*y(37)^T(1)+T(35)*y(36)^T(1);
T(37) = y(48)^T(2);
T(38) = y(49)^T(2);
T(39) = y(51)^T(2);
T(40) = 1+params(11)/params(12)-exp(params(3));
T(41) = exp(params(3))^params(1)/params(2)-1+T(40);
T(42) = params(12)*T(41)/(1+params(14));
T(43) = params(18)/(T(3)*(1-params(6))*(1-params(11)))^params(16);
T(44) = params(18)/(T(3)*params(6)*(1-params(11)))^params(16);
T(45) = params(18)/(params(11)*T(3))^params(16);
T(46) = params(14)*(1-params(6))*(1-params(11))/params(18);
T(47) = params(14)*params(6)*(1-params(11))/params(18);
T(48) = params(11)*params(14)/params(18);
T(49) = exp(params(3))^(-T(42));
T(50) = (T(46)+(1-params(6))*(1-params(11))/params(18))/(T(49)*((1-params(6))*(1-params(11))*params(12)*exp(params(3)))^T(42)*((1-params(6))*(1-params(11))*params(29))^T(2));
T(51) = (T(47)+params(6)*(1-params(11))/params(18))/(T(49)*(params(6)*(1-params(11))*params(12)*exp(params(3)))^T(42)*(params(6)*(1-params(11))*params(29))^T(2));
T(52) = (T(48)+params(11)/params(18))/(T(49)*(params(11)*params(12)*exp(params(3)))^T(42)*(params(11)*params(29))^T(2));
T(53) = exp(y(56))*(1-params(16))*params(13)/params(29)/(params(29)^T(4)*params(7));
T(54) = y(47)^T(4)*T(53);
T(55) = y(47)^(1+T(4))*T(53)/(1+T(4));
T(56) = params(8)*T(41)/2;
T(57) = y(83)^params(16)*T(43);
T(58) = T(10)^(-T(42));
T(59) = exp(y(52))*T(50)*T(58);
T(60) = (y(66)*y(5))^T(42);
T(61) = T(59)*T(60);
T(62) = T(57)*(T(37)*T(61)-T(46));
T(63) = y(84)^params(16)*T(44);
T(64) = exp(y(52))*T(51)*T(58);
T(65) = (y(67)*y(6))^T(42);
T(66) = T(64)*T(65);
T(67) = T(63)*(T(38)*T(66)-T(47));
T(68) = y(85)^params(16)*T(45);
T(69) = exp(y(54))*T(52)*T(58);
T(70) = (y(68)*y(7))^T(42);
T(71) = T(69)*T(70);
T(72) = T(68)*(T(39)*T(71)-T(48));
T(73) = y(5)^T(42);
T(74) = T(59)*T(73);
T(75) = T(37)*T(74)-T(46);
T(76) = y(6)^T(42);
T(77) = T(64)*T(76);
T(78) = T(38)*T(77)-T(47);
T(79) = y(7)^T(42);
T(80) = T(69)*T(79);
T(81) = T(39)*T(80)-T(48);

end
