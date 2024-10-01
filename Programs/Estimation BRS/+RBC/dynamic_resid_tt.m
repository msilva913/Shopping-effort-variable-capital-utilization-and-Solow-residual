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

T(1) = 1/params(4);
T(2) = y(33)^(-params(1));
T(3) = y(56)^(-params(1));
T(4) = exp(y(58))^(-params(1));
T(5) = exp(y(35))^(1-params(7));
T(6) = y(1)^(1-params(7));
T(7) = y(24)^params(7);
T(8) = T(6)*T(7);
T(9) = y(2)^(1-params(7));
T(10) = y(25)^params(7);
T(11) = T(9)*T(10);
T(12) = y(17)*y(17)/y(16)/T(8)+y(18)*y(18)/y(16)/T(11);
T(13) = params(6)*(exp(params(3))^params(1)/params(2)-1+1+params(5)/params(6)-exp(params(3)));
T(14) = exp(params(3))^(-T(13));
T(15) = exp(y(29))*params(5)*params(7)*params(12)/(params(5)*params(13))/params(13)^T(1);
T(16) = y(23)^T(1)*T(15);
T(17) = y(23)^(1+T(1))*T(15)/(1+T(1));
T(18) = 1-(1+params(5)/params(6)-exp(params(3)));
T(19) = exp(y(26))*(1-params(5))/(T(14)*(exp(params(3))*params(6)*(1-params(5)))^T(13)*((1-params(5))*params(13))^params(7));
T(20) = exp(y(35))^(-T(13));
T(21) = T(19)*T(20);
T(22) = y(1)^T(13);
T(23) = T(21)*T(22);
T(24) = exp(y(28))*params(5)/(T(14)*(params(5)*exp(params(3))*params(6))^T(13)*(params(5)*params(13))^params(7));
T(25) = T(20)*T(24);
T(26) = y(2)^T(13);
T(27) = T(25)*T(26);

end
