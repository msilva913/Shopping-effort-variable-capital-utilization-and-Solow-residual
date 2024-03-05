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

assert(length(T) >= 37);

T(1) = (1+params(3))^0.25-1.0;
T(2) = params(10)/(1+params(11));
T(3) = 1/params(5);
T(4) = (y(28)/y(30))^params(13);
T(5) = (y(29)/y(30))^params(13);
T(6) = (y(84)/y(48))^(-params(1));
T(7) = exp(y(87))^(-params(1));
T(8) = y(86)^2;
T(9) = y(22)/y(21);
T(10) = y(23)/y(21);
T(11) = y(28)^T(2);
T(12) = y(29)^T(2);
T(13) = 1+params(8)/params(9)-exp(params(4));
T(14) = params(9)*(T(1)+T(13))/(1+params(11));
T(15) = exp(params(4))^(-T(14));
T(16) = (1-params(8)+params(11)*(1-params(8)))/(T(15)*(params(9)*exp(params(4))*(1-params(8)))^T(14)*((1-params(8))*params(20))^T(2));
T(17) = (params(8)+params(8)*params(11))/(T(15)*(params(8)*params(9)*exp(params(4)))^T(14)*(params(8)*params(20))^T(2));
T(18) = (1-params(8))^(-params(13));
T(19) = (1-(1-params(8)))^(-params(13));
T(20) = y(28)^(1+params(13))*T(18)+y(29)^(1+params(13))*T(19);
T(21) = exp(y(34))*params(10)/params(20)/params(20)^T(3);
T(22) = y(30)^T(3)*T(21);
T(23) = y(30)^(1+T(3))*T(21)/(1+T(3));
T(24) = exp(y(76))*exp(params(4))^params(1)*1/(1+T(1));
T(25) = T(7)*T(6)*T(24)/exp(y(35));
T(26) = params(6)*(T(1)+T(13))/2;
T(27) = exp(y(54))^(-T(14));
T(28) = exp(y(31))*T(16)*T(27);
T(29) = (y(40)*y(3))^T(14);
T(30) = exp(y(33))*T(17)*T(27);
T(31) = (y(41)*y(4))^T(14);
T(32) = T(9)*(T(11)*T(29)-params(11)*(1-params(8)));
T(33) = y(3)^T(14);
T(34) = T(11)*T(33)-params(11)*(1-params(8));
T(35) = T(10)*(T(12)*T(31)-params(8)*params(11));
T(36) = y(4)^T(14);
T(37) = T(12)*T(36)-params(8)*params(11);

end
