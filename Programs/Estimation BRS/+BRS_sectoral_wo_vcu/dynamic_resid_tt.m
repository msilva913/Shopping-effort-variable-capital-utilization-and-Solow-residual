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

assert(length(T) >= 62);

T(1) = (params(6)-1)/params(6);
T(2) = (1-params(16))*params(13)/(1+params(14));
T(3) = params(16)^(params(17)/(1+params(17)));
T(4) = 1+1/params(17);
T(5) = 1/params(4);
T(6) = (y(80)/y(82))^params(19);
T(7) = (y(81)/y(82))^params(19);
T(8) = params(7)*y(111)^(-params(6));
T(9) = exp(y(87))*y(104)^(1/params(17));
T(10) = exp(y(87))*y(104)^T(4)/T(4);
T(11) = y(66)-params(15)*y(1)-T(10);
T(12) = T(11)^params(5);
T(13) = y(16)^(1-params(5));
T(14) = params(9)/2;
T(15) = exp(y(124));
T(16) = exp(y(199))^(-params(1));
T(17) = params(2)*exp(y(89))*y(192)/y(113)*T(16);
T(18) = y(196)^2;
T(19) = T(17)*y(193)*y(189)*T(18);
T(20) = y(197)^2;
T(21) = T(17)*y(194)*y(190)*T(20);
T(22) = y(198)^2;
T(23) = T(17)*y(195)*y(191)*T(22);
T(24) = (1-params(7))*y(110)^(-params(6));
T(25) = params(7)^(1-T(1));
T(26) = (1-params(7))^(1-T(1));
T(27) = T(25)*y(68)^T(1)+T(26)*y(67)^T(1);
T(28) = y(78)^T(2);
T(29) = y(79)^T(2);
T(30) = y(81)^T(2);
T(31) = params(12)*(exp(params(3))^params(1)/params(2)-1+1+params(11)/params(12)-exp(params(3)))/(1+params(14));
T(32) = params(18)/(T(3)*(1-params(7))*(1-params(11)))^params(16);
T(33) = params(18)/(T(3)*params(7)*(1-params(11)))^params(16);
T(34) = params(18)/(params(11)*T(3))^params(16);
T(35) = params(14)*(1-params(7))*(1-params(11))/params(18);
T(36) = params(14)*params(7)*(1-params(11))/params(18);
T(37) = params(11)*params(14)/params(18);
T(38) = exp(params(3))^(-T(31));
T(39) = (T(35)+(1-params(7))*(1-params(11))/params(18))/(T(38)*((1-params(7))*(1-params(11))*params(12)*exp(params(3)))^T(31)*((1-params(7))*(1-params(11))*params(30))^T(2));
T(40) = (T(36)+params(7)*(1-params(11))/params(18))/(T(38)*(params(7)*(1-params(11))*params(12)*exp(params(3)))^T(31)*(params(7)*(1-params(11))*params(30))^T(2));
T(41) = (T(37)+params(11)/params(18))/(T(38)*(params(11)*params(12)*exp(params(3)))^T(31)*(params(11)*params(30))^T(2));
T(42) = (1-params(11))^(-params(19));
T(43) = (1-(1-params(11)))^(-params(19));
T(44) = y(80)^(1+params(19))*T(42)+y(81)^(1+params(19))*T(43);
T(45) = exp(y(86))*(1-params(16))*params(13)/params(30)/(params(8)*params(30)^T(5)*((1-params(11))*(1-params(15))-(T(3))^T(4)/T(4)));
T(46) = y(82)^T(5)*T(45);
T(47) = y(82)^(1+T(5))*T(45)/(1+T(5));
T(48) = y(109)*T(47);
T(49) = 1-(1+params(11)/params(12)-exp(params(3)));
T(50) = y(105)^params(16)*T(32);
T(51) = T(15)^(-T(31));
T(52) = exp(y(83))*T(39)*T(51);
T(53) = y(5)^T(31);
T(54) = T(52)*T(53);
T(55) = y(106)^params(16)*T(33);
T(56) = exp(y(83))*T(40)*T(51);
T(57) = y(6)^T(31);
T(58) = T(56)*T(57);
T(59) = y(107)^params(16)*T(34);
T(60) = exp(y(85))*T(41)*T(51);
T(61) = y(7)^T(31);
T(62) = T(60)*T(61);

end
