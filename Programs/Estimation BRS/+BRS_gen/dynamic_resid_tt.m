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

assert(length(T) >= 54);

T(1) = (1+params(3))^0.25-1.0;
T(2) = (1+params(15))*params(14)/(1+params(15)*params(14));
T(3) = 1+1/params(15);
T(4) = 1/params(5);
T(5) = (y(32)/y(34))^params(17);
T(6) = (y(33)/y(34))^params(17);
T(7) = exp(y(39))*y(54)^(1/params(15));
T(8) = exp(y(39))*y(54)^T(3)/T(3);
T(9) = exp(y(41))*(y(26)-params(13)*y(1))-T(8);
T(10) = T(9)^params(6);
T(11) = y(11)^(1-params(6));
T(12) = (y(96)/y(57))^(-params(1));
T(13) = exp(y(99))^(-params(1));
T(14) = y(98)^2;
T(15) = y(55)^T(2);
T(16) = y(56)^T(2);
T(17) = 1+params(9)/params(10)-exp(params(4));
T(18) = params(10)*(T(1)+T(17))/(1+params(12));
T(19) = params(11)*(1-T(2))/(1+params(12));
T(20) = T(2)^(params(15)/(1+params(15)));
T(21) = params(16)/((1-params(9))*T(20))^T(2);
T(22) = params(16)/(params(9)*T(20))^T(2);
T(23) = params(12)*(1-params(9))/params(16);
T(24) = params(9)*params(12)/params(16);
T(25) = exp(params(4))^(-T(18));
T(26) = (T(23)+(1-params(9))/params(16))/(T(25)*((1-params(9))*params(10)*exp(params(4)))^T(18)*((1-params(9))*params(26))^T(19));
T(27) = (T(24)+params(9)/params(16))/(T(25)*(params(9)*params(10)*exp(params(4)))^T(18)*(params(9)*params(26))^T(19));
T(28) = (1-params(9))^(-params(17));
T(29) = (1-(1-params(9)))^(-params(17));
T(30) = y(32)^(1+params(17))*T(28)+y(33)^(1+params(17))*T(29);
T(31) = exp(y(38))*params(11)/params(26)*(1-T(2))/(params(26)^T(4)*((1-params(9))*(1-params(13))-(T(20))^T(3)/T(3)));
T(32) = y(34)^T(4)*T(31);
T(33) = y(34)^(1+T(4))*T(31)/(1+T(4));
T(34) = y(58)*T(33);
T(35) = exp(y(88))*exp(params(4))^params(1)*1/(1+T(1));
T(36) = T(13)*T(12)*T(35)/exp(y(41));
T(37) = params(7)*(T(1)+T(17))/2;
T(38) = T(15)*T(21);
T(39) = exp(y(64))^(-T(18));
T(40) = exp(y(35))*T(26)*T(39);
T(41) = (y(46)*y(3))^T(18);
T(42) = y(32)^T(19);
T(43) = T(16)*T(22);
T(44) = exp(y(37))*T(27)*T(39);
T(45) = (y(47)*y(4))^T(18);
T(46) = y(33)^T(19);
T(47) = T(15)*y(26)/y(25)*T(21);
T(48) = T(47)*(T(41)*T(42)-T(23));
T(49) = y(3)^T(18);
T(50) = T(42)*T(49)-T(23);
T(51) = T(16)*y(27)/y(25)*T(22);
T(52) = T(51)*(T(45)*T(46)-T(24));
T(53) = y(4)^T(18);
T(54) = T(46)*T(53)-T(24);

end
