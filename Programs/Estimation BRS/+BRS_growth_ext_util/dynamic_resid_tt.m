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

assert(length(T) >= 43);

T(1) = (1+params(2))^0.25-1.0;
T(2) = params(10)^(params(11)/(1+params(11)));
T(3) = 1/params(4);
T(4) = exp(y(32))*y(43)^(1/params(11));
T(5) = 1+1/params(11);
T(6) = exp(y(32))*y(43)^T(5)/T(5);
T(7) = 1+T(3);
T(8) = exp(y(32))*y(10)^T(5)/T(5);
T(9) = (y(80)/y(46))^(-params(1));
T(10) = exp(y(83))^(-params(1));
T(11) = params(6)/2;
T(12) = y(44)^params(10);
T(13) = y(45)^params(10);
T(14) = (1-params(6)*(y(50)-params(7)/params(8)))^(-1);
T(15) = T(11)*(y(82)-params(7)/params(8))^2;
T(16) = y(74)*y(76)+y(81)*(1-y(78)+y(82)*params(6)*(y(82)-params(7)/params(8))-T(15));
T(17) = y(75)*y(77)+y(81)*(1-y(79)+y(82)*params(6)*(y(82)-params(7)/params(8))-T(15));
T(18) = y(28)^((1-params(10))*params(9));
T(19) = y(29)^((1-params(10))*params(9));
T(20) = 1+params(7)/params(8)-exp(params(3));
T(21) = params(12)/(T(2)*(1-params(7)))^params(10);
T(22) = params(12)/(params(7)*T(2))^params(10);
T(23) = params(12)*exp(params(3))^(-(params(8)*(T(1)+T(20))));
T(24) = (1-params(7))/(T(23)*((1-params(7))*params(8)*exp(params(3)))^(params(8)*(T(1)+T(20)))*((1-params(7))*params(20))^((1-params(10))*params(9)));
T(25) = params(7)/(T(23)*(params(7)*params(8)*exp(params(3)))^(params(8)*(T(1)+T(20)))*(params(7)*params(20))^((1-params(10))*params(9)));
T(26) = exp(y(31))*(1-params(10))*params(7)*(1-params(10))*params(9)*params(19)/(1-params(10))/(params(7)*params(20))/params(20)^T(3);
T(27) = y(27)^T(3)*T(26);
T(28) = y(27)^T(7)*T(26)/T(7);
T(29) = y(5)^T(7)*T(26)/T(7);
T(30) = exp(y(73))*exp(params(3))^params(1)*1/(1+T(1));
T(31) = T(10)*T(9)*T(30)/exp(y(33));
T(32) = T(16)*T(31);
T(33) = T(17)*T(31);
T(34) = params(5)*(T(1)+T(20))/2;
T(35) = exp(y(52))^(-(params(8)*(T(1)+T(20))));
T(36) = T(24)*T(12)*T(21)*T(35);
T(37) = (y(37)*y(3))^(params(8)*(T(1)+T(20)));
T(38) = T(36)*T(37);
T(39) = T(35)*exp(y(30))*T(25)*T(13)*T(22);
T(40) = (y(38)*y(4))^(params(8)*(T(1)+T(20)));
T(41) = T(39)*T(40);
T(42) = y(37)^(params(8)*(T(1)+T(20)));
T(43) = y(38)^(params(8)*(T(1)+T(20)));

end
