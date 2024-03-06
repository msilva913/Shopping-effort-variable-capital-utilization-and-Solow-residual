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

assert(length(T) >= 34);

T(1) = (1+params(3))^0.25-1.0;
T(2) = (1+params(11))*params(10)/(1+params(11)*params(10));
T(3) = 1+1/params(11);
T(4) = y(34)^(-params(1));
T(5) = exp(y(27))*y(31)^(1/params(11));
T(6) = exp(y(27))*y(31)^T(3)/T(3);
T(7) = y(52)^(-params(1));
T(8) = exp(y(54))^(-params(1));
T(9) = exp(params(4))^params(1)*1/(1+T(1));
T(10) = params(8)*(1-T(2))/(1+params(9));
T(11) = params(7)*(T(1)+1+params(6)/params(7)-exp(params(4)))/(1+params(9));
T(12) = T(2)^(params(11)/(1+params(11)));
T(13) = params(12)/((1-params(6))*T(12))^T(2);
T(14) = params(12)/(params(6)*T(12))^T(2);
T(15) = params(9)*(1-params(6))/params(12);
T(16) = params(6)*params(9)/params(12);
T(17) = exp(params(4))^(-T(11));
T(18) = (T(15)+(1-params(6))/params(12))/(T(17)*((1-params(6))*params(7)*exp(params(4)))^T(11)*((1-params(6))*params(19))^T(10));
T(19) = (T(16)+params(6)/params(12))/(T(17)*(params(6)*params(7)*exp(params(4)))^T(11)*(params(6)*params(19))^T(10));
T(20) = exp(y(26))*params(8)/params(19)*(1-T(2))*(1-params(6)-(T(12))^T(3)/T(3))^(-params(1))/params(19)^(1/params(5));
T(21) = y(20)^(1/params(5))*T(20);
T(22) = 1-(1+params(6)/params(7)-exp(params(4)));
T(23) = T(9)*(y(50)*(1-T(2))+y(53)*T(22));
T(24) = y(32)^T(2)*T(13);
T(25) = exp(y(36))^(-T(11));
T(26) = exp(y(23))*T(18)*T(25);
T(27) = y(1)^T(11);
T(28) = T(26)*T(27);
T(29) = y(21)^T(10);
T(30) = y(33)^T(2)*T(14);
T(31) = exp(y(25))*T(19)*T(25);
T(32) = y(2)^T(11);
T(33) = T(31)*T(32);
T(34) = y(22)^T(10);

end
