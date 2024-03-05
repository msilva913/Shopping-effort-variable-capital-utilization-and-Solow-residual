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

assert(length(T) >= 36);

T(1) = (1+params(3))^0.25-1.0;
T(2) = (1+params(12))*params(11)/(1+params(12)*params(11));
T(3) = y(25)^(1/params(5));
T(4) = exp(y(32))*y(43)^(1/params(12));
T(5) = 1+1/params(12);
T(6) = exp(y(32))*y(43)^T(5)/T(5);
T(7) = 1+1/params(5);
T(8) = y(25)^T(7);
T(9) = exp(y(79))^(-params(1));
T(10) = 1-T(2);
T(11) = 1+params(8)/params(9)-exp(params(4));
T(12) = exp(params(4))^params(1)*1/(1+T(1));
T(13) = T(2)^(params(12)/(1+params(12)));
T(14) = params(13)/((1-params(8))*T(13))^T(2);
T(15) = params(13)/(params(8)*T(13))^T(2);
T(16) = params(13)*exp(params(4))^(-(params(9)*(T(1)+T(11))));
T(17) = (1-params(8))/(T(16)*((1-params(8))*params(9)*exp(params(4)))^(params(9)*(T(1)+T(11)))*((1-params(8))*params(21))^(params(10)*T(10)));
T(18) = params(8)/(T(16)*(params(8)*params(9)*exp(params(4)))^(params(9)*(T(1)+T(11)))*(params(8)*params(21))^(params(10)*T(10)));
T(19) = T(10)*params(8)*params(10)*T(10)*params(20)/T(10)/(params(8)*params(21));
T(20) = exp(y(31))*T(19)/T(3);
T(21) = (y(77)/y(46))^(-params(1))*T(12);
T(22) = T(9)*T(21);
T(23) = params(6)*(T(1)+T(11))/2;
T(24) = exp(y(33))*(T(11)+(y(37)-1)*(T(1)+T(11))+(y(37)-1)^2*T(23));
T(25) = exp(y(33))*(T(11)+(y(38)-1)*(T(1)+T(11))+(y(38)-1)^2*T(23));
T(26) = exp(y(28))*T(17)*y(44)^T(2)*T(14);
T(27) = exp(y(50))^(-(params(9)*(T(1)+T(11))));
T(28) = T(26)*T(27);
T(29) = (y(37)*y(1))^(params(9)*(T(1)+T(11)));
T(30) = T(28)*T(29);
T(31) = y(26)^(params(10)*T(10));
T(32) = exp(y(30))*T(18)*y(45)^T(2)*T(15);
T(33) = T(27)*T(32);
T(34) = (y(38)*y(2))^(params(9)*(T(1)+T(11)));
T(35) = T(33)*T(34);
T(36) = y(27)^(params(10)*T(10));

end
