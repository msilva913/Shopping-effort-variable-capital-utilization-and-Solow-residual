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

assert(length(T) >= 70);

T(1) = (1+params(19))*params(18)/(1+params(19)*params(18));
T(2) = (params(6)-1)/params(6);
T(3) = 1+1/params(19);
T(4) = 1/params(4);
T(5) = y(113)^(-params(1));
T(6) = y(80)^T(4);
T(7) = (y(78)/y(80))^params(21);
T(8) = (y(79)/y(80))^params(21);
T(9) = exp(y(85))*y(109)^(1/params(19));
T(10) = exp(y(85))*y(109)^T(3)/T(3);
T(11) = y(65)-params(17)*y(1)-T(10);
T(12) = T(11)^params(5);
T(13) = y(15)^(1-params(5));
T(14) = exp(y(207))^(-params(1));
T(15) = params(2)*exp(y(87))*y(202)/y(120)*T(14);
T(16) = y(205)^2;
T(17) = T(15)*y(203)*y(200)*T(16);
T(18) = y(206)^2;
T(19) = T(15)*y(204)*y(201)*T(18);
T(20) = 1-T(2);
T(21) = (1-params(7))^T(20);
T(22) = params(7)^T(20);
T(23) = T(22)*y(67)^T(2)+T(21)*y(66)^T(2);
T(24) = 1+params(13)/params(14)-exp(params(3));
T(25) = exp(params(3))^params(1)/params(2)-1+T(24);
T(26) = params(14)*T(25)/(1+params(16));
T(27) = params(15)*(1-T(1))/(1+params(16));
T(28) = T(1)^(params(19)/(1+params(19)));
T(29) = params(20)/((1-params(13))*(1-params(7))*T(28))^T(1);
T(30) = params(20)/((1-params(13))*params(7)*T(28))^T(1);
T(31) = params(20)/(params(13)*T(28))^T(1);
T(32) = params(16)*(1-params(13))*(1-params(7))/params(20);
T(33) = params(16)*(1-params(13))*params(7)/params(20);
T(34) = params(13)*params(16)/params(20);
T(35) = exp(params(3))^(-T(26));
T(36) = (T(32)+(1-params(13))*(1-params(7))/params(20))/(T(35)*((1-params(13))*(1-params(7))*params(14)*exp(params(3)))^T(26)*((1-params(13))*(1-params(7))*params(32))^T(27));
T(37) = (T(33)+(1-params(13))*params(7)/params(20))/(T(35)*((1-params(13))*params(7)*params(14)*exp(params(3)))^T(26)*((1-params(13))*params(7)*params(32))^T(27));
T(38) = (T(34)+params(13)/params(20))/(T(35)*(params(13)*params(14)*exp(params(3)))^T(26)*(params(13)*params(32))^T(27));
T(39) = params(15)/params(32)*(1-T(1))/(params(8)*params(32)^T(4)*((1-params(13))*(1-params(17))-(T(28))^T(3)/T(3)));
T(40) = (1-params(13))^(-params(21));
T(41) = (1-(1-params(13)))^(-params(21));
T(42) = y(78)^(1+params(21))*T(40)+y(79)^(1+params(21))*T(41);
T(43) = T(6)*exp(y(84))*T(5)*T(39);
T(44) = y(80)^(1+T(4))*exp(y(84))*T(39)/(1+T(4));
T(45) = y(114)*T(44);
T(46) = params(9)*T(25)/2;
T(47) = y(110)^T(1)*T(29);
T(48) = exp(y(129))^(-T(26));
T(49) = exp(y(81))*T(36)*T(48);
T(50) = (y(96)*y(4))^T(26);
T(51) = T(49)*T(50);
T(52) = y(76)^T(27);
T(53) = T(47)*(T(51)*T(52)-T(32));
T(54) = y(111)^T(1)*T(30);
T(55) = exp(y(81))*T(37)*T(48);
T(56) = (y(97)*y(5))^T(26);
T(57) = T(55)*T(56);
T(58) = y(77)^T(27);
T(59) = y(112)^T(1)*T(31);
T(60) = exp(y(83))*T(38)*T(48);
T(61) = (y(98)*y(6))^T(26);
T(62) = T(60)*T(61);
T(63) = y(79)^T(27);
T(64) = T(59)*(T(62)*T(63)-T(34));
T(65) = y(4)^T(26);
T(66) = T(49)*T(65);
T(67) = T(52)*T(66)-T(32);
T(68) = y(6)^T(26);
T(69) = T(60)*T(68);
T(70) = T(63)*T(69)-T(34);

end
