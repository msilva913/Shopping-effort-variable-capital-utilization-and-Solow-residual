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

assert(length(T) >= 27);

T(1) = params(8)^(params(9)/(1+params(9)));
T(2) = 1/params(4);
T(3) = exp(y(26))*y(30)^(1/params(9));
T(4) = 1+1/params(9);
T(5) = exp(y(26))*y(30)^T(4)/T(4);
T(6) = y(33)^(-params(1));
T(7) = y(50)^(-params(1));
T(8) = 1-(params(5)/params(6)-params(3));
T(9) = y(20)^((1-params(8))*params(7));
T(10) = y(21)^((1-params(8))*params(7));
T(11) = (1+params(3))^params(1)*1/(1+(1+params(2))^0.25-1.0);
T(12) = (1+params(3))^(-params(1))*T(11);
T(13) = params(6)*(1-T(8)*T(12))/T(12);
T(14) = params(10)/(T(1)*(1-params(5)))^params(8);
T(15) = params(10)/(params(5)*T(1))^params(8);
T(16) = (1-params(5))/(params(10)*(params(6)*(1-params(5)))^T(13)*((1-params(5))*params(16))^((1-params(8))*params(7)));
T(17) = params(5)/(params(10)*(params(5)*params(6))^T(13)*(params(5)*params(16))^((1-params(8))*params(7)));
T(18) = exp(y(25))*(1-params(8))*params(5)*(1-params(8))*params(7)*params(15)/(1-params(8))/(params(5)*params(16))/params(16)^T(2);
T(19) = y(19)^T(2)*T(18);
T(20) = y(19)^(1+T(2))*T(18)/(1+T(2));
T(21) = exp(y(22))*T(16)*y(31)^params(8)*T(14);
T(22) = y(1)^T(13);
T(23) = T(21)*T(22);
T(24) = exp(y(24))*T(17)*y(32)^params(8)*T(15);
T(25) = y(2)^T(13);
T(26) = T(24)*T(25);
T(27) = (1-params(8))*params(7)/T(13);

end
