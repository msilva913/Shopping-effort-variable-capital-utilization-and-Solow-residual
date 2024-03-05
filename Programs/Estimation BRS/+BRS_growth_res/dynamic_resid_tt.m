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
T(2) = (1+params(11))*params(10)/(1+params(11)*params(10));
T(3) = 1/params(5);
T(4) = exp(y(27))*y(31)^(1/params(11));
T(5) = 1+1/params(11);
T(6) = exp(y(27))*y(31)^T(5)/T(5);
T(7) = y(34)^(-params(1));
T(8) = y(52)^(-params(1));
T(9) = exp(y(54))^(-params(1));
T(10) = exp(params(4))^params(1)*1/(1+T(1));
T(11) = params(8)*(1-T(2))/(1+params(9));
T(12) = params(7)*(T(1)+1+params(6)/params(7)-exp(params(4)))/(1+params(9));
T(13) = T(2)^(params(11)/(1+params(11)));
T(14) = params(12)/((1-params(6))*T(13))^T(2);
T(15) = params(12)/(params(6)*T(13))^T(2);
T(16) = params(9)*(1-params(6))/params(12);
T(17) = params(6)*params(9)/params(12);
T(18) = exp(params(4))^(-T(12));
T(19) = (T(16)+(1-params(6))/params(12))/(T(18)*((1-params(6))*params(7)*exp(params(4)))^T(12)*((1-params(6))*params(19))^T(11));
T(20) = (T(17)+params(6)/params(12))/(T(18)*(params(6)*params(7)*exp(params(4)))^T(12)*(params(6)*params(19))^T(11));
T(21) = exp(y(26))*params(8)/params(19)*(1-T(2))/params(19)^T(3);
T(22) = y(20)^T(3)*T(21);
T(23) = y(20)^(1+T(3))*T(21)/(1+T(3));
T(24) = 1-(1+params(6)/params(7)-exp(params(4)));
T(25) = T(10)*(y(50)*(1-T(2))+y(53)*T(24));
T(26) = y(32)^T(2)*T(14);
T(27) = exp(y(36))^(-T(12));
T(28) = exp(y(23))*T(19)*T(27);
T(29) = y(1)^T(12);
T(30) = T(28)*T(29);
T(31) = y(21)^T(11);
T(32) = y(33)^T(2)*T(15);
T(33) = exp(y(25))*T(20)*T(27);
T(34) = y(2)^T(12);
T(35) = T(33)*T(34);
T(36) = y(22)^T(11);

end
