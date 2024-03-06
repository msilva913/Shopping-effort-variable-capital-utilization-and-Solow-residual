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

assert(length(T) >= 38);

T(1) = (1+params(2))^0.25-1.0;
T(2) = params(10)^(params(11)/(1+params(11)));
T(3) = 1/params(4);
T(4) = exp(y(28))*y(39)^(1/params(11));
T(5) = 1+1/params(11);
T(6) = exp(y(28))*y(39)^T(5)/T(5);
T(7) = (y(72)/y(42))^(-params(1));
T(8) = exp(y(75))^(-params(1));
T(9) = params(6)/2;
T(10) = (1-params(6)*(y(45)-params(7)/params(8)))^(-1);
T(11) = T(9)*(y(74)-params(7)/params(8))^2;
T(12) = y(66)*y(68)+y(73)*(1-y(70)+y(74)*params(6)*(y(74)-params(7)/params(8))-T(11));
T(13) = y(67)*y(69)+y(73)*(1-y(71)+y(74)*params(6)*(y(74)-params(7)/params(8))-T(11));
T(14) = y(24)^((1-params(10))*params(9));
T(15) = y(25)^((1-params(10))*params(9));
T(16) = 1+params(7)/params(8)-exp(params(3));
T(17) = params(12)/(T(2)*(1-params(7)))^params(10);
T(18) = params(12)/(params(7)*T(2))^params(10);
T(19) = params(12)*exp(params(3))^(-(params(8)*(T(1)+T(16))));
T(20) = (1-params(7))/(T(19)*((1-params(7))*params(8)*exp(params(3)))^(params(8)*(T(1)+T(16)))*((1-params(7))*params(19))^((1-params(10))*params(9)));
T(21) = params(7)/(T(19)*(params(7)*params(8)*exp(params(3)))^(params(8)*(T(1)+T(16)))*(params(7)*params(19))^((1-params(10))*params(9)));
T(22) = exp(y(27))*(1-params(10))*params(7)*(1-params(10))*params(9)*params(18)/(1-params(10))/(params(7)*params(19))/params(19)^T(3);
T(23) = y(23)^T(3)*T(22);
T(24) = y(23)^(1+T(3))*T(22)/(1+T(3));
T(25) = exp(y(65))*exp(params(3))^params(1)*1/(1+T(1));
T(26) = T(8)*T(7)*T(25)/exp(y(29));
T(27) = T(12)*T(26);
T(28) = T(13)*T(26);
T(29) = params(5)*(T(1)+T(16))/2;
T(30) = T(20)*y(40)^params(10)*T(17);
T(31) = exp(y(46))^(-(params(8)*(T(1)+T(16))));
T(32) = T(30)*T(31);
T(33) = (y(33)*y(2))^(params(8)*(T(1)+T(16)));
T(34) = T(32)*T(33);
T(35) = exp(y(26))*T(21)*y(41)^params(10)*T(18);
T(36) = T(31)*T(35);
T(37) = (y(34)*y(3))^(params(8)*(T(1)+T(16)));
T(38) = T(36)*T(37);

end
