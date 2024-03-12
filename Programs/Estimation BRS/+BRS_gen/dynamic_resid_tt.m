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
T(2) = (1+params(17))*params(16)/(1+params(17)*params(16));
T(3) = 1+1/params(17);
T(4) = 1/params(5);
T(5) = (y(35)/y(37))^params(19);
T(6) = (y(36)/y(37))^params(19);
T(7) = exp(y(42))*y(59)^(1/params(17));
T(8) = exp(y(42))*y(59)^T(3)/T(3);
T(9) = exp(y(44))*(y(27)-params(15)*y(1))-T(8);
T(10) = T(9)^params(6);
T(11) = y(12)^(1-params(6));
T(12) = (y(104)/y(62))^(-params(1));
T(13) = exp(y(109))^(-params(1));
T(14) = y(107)^2;
T(15) = y(108)^2;
T(16) = y(60)^T(2);
T(17) = y(61)^T(2);
T(18) = 1+params(11)/params(12)-exp(params(4));
T(19) = params(12)*(T(1)+T(18))/(1+params(14));
T(20) = params(13)*(1-T(2))/(1+params(14));
T(21) = T(2)^(params(17)/(1+params(17)));
T(22) = params(18)/((1-params(11))*T(21))^T(2);
T(23) = params(18)/(params(11)*T(21))^T(2);
T(24) = params(14)*(1-params(11))/params(18);
T(25) = params(11)*params(14)/params(18);
T(26) = exp(params(4))^(-T(19));
T(27) = (T(24)+(1-params(11))/params(18))/(T(26)*((1-params(11))*params(12)*exp(params(4)))^T(19)*((1-params(11))*params(28))^T(20));
T(28) = (T(25)+params(11)/params(18))/(T(26)*(params(11)*params(12)*exp(params(4)))^T(19)*(params(11)*params(28))^T(20));
T(29) = (1-params(11))^(-params(19));
T(30) = (1-(1-params(11)))^(-params(19));
T(31) = y(35)^(1+params(19))*T(29)+y(36)^(1+params(19))*T(30);
T(32) = exp(y(41))*params(13)/params(28)*(1-T(2))/(params(28)^T(4)*((1-params(11))*(1-params(15))-(T(21))^T(3)/T(3)));
T(33) = y(37)^T(4)*T(32);
T(34) = y(37)^(1+T(4))*T(32)/(1+T(4));
T(35) = y(63)*T(34);
T(36) = exp(y(95))*exp(params(4))^params(1)*1/(1+T(1));
T(37) = T(13)*T(12)*T(36)/exp(y(44));
T(38) = T(16)*T(22);
T(39) = exp(y(71))^(-T(19));
T(40) = exp(y(38))*T(27)*T(39);
T(41) = (y(49)*y(4))^T(19);
T(42) = y(35)^T(20);
T(43) = T(17)*T(23);
T(44) = exp(y(40))*T(28)*T(39);
T(45) = (y(50)*y(5))^T(19);
T(46) = y(36)^T(20);
T(47) = T(16)*y(27)/y(26)*T(22);
T(48) = T(47)*(T(41)*T(42)-T(24));
T(49) = y(4)^T(19);
T(50) = T(42)*T(49)-T(24);
T(51) = T(17)*y(28)/y(26)*T(23);
T(52) = T(51)*(T(45)*T(46)-T(25));
T(53) = y(5)^T(19);
T(54) = T(46)*T(53)-T(25);

end
