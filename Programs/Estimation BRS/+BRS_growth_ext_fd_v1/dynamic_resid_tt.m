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

T(1) = (1+params(2))^0.25-1.0;
T(2) = params(10)^(params(11)/(1+params(11)));
T(3) = 1/params(4);
T(4) = exp(y(25))*y(35)^(1/params(11));
T(5) = 1+1/params(11);
T(6) = exp(y(25))*y(35)^T(5)/T(5);
T(7) = exp(y(66))^(-params(1));
T(8) = params(6)/2;
T(9) = (1-params(6)*(y(41)-params(7)/params(8)))^(-1);
T(10) = T(8)*(y(65)-params(7)/params(8))^2;
T(11) = y(57)*y(59)+y(64)*(1-y(61)+y(65)*params(6)*(y(65)-params(7)/params(8))-T(10));
T(12) = y(58)*y(60)+y(64)*(1-y(62)+y(65)*params(6)*(y(65)-params(7)/params(8))-T(10));
T(13) = y(21)^((1-params(10))*params(9));
T(14) = y(22)^((1-params(10))*params(9));
T(15) = 1+params(7)/params(8)-exp(params(3));
T(16) = exp(params(3))^params(1)*1/(1+T(1));
T(17) = params(12)/(T(2)*(1-params(7)))^params(10);
T(18) = params(12)/(params(7)*T(2))^params(10);
T(19) = params(12)*exp(params(3))^(-(params(8)*(T(1)+T(15))));
T(20) = (1-params(7))/(T(19)*((1-params(7))*params(8)*exp(params(3)))^(params(8)*(T(1)+T(15)))*((1-params(7))*params(18))^((1-params(10))*params(9)));
T(21) = params(7)/(T(19)*(params(7)*params(8)*exp(params(3)))^(params(8)*(T(1)+T(15)))*(params(7)*params(18))^((1-params(10))*params(9)));
T(22) = exp(y(24))*(1-params(10))*params(7)*(1-params(10))*params(9)*params(17)/(1-params(10))/(params(7)*params(18))/params(18)^T(3);
T(23) = y(20)^T(3)*T(22);
T(24) = y(20)^(1+T(3))*T(22)/(1+T(3));
T(25) = (y(63)/y(38))^(-params(1))*T(16);
T(26) = T(7)*T(25);
T(27) = params(5)*(T(1)+T(15))/2;
T(28) = T(20)*y(36)^params(10)*T(17);
T(29) = exp(y(42))^(-(params(8)*(T(1)+T(15))));
T(30) = T(28)*T(29);
T(31) = (y(29)*y(2))^(params(8)*(T(1)+T(15)));
T(32) = T(30)*T(31);
T(33) = exp(y(23))*T(21)*y(37)^params(10)*T(18);
T(34) = T(29)*T(33);
T(35) = (y(30)*y(3))^(params(8)*(T(1)+T(15)));
T(36) = T(34)*T(35);

end
