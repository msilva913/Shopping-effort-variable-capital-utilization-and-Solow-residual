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

assert(length(T) >= 71);

T(1) = (params(6)-1)/params(6);
T(2) = (1-params(16))*params(13)/(1+params(14));
T(3) = params(16)^(params(17)/(1+params(17)));
T(4) = 1+1/params(17);
T(5) = 1/params(4);
T(6) = (y(81)/y(83))^params(19);
T(7) = (y(82)/y(83))^params(19);
T(8) = params(7)*y(112)^(-params(6));
T(9) = exp(y(88))*y(105)^(1/params(17));
T(10) = exp(y(88))*y(105)^T(4)/T(4);
T(11) = y(66)-params(15)*y(1)-T(10);
T(12) = T(11)^params(5);
T(13) = y(16)^(1-params(5));
T(14) = params(9)/2;
T(15) = exp(y(125));
T(16) = exp(y(200))^(-params(1));
T(17) = params(2)*exp(y(90))*y(193)/y(114)*T(16);
T(18) = y(197)^2;
T(19) = T(17)*y(194)*y(190)*T(18);
T(20) = y(198)^2;
T(21) = T(17)*y(195)*y(191)*T(20);
T(22) = y(199)^2;
T(23) = T(17)*y(196)*y(192)*T(22);
T(24) = y(5)^(1-params(13));
T(25) = y(79)^params(13);
T(26) = T(24)*T(25);
T(27) = y(6)^(1-params(13));
T(28) = y(80)^params(13);
T(29) = T(27)*T(28);
T(30) = y(7)^(1-params(13));
T(31) = y(82)^params(13);
T(32) = T(30)*T(31);
T(33) = (1-params(7))*y(111)^(-params(6));
T(34) = params(7)^(1-T(1));
T(35) = (1-params(7))^(1-T(1));
T(36) = T(34)*y(68)^T(1)+T(35)*y(67)^T(1);
T(37) = y(79)^T(2);
T(38) = y(80)^T(2);
T(39) = y(82)^T(2);
T(40) = params(12)*(exp(params(3))^params(1)/params(2)-1+1+params(11)/params(12)-exp(params(3)))/(1+params(14));
T(41) = params(18)/(T(3)*(1-params(7))*(1-params(11)))^params(16);
T(42) = params(18)/(T(3)*params(7)*(1-params(11)))^params(16);
T(43) = params(18)/(params(11)*T(3))^params(16);
T(44) = params(14)*(1-params(7))*(1-params(11))/params(18);
T(45) = params(14)*params(7)*(1-params(11))/params(18);
T(46) = params(11)*params(14)/params(18);
T(47) = exp(params(3))^(-T(40));
T(48) = (T(44)+(1-params(7))*(1-params(11))/params(18))/(T(47)*((1-params(7))*(1-params(11))*params(12)*exp(params(3)))^T(40)*((1-params(7))*(1-params(11))*params(30))^T(2));
T(49) = (T(45)+params(7)*(1-params(11))/params(18))/(T(47)*(params(7)*(1-params(11))*params(12)*exp(params(3)))^T(40)*(params(7)*(1-params(11))*params(30))^T(2));
T(50) = (T(46)+params(11)/params(18))/(T(47)*(params(11)*params(12)*exp(params(3)))^T(40)*(params(11)*params(30))^T(2));
T(51) = (1-params(11))^(-params(19));
T(52) = (1-(1-params(11)))^(-params(19));
T(53) = y(81)^(1+params(19))*T(51)+y(82)^(1+params(19))*T(52);
T(54) = exp(y(87))*(1-params(16))*params(13)/params(30)/(params(8)*params(30)^T(5)*((1-params(11))*(1-params(15))-(T(3))^T(4)/T(4)));
T(55) = y(83)^T(5)*T(54);
T(56) = y(83)^(1+T(5))*T(54)/(1+T(5));
T(57) = y(110)*T(56);
T(58) = 1-(1+params(11)/params(12)-exp(params(3)));
T(59) = y(106)^params(16)*T(41);
T(60) = T(15)^(-T(40));
T(61) = exp(y(84))*T(48)*T(60);
T(62) = y(5)^T(40);
T(63) = T(61)*T(62);
T(64) = y(107)^params(16)*T(42);
T(65) = exp(y(84))*T(49)*T(60);
T(66) = y(6)^T(40);
T(67) = T(65)*T(66);
T(68) = y(108)^params(16)*T(43);
T(69) = exp(y(86))*T(50)*T(60);
T(70) = y(7)^T(40);
T(71) = T(69)*T(70);

end
