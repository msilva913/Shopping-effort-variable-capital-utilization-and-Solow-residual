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

T(1) = (params(6)-1)/params(6);
T(2) = (1-params(20))*params(17)/(1+params(18));
T(3) = params(20)^(params(21)/(1+params(21)));
T(4) = 1+1/params(21);
T(5) = 1/params(4);
T(6) = (y(80)/y(82))^params(23);
T(7) = (y(81)/y(82))^params(23);
T(8) = params(7)*y(120)^(-params(6));
T(9) = exp(y(87))*y(113)^(1/params(21));
T(10) = exp(y(87))*y(113)^T(4)/T(4);
T(11) = y(66)-params(19)*y(1)-T(10);
T(12) = T(11)^params(5);
T(13) = y(16)^(1-params(5));
T(14) = exp(y(133));
T(15) = exp(y(214))^(-params(1));
T(16) = params(2)*exp(y(89))*y(207)/y(122)*T(15);
T(17) = y(211)^2;
T(18) = T(16)*y(208)*y(204)*T(17);
T(19) = y(212)^2;
T(20) = T(16)*y(209)*y(205)*T(19);
T(21) = y(213)^2;
T(22) = T(16)*y(210)*y(206)*T(21);
T(23) = (1-params(7))*y(119)^(-params(6));
T(24) = params(7)^(1-T(1));
T(25) = (1-params(7))^(1-T(1));
T(26) = T(24)*y(68)^T(1)+T(25)*y(67)^T(1);
T(27) = y(78)^T(2);
T(28) = y(79)^T(2);
T(29) = y(81)^T(2);
T(30) = 1+params(15)/params(16)-exp(params(3));
T(31) = exp(params(3))^params(1)/params(2)-1+T(30);
T(32) = params(16)*T(31)/(1+params(18));
T(33) = params(22)/(T(3)*(1-params(7))*(1-params(15)))^params(20);
T(34) = params(22)/(T(3)*params(7)*(1-params(15)))^params(20);
T(35) = params(22)/(params(15)*T(3))^params(20);
T(36) = params(18)*(1-params(7))*(1-params(15))/params(22);
T(37) = params(18)*params(7)*(1-params(15))/params(22);
T(38) = params(15)*params(18)/params(22);
T(39) = exp(params(3))^(-T(32));
T(40) = (T(36)+(1-params(7))*(1-params(15))/params(22))/(T(39)*((1-params(7))*(1-params(15))*params(16)*exp(params(3)))^T(32)*((1-params(7))*(1-params(15))*params(34))^T(2));
T(41) = (T(37)+params(7)*(1-params(15))/params(22))/(T(39)*(params(7)*(1-params(15))*params(16)*exp(params(3)))^T(32)*(params(7)*(1-params(15))*params(34))^T(2));
T(42) = (T(38)+params(15)/params(22))/(T(39)*(params(15)*params(16)*exp(params(3)))^T(32)*(params(15)*params(34))^T(2));
T(43) = (1-params(15))^(-params(23));
T(44) = (1-(1-params(15)))^(-params(23));
T(45) = y(80)^(1+params(23))*T(43)+y(81)^(1+params(23))*T(44);
T(46) = exp(y(86))*(1-params(20))*params(17)/params(34)/(params(8)*params(34)^T(5)*((1-params(15))*(1-params(19))-(T(3))^T(4)/T(4)));
T(47) = y(82)^T(5)*T(46);
T(48) = y(82)^(1+T(5))*T(46)/(1+T(5));
T(49) = y(118)*T(48);
T(50) = y(114)^params(20)*T(33);
T(51) = T(14)^(-T(32));
T(52) = exp(y(83))*T(40)*T(51);
T(53) = (y(98)*y(5))^T(32);
T(54) = T(52)*T(53);
T(55) = T(50)*(T(27)*T(54)-T(36));
T(56) = y(115)^params(20)*T(34);
T(57) = exp(y(83))*T(41)*T(51);
T(58) = (y(99)*y(6))^T(32);
T(59) = T(57)*T(58);
T(60) = y(116)^params(20)*T(35);
T(61) = exp(y(85))*T(42)*T(51);
T(62) = (y(100)*y(7))^T(32);
T(63) = T(61)*T(62);
T(64) = T(60)*(T(29)*T(63)-T(38));
T(65) = y(5)^T(32);
T(66) = T(52)*T(65);
T(67) = T(27)*T(66)-T(36);
T(68) = y(7)^T(32);
T(69) = T(61)*T(68);
T(70) = T(29)*T(69)-T(38);

end
