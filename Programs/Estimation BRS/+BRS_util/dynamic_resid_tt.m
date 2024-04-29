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

T(1) = params(8)^(params(9)/(1+params(9)));
T(2) = 1/params(4);
T(3) = exp(y(33))*y(37)^(1/params(9));
T(4) = 1+1/params(9);
T(5) = exp(y(33))*y(37)^T(4)/T(4);
T(6) = y(40)^(-params(1));
T(7) = y(70)^(-params(1));
T(8) = exp(y(72))^(-params(1));
T(9) = y(1)^(1-params(7));
T(10) = y(27)^params(7);
T(11) = T(9)*T(10);
T(12) = y(2)^(1-params(7));
T(13) = y(28)^params(7);
T(14) = T(12)*T(13);
T(15) = y(27)^((1-params(8))*params(7));
T(16) = y(28)^((1-params(8))*params(7));
T(17) = params(6)*(exp(params(3))^params(1)/params(2)-1+1+params(5)/params(6)-exp(params(3)));
T(18) = params(10)/(T(1)*(1-params(5)))^params(8);
T(19) = params(10)/(params(5)*T(1))^params(8);
T(20) = params(10)*exp(params(3))^(-T(17));
T(21) = (1-params(5))/(T(20)*((1-params(5))*exp(params(3))*params(6))^T(17)*((1-params(5))*params(17))^((1-params(8))*params(7)));
T(22) = params(5)/(T(20)*(params(5)*exp(params(3))*params(6))^T(17)*(params(5)*params(17))^((1-params(8))*params(7)));
T(23) = exp(y(32))*(1-params(8))*params(5)*(1-params(8))*params(7)*params(16)/(1-params(8))/(params(5)*params(17))/params(17)^T(2);
T(24) = y(26)^T(2)*T(23);
T(25) = y(26)^(1+T(2))*T(23)/(1+T(2));
T(26) = 1-(1+params(5)/params(6)-exp(params(3)));
T(27) = params(2)*((1-params(8))*y(68)+y(71)*T(26));
T(28) = y(38)^params(8)*T(18);
T(29) = exp(y(42))^(-T(17));
T(30) = exp(y(29))*T(21)*T(28)*T(29);
T(31) = y(1)^T(17);
T(32) = T(30)*T(31);
T(33) = y(39)^params(8)*T(19);
T(34) = T(29)*exp(y(31))*T(22)*T(33);
T(35) = y(2)^T(17);
T(36) = T(34)*T(35);

end
