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

assert(length(T) >= 65);

T(1) = (1+params(19))*params(18)/(1+params(19)*params(18));
T(2) = (params(6)-1)/params(6);
T(3) = 1+1/params(19);
T(4) = 1/params(4);
T(5) = (y(78)/y(80))^params(21);
T(6) = (y(79)/y(80))^params(21);
T(7) = y(113)^(-params(1));
T(8) = exp(y(85))*y(109)^(1/params(19));
T(9) = exp(y(85))*y(109)^T(3)/T(3);
T(10) = y(65)-params(17)*y(1)-T(9);
T(11) = T(10)^params(5);
T(12) = y(15)^(1-params(5));
T(13) = exp(y(207))^(-params(1));
T(14) = params(2)*exp(y(87))*y(202)/y(120)*T(13);
T(15) = y(205)^2;
T(16) = T(14)*y(203)*y(200)*T(15);
T(17) = y(206)^2;
T(18) = T(14)*y(204)*y(201)*T(17);
T(19) = 1-T(1);
T(20) = 1-T(2);
T(21) = (1-params(7))^T(20);
T(22) = params(7)^T(20);
T(23) = y(118)*T(7)*T(19);
T(24) = T(22)*y(67)^T(2)+T(21)*y(66)^T(2);
T(25) = 1+params(13)/params(14)-exp(params(3));
T(26) = exp(params(3))^params(1)/params(2)-1+T(25);
T(27) = params(14)*T(26)/(1+params(16));
T(28) = params(15)*T(19)/(1+params(16));
T(29) = T(1)^(params(19)/(1+params(19)));
T(30) = params(20)/((1-params(13))*(1-params(7))*T(29))^T(1);
T(31) = params(20)/((1-params(13))*params(7)*T(29))^T(1);
T(32) = params(20)/(params(13)*T(29))^T(1);
T(33) = params(16)*(1-params(13))*(1-params(7))/params(20);
T(34) = params(16)*(1-params(13))*params(7)/params(20);
T(35) = params(13)*params(16)/params(20);
T(36) = exp(params(3))^(-T(27));
T(37) = (T(33)+(1-params(13))*(1-params(7))/params(20))/(T(36)*((1-params(13))*(1-params(7))*params(14)*exp(params(3)))^T(27)*((1-params(13))*(1-params(7))*params(32))^T(28));
T(38) = (T(34)+(1-params(13))*params(7)/params(20))/(T(36)*((1-params(13))*params(7)*params(14)*exp(params(3)))^T(27)*((1-params(13))*params(7)*params(32))^T(28));
T(39) = (T(35)+params(13)/params(20))/(T(36)*(params(13)*params(14)*exp(params(3)))^T(27)*(params(13)*params(32))^T(28));
T(40) = (1-params(13))^(-params(21));
T(41) = (1-(1-params(13)))^(-params(21));
T(42) = y(78)^(1+params(21))*T(40)+y(79)^(1+params(21))*T(41);
T(43) = exp(y(84))*params(15)/params(32)*T(19)/(params(8)*params(32)^T(4)*((1-params(13))*(1-params(17))-(T(29))^T(3)/T(3)));
T(44) = y(80)^T(4)*T(43);
T(45) = y(80)^(1+T(4))*T(43)/(1+T(4));
T(46) = y(114)*T(45);
T(47) = params(9)*T(26)/2;
T(48) = y(110)^T(1)*T(30);
T(49) = exp(y(129))^(-T(27));
T(50) = exp(y(81))*T(37)*T(49);
T(51) = (y(96)*y(4))^T(27);
T(52) = y(76)^T(28);
T(53) = y(111)^T(1)*T(31);
T(54) = exp(y(81))*T(38)*T(49);
T(55) = (y(97)*y(5))^T(27);
T(56) = T(54)*T(55);
T(57) = y(77)^T(28);
T(58) = y(112)^T(1)*T(32);
T(59) = exp(y(83))*T(39)*T(49);
T(60) = (y(98)*y(6))^T(27);
T(61) = y(79)^T(28);
T(62) = y(4)^T(27);
T(63) = T(52)*T(62)-T(33);
T(64) = y(6)^T(27);
T(65) = T(61)*T(64)-T(35);

end
