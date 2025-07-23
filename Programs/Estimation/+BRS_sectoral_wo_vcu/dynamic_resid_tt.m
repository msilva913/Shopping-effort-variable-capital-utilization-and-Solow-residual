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

T(1) = (params(5)-1)/params(5);
T(2) = (1-params(14))*params(11)/(1+params(12));
T(3) = params(14)^(params(15)/(1+params(15)));
T(4) = 1/params(4);
T(5) = (y(49)/y(51))^params(17);
T(6) = (y(50)/y(51))^params(17);
T(7) = params(6)*y(80)^(-params(5));
T(8) = exp(y(57))*y(74)^(1/params(15));
T(9) = 1+1/params(15);
T(10) = exp(y(57))*y(74)^T(9)/T(9);
T(11) = params(8)/2;
T(12) = exp(y(94));
T(13) = exp(y(139))^(-params(1));
T(14) = params(2)*exp(y(59))*y(132)/y(82)*T(13);
T(15) = y(136)^2;
T(16) = T(14)*y(133)*y(129)*T(15);
T(17) = y(137)^2;
T(18) = T(14)*y(134)*y(130)*T(17);
T(19) = y(138)^2;
T(20) = T(14)*y(135)*y(131)*T(19);
T(21) = T(12)^(1-params(11));
T(22) = y(5)^(1-params(11));
T(23) = y(47)^params(11);
T(24) = T(22)*T(23);
T(25) = y(6)^(1-params(11));
T(26) = y(48)^params(11);
T(27) = T(25)*T(26);
T(28) = y(38)/y(33);
T(29) = y(7)^(1-params(11));
T(30) = y(50)^params(11);
T(31) = T(29)*T(30);
T(32) = y(35)*y(35)/y(33)/T(24)+y(36)*y(36)/y(33)/T(27)+y(38)*T(28)/T(31);
T(33) = (1-params(6))*y(79)^(-params(5));
T(34) = params(6)^(1-T(1));
T(35) = (1-params(6))^(1-T(1));
T(36) = T(34)*y(36)^T(1)+T(35)*y(35)^T(1);
T(37) = y(47)^T(2);
T(38) = y(48)^T(2);
T(39) = y(50)^T(2);
T(40) = params(10)*(exp(params(3))^params(1)/params(2)-1+1+params(9)/params(10)-exp(params(3)))/(1+params(12));
T(41) = params(16)/(T(3)*(1-params(6))*(1-params(9)))^params(14);
T(42) = params(16)/(T(3)*params(6)*(1-params(9)))^params(14);
T(43) = params(16)/(params(9)*T(3))^params(14);
T(44) = params(12)*(1-params(6))*(1-params(9))/params(16);
T(45) = params(12)*params(6)*(1-params(9))/params(16);
T(46) = params(9)*params(12)/params(16);
T(47) = exp(params(3))^(-T(40));
T(48) = (T(44)+(1-params(6))*(1-params(9))/params(16))/(T(47)*((1-params(6))*(1-params(9))*params(10)*exp(params(3)))^T(40)*((1-params(6))*(1-params(9))*params(28))^T(2));
T(49) = (T(45)+params(6)*(1-params(9))/params(16))/(T(47)*(params(6)*(1-params(9))*params(10)*exp(params(3)))^T(40)*(params(6)*(1-params(9))*params(28))^T(2));
T(50) = (T(46)+params(9)/params(16))/(T(47)*(params(9)*params(10)*exp(params(3)))^T(40)*(params(9)*params(28))^T(2));
T(51) = (1-params(9))^(-params(17));
T(52) = (1-(1-params(9)))^(-params(17));
T(53) = y(49)^(1+params(17))*T(51)+y(50)^(1+params(17))*T(52);
T(54) = exp(y(56))*(1-params(14))*params(11)/params(28)/(params(28)^T(4)*params(7));
T(55) = y(51)^T(4)*T(54);
T(56) = y(51)^(1+T(4))*T(54)/(1+T(4));
T(57) = 1-(1+params(9)/params(10)-exp(params(3)));
T(58) = y(75)^params(14)*T(41);
T(59) = T(12)^(-T(40));
T(60) = exp(y(52))*T(48)*T(59);
T(61) = y(5)^T(40);
T(62) = T(60)*T(61);
T(63) = y(76)^params(14)*T(42);
T(64) = exp(y(52))*T(49)*T(59);
T(65) = y(6)^T(40);
T(66) = T(64)*T(65);
T(67) = y(77)^params(14)*T(43);
T(68) = exp(y(54))*T(50)*T(59);
T(69) = y(7)^T(40);
T(70) = T(68)*T(69);

end
