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

assert(length(T) >= 28);

T(1) = params(8)^(params(9)/(1+params(9)));
T(2) = 1/params(4);
T(3) = 1/params(9);
T(4) = exp(y(20))*y(24)^T(3);
T(5) = 1+T(3);
T(6) = exp(y(20))*y(24)^T(5)/T(5);
T(7) = y(27)^(-params(1));
T(8) = y(42)^(-params(1));
T(9) = 1-(params(5)/params(6)-params(3));
T(10) = y(14)^((1-params(8))*params(7));
T(11) = y(15)^((1-params(8))*params(7));
T(12) = (1+params(3))^params(1)*1/(1+(1+params(2))^0.25-1.0);
T(13) = (1+params(3))^(-params(1))*T(12);
T(14) = params(6)*(1-T(9)*T(13))/T(13);
T(15) = params(10)/(T(1)*(1-params(5)))^params(8);
T(16) = params(10)/(params(5)*T(1))^params(8);
T(17) = (1-params(5))/(params(10)*(params(6)*(1-params(5)))^T(14)*((1-params(5))*params(16))^((1-params(8))*params(7)));
T(18) = params(5)/(params(10)*(params(5)*params(6))^T(14)*(params(5)*params(16))^((1-params(8))*params(7)));
T(19) = exp(y(19))*(1-params(8))*params(5)*(1-params(8))*params(7)*params(15)/(1-params(8))/(params(5)*params(16))/params(16)^T(2);
T(20) = y(13)^T(2)*T(19);
T(21) = y(13)^(1+T(2))*T(19)/(1+T(2));
T(22) = exp(y(16))*T(17)*y(25)^params(8)*T(15);
T(23) = y(1)^T(14);
T(24) = T(22)*T(23);
T(25) = exp(y(18))*T(18)*y(26)^params(8)*T(16);
T(26) = y(2)^T(14);
T(27) = T(25)*T(26);
T(28) = (1-params(8))*params(7)/T(14);

end
