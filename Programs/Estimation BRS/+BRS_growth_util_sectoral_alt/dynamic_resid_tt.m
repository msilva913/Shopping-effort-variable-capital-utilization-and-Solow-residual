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

assert(length(T) >= 52);

T(1) = (1+params(3))^0.25-1.0;
T(2) = (1+params(13))*params(12)/(1+params(13)*params(12));
T(3) = y(32)^(1/params(5));
T(4) = (y(30)/y(32))^params(15);
T(5) = (y(31)/y(32))^params(15);
T(6) = exp(y(37))*y(52)^(1/params(13));
T(7) = 1+1/params(13);
T(8) = exp(y(37))*y(52)^T(7)/T(7);
T(9) = 1+1/params(5);
T(10) = y(32)^T(9);
T(11) = (y(93)/y(55))^(-params(1));
T(12) = exp(y(96))^(-params(1));
T(13) = y(95)^2;
T(14) = 1-T(2);
T(15) = y(53)^T(2);
T(16) = y(54)^T(2);
T(17) = 1+params(8)/params(9)-exp(params(4));
T(18) = params(9)*(T(1)+T(17))/(1+params(11));
T(19) = params(10)*T(14)/(1+params(11));
T(20) = T(2)^(params(13)/(1+params(13)));
T(21) = params(14)/((1-params(8))*T(20))^T(2);
T(22) = params(14)/(params(8)*T(20))^T(2);
T(23) = params(11)*(1-params(8))/params(14);
T(24) = params(8)*params(11)/params(14);
T(25) = exp(params(4))^(-T(18));
T(26) = (T(23)+(1-params(8))/params(14))/(T(25)*((1-params(8))*params(9)*exp(params(4)))^T(18)*((1-params(8))*params(24))^T(19));
T(27) = (T(24)+params(8)/params(14))/(T(25)*(params(8)*params(9)*exp(params(4)))^T(18)*(params(8)*params(24))^T(19));
T(28) = (1-params(8))^(-params(15));
T(29) = (1-(1-params(8)))^(-params(15));
T(30) = y(30)^(1+params(15))*T(28)+y(31)^(1+params(15))*T(29);
T(31) = exp(y(36))*params(10)/params(24)*T(14)/T(3);
T(32) = T(3)*T(31);
T(33) = exp(y(85))*exp(params(4))^params(1)*1/(1+T(1));
T(34) = T(12)*T(11)*T(33)/exp(y(39));
T(35) = params(6)*(T(1)+T(17))/2;
T(36) = T(15)*T(21);
T(37) = exp(y(61))^(-T(18));
T(38) = exp(y(33))*T(26)*T(37);
T(39) = (y(44)*y(2))^T(18);
T(40) = y(30)^T(19);
T(41) = T(16)*T(22);
T(42) = exp(y(35))*T(27)*T(37);
T(43) = (y(45)*y(3))^T(18);
T(44) = y(31)^T(19);
T(45) = T(15)*y(24)/y(23)*T(21);
T(46) = T(45)*(T(39)*T(40)-T(23));
T(47) = y(2)^T(18);
T(48) = T(40)*T(47)-T(23);
T(49) = T(16)*y(25)/y(23)*T(22);
T(50) = T(49)*(T(43)*T(44)-T(24));
T(51) = y(3)^T(18);
T(52) = T(44)*T(51)-T(24);

end
