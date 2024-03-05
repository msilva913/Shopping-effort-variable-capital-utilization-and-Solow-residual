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

assert(length(T) >= 48);

T(1) = (1+params(2))^0.25-1.0;
T(2) = (1+params(11))*params(10)/(1+params(11)*params(10));
T(3) = y(30)^(1/params(4));
T(4) = exp(y(33))*y(44)^(1/params(11));
T(5) = 1+1/params(11);
T(6) = exp(y(33))*y(44)^T(5)/T(5);
T(7) = 1+1/params(4);
T(8) = y(30)^T(7);
T(9) = exp(y(33))*y(10)^T(5)/T(5);
T(10) = y(5)^T(7);
T(11) = (y(81)/y(47))^(-params(1));
T(12) = exp(y(84))^(-params(1));
T(13) = params(6)/2;
T(14) = 1-T(2);
T(15) = (1-params(6)*(y(51)-params(7)/params(8)))^(-1);
T(16) = T(13)*(y(83)-params(7)/params(8))^2;
T(17) = y(75)*y(77)+y(82)*(1-y(79)+y(83)*params(6)*(y(83)-params(7)/params(8))-T(16));
T(18) = y(76)*y(78)+y(82)*(1-y(80)+y(83)*params(6)*(y(83)-params(7)/params(8))-T(16));
T(19) = y(45)^T(2);
T(20) = y(46)^T(2);
T(21) = 1+params(7)/params(8)-exp(params(3));
T(22) = T(2)^(params(11)/(1+params(11)));
T(23) = params(12)/((1-params(7))*T(22))^T(2);
T(24) = params(12)/(params(7)*T(22))^T(2);
T(25) = params(12)*exp(params(3))^(-(params(8)*(T(1)+T(21))));
T(26) = (1-params(7))/(T(25)*((1-params(7))*params(8)*exp(params(3)))^(params(8)*(T(1)+T(21)))*((1-params(7))*params(21))^(params(9)*T(14)));
T(27) = params(7)/(T(25)*(params(7)*params(8)*exp(params(3)))^(params(8)*(T(1)+T(21)))*(params(7)*params(21))^(params(9)*T(14)));
T(28) = T(14)*params(7)*params(9)*T(14)*params(20)/T(14)/(params(7)*params(21));
T(29) = (1-params(7))^(-params(14));
T(30) = (1-(1-params(7)))^(-params(14));
T(31) = y(28)^(1+params(14))*T(29)+y(29)^(1+params(14))*T(30);
T(32) = exp(y(32))*T(28)/T(3);
T(33) = exp(y(74))*exp(params(3))^params(1)*1/(1+T(1));
T(34) = T(12)*T(11)*T(33)/exp(y(34));
T(35) = T(17)*T(34);
T(36) = T(18)*T(34);
T(37) = params(5)*(T(1)+T(21))/2;
T(38) = exp(y(53))^(-(params(8)*(T(1)+T(21))));
T(39) = T(26)*T(19)*T(23)*T(38);
T(40) = (y(38)*y(3))^(params(8)*(T(1)+T(21)));
T(41) = T(39)*T(40);
T(42) = y(28)^(params(9)*T(14));
T(43) = T(38)*exp(y(31))*T(27)*T(20)*T(24);
T(44) = (y(39)*y(4))^(params(8)*(T(1)+T(21)));
T(45) = T(43)*T(44);
T(46) = y(29)^(params(9)*T(14));
T(47) = y(38)^(params(8)*(T(1)+T(21)));
T(48) = y(39)^(params(8)*(T(1)+T(21)));

end
