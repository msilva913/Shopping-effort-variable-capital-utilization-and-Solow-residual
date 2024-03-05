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

assert(length(T) >= 31);

T(1) = (1+params(2))^0.25-1.0;
T(2) = params(7)/params(8)-params(3);
T(3) = params(10)^(params(11)/(1+params(11)));
T(4) = 1/params(4);
T(5) = exp(y(27))*y(37)^(1/params(11));
T(6) = 1+1/params(11);
T(7) = exp(y(27))*y(37)^T(6)/T(6);
T(8) = params(6)/2;
T(9) = (1-params(6)*(y(43)-T(2)))^(-1);
T(10) = T(8)*(y(65)-T(2))^2;
T(11) = y(21)^((1-params(10))*params(9));
T(12) = y(22)^((1-params(10))*params(9));
T(13) = (1+params(3))^params(1)*1/(1+T(1));
T(14) = (1+params(3))^(-params(1))*T(13);
T(15) = params(8)*(1-T(14)*(1-T(2)))/T(14);
T(16) = params(12)/(T(3)*(1-params(7)))^params(10);
T(17) = params(12)/(params(7)*T(3))^params(10);
T(18) = (1-params(7))/(params(12)*(params(8)*(1-params(7)))^T(15)*((1-params(7))*params(18))^((1-params(10))*params(9)));
T(19) = params(7)/(params(12)*(params(7)*params(8))^T(15)*(params(7)*params(18))^((1-params(10))*params(9)));
T(20) = exp(y(26))*(1-params(10))*params(7)*(1-params(10))*params(9)*params(17)/(1-params(10))/(params(7)*params(18))/params(18)^T(4);
T(21) = y(20)^T(4)*T(20);
T(22) = y(20)^(1+T(4))*T(20)/(1+T(4));
T(23) = (y(63)/y(40))^(-params(1))*T(13);
T(24) = params(5)*(T(1)+T(2))/2;
T(25) = exp(y(23))*T(18)*y(38)^params(10)*T(16);
T(26) = (y(31)*y(2))^T(15);
T(27) = T(25)*T(26);
T(28) = exp(y(25))*T(19)*y(39)^params(10)*T(17);
T(29) = (y(32)*y(3))^T(15);
T(30) = T(28)*T(29);
T(31) = (1-params(10))*params(9)/T(15);

end
