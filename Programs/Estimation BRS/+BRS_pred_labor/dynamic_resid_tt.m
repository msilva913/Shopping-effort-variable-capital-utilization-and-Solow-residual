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

assert(length(T) >= 47);

T(1) = (1+params(3))^0.25-1.0;
T(2) = (1+params(13))*params(12)/(1+params(13)*params(12));
T(3) = y(31)^(1/params(5));
T(4) = exp(y(38))*y(53)^(1/params(13));
T(5) = 1+1/params(13);
T(6) = exp(y(38))*y(53)^T(5)/T(5);
T(7) = 1+1/params(5);
T(8) = y(31)^T(7);
T(9) = (y(97)/y(56))^(-params(1));
T(10) = exp(y(100))^(-params(1));
T(11) = y(99)^2;
T(12) = 1-T(2);
T(13) = y(54)^T(2);
T(14) = y(55)^T(2);
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
T(26) = params(10)/params(23)*T(12)/T(3);
T(27) = T(3)*exp(y(86))*T(26);
T(28) = exp(y(87))*exp(params(4))^params(1)*1/(1+T(1));
T(29) = T(10)*T(9)*T(28)/exp(y(40));
T(30) = params(6)*(T(1)+T(15))/2;
T(31) = T(13)*T(19);
T(32) = exp(y(62))^(-T(16));
T(33) = exp(y(34))*T(24)*T(32);
T(34) = (y(45)*y(2))^T(16);
T(35) = y(4)^T(17);
T(36) = T(14)*T(20);
T(37) = exp(y(36))*T(25)*T(32);
T(38) = (y(46)*y(3))^T(16);
T(39) = y(5)^T(17);
T(40) = T(13)*y(26)/y(25)*T(19);
T(41) = T(40)*(T(34)*T(35)-T(21));
T(42) = y(2)^T(16);
T(43) = T(35)*T(42)-T(21);
T(44) = T(14)*y(27)/y(25)*T(20);
T(45) = T(44)*(T(38)*T(39)-T(22));
T(46) = y(3)^T(16);
T(47) = T(39)*T(46)-T(22);

end
