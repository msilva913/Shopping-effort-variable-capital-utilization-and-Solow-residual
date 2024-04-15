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

assert(length(T) >= 69);

T(1) = (params(6)-1)/params(6);
T(2) = (1-params(18))*params(15)/(1+params(16));
T(3) = params(18)^(params(19)/(1+params(19)));
T(4) = 1+1/params(19);
T(5) = 1/params(4);
T(6) = y(113)^(-params(1));
T(7) = y(80)^T(5);
T(8) = (y(78)/y(80))^params(21);
T(9) = (y(79)/y(80))^params(21);
T(10) = exp(y(85))*y(109)^(1/params(19));
T(11) = exp(y(85))*y(109)^T(4)/T(4);
T(12) = y(65)-params(17)*y(1)-T(11);
T(13) = T(12)^params(5);
T(14) = y(15)^(1-params(5));
T(15) = exp(y(207))^(-params(1));
T(16) = params(2)*exp(y(87))*y(202)/y(120)*T(15);
T(17) = y(205)^2;
T(18) = T(16)*y(203)*y(200)*T(17);
T(19) = y(206)^2;
T(20) = T(16)*y(204)*y(201)*T(19);
T(21) = 1-T(1);
T(22) = (1-params(7))^T(21);
T(23) = params(7)^T(21);
T(24) = T(23)*y(67)^T(1)+T(22)*y(66)^T(1);
T(25) = y(76)^T(2);
T(26) = y(77)^T(2);
T(27) = y(79)^T(2);
T(28) = 1+params(13)/params(14)-exp(params(3));
T(29) = exp(params(3))^params(1)/params(2)-1+T(28);
T(30) = params(14)*T(29)/(1+params(16));
T(31) = params(20)/(T(3)*(1-params(13))*(1-params(7)))^params(18);
T(32) = params(20)/(T(3)*(1-params(13))*params(7))^params(18);
T(33) = params(20)/(params(13)*T(3))^params(18);
T(34) = params(16)*(1-params(13))*(1-params(7))/params(20);
T(35) = params(16)*(1-params(13))*params(7)/params(20);
T(36) = params(13)*params(16)/params(20);
T(37) = exp(params(3))^(-T(30));
T(38) = (T(34)+(1-params(13))*(1-params(7))/params(20))/(T(37)*((1-params(13))*(1-params(7))*params(14)*exp(params(3)))^T(30)*((1-params(13))*(1-params(7))*params(32))^T(2));
T(39) = (T(35)+(1-params(13))*params(7)/params(20))/(T(37)*((1-params(13))*params(7)*params(14)*exp(params(3)))^T(30)*((1-params(13))*params(7)*params(32))^T(2));
T(40) = (T(36)+params(13)/params(20))/(T(37)*(params(13)*params(14)*exp(params(3)))^T(30)*(params(13)*params(32))^T(2));
T(41) = (1-params(18))*params(15)/params(32)/(params(8)*params(32)^T(5)*((1-params(13))*(1-params(17))-(T(3))^T(4)/T(4)));
T(42) = (1-params(13))^(-params(21));
T(43) = (1-(1-params(13)))^(-params(21));
T(44) = y(78)^(1+params(21))*T(42)+y(79)^(1+params(21))*T(43);
T(45) = T(7)*exp(y(84))*T(6)*T(41);
T(46) = y(80)^(1+T(5))*exp(y(84))*T(41)/(1+T(5));
T(47) = y(114)*T(46);
T(48) = params(9)*T(29)/2;
T(49) = y(110)^params(18)*T(31);
T(50) = exp(y(129))^(-T(30));
T(51) = exp(y(81))*T(38)*T(50);
T(52) = (y(96)*y(4))^T(30);
T(53) = T(51)*T(52);
T(54) = T(49)*(T(25)*T(53)-T(34));
T(55) = y(111)^params(18)*T(32);
T(56) = exp(y(81))*T(39)*T(50);
T(57) = (y(97)*y(5))^T(30);
T(58) = T(56)*T(57);
T(59) = y(112)^params(18)*T(33);
T(60) = exp(y(83))*T(40)*T(50);
T(61) = (y(98)*y(6))^T(30);
T(62) = T(60)*T(61);
T(63) = T(59)*(T(27)*T(62)-T(36));
T(64) = y(4)^T(30);
T(65) = T(51)*T(64);
T(66) = T(25)*T(65)-T(34);
T(67) = y(6)^T(30);
T(68) = T(60)*T(67);
T(69) = T(27)*T(68)-T(36);

end
