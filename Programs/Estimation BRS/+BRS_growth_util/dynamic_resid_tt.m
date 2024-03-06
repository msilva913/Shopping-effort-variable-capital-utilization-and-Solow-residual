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

assert(length(T) >= 46);

T(1) = (1+params(3))^0.25-1.0;
T(2) = (1+params(13))*params(12)/(1+params(13)*params(12));
T(3) = y(29)^(1/params(5));
T(4) = exp(y(36))*y(50)^(1/params(13));
T(5) = 1+1/params(13);
T(6) = exp(y(36))*y(50)^T(5)/T(5);
T(7) = 1+1/params(5);
T(8) = y(29)^T(7);
T(9) = (y(91)/y(53))^(-params(1));
T(10) = exp(y(94))^(-params(1));
T(11) = y(93)^2;
T(12) = 1-T(2);
T(13) = y(51)^T(2);
T(14) = y(52)^T(2);
T(15) = 1+params(8)/params(9)-exp(params(4));
T(16) = params(9)*(T(1)+T(15))/(1+params(11));
T(17) = params(10)*T(12)/(1+params(11));
T(18) = T(2)^(params(13)/(1+params(13)));
T(19) = params(14)/((1-params(8))*T(18))^T(2);
T(20) = params(14)/(params(8)*T(18))^T(2);
T(21) = params(11)*(1-params(8))/params(14);
T(22) = params(8)*params(11)/params(14);
T(23) = exp(params(4))^(-T(16));
T(24) = (T(21)+(1-params(8))/params(14))/(T(23)*((1-params(8))*params(9)*exp(params(4)))^T(16)*((1-params(8))*params(23))^T(17));
T(25) = (T(22)+params(8)/params(14))/(T(23)*(params(8)*params(9)*exp(params(4)))^T(16)*(params(8)*params(23))^T(17));
T(26) = exp(y(35))*params(10)/params(23)*T(12)/T(3);
T(27) = exp(y(83))*exp(params(4))^params(1)*1/(1+T(1));
T(28) = T(10)*T(9)*T(27)/exp(y(38));
T(29) = params(6)*(T(1)+T(15))/2;
T(30) = T(13)*T(19);
T(31) = exp(y(59))^(-T(16));
T(32) = exp(y(32))*T(24)*T(31);
T(33) = (y(42)*y(2))^T(16);
T(34) = y(30)^T(17);
T(35) = T(14)*T(20);
T(36) = exp(y(34))*T(25)*T(31);
T(37) = (y(43)*y(3))^T(16);
T(38) = y(31)^T(17);
T(39) = T(13)*y(24)/y(23)*T(19);
T(40) = T(39)*(T(33)*T(34)-T(21));
T(41) = y(2)^T(16);
T(42) = T(34)*T(41)-T(21);
T(43) = T(14)*y(25)/y(23)*T(20);
T(44) = T(43)*(T(37)*T(38)-T(22));
T(45) = y(3)^T(16);
T(46) = T(38)*T(45)-T(22);

end
