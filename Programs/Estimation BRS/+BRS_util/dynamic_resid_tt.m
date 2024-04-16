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

assert(length(T) >= 30);

T(1) = params(8)^(params(9)/(1+params(9)));
T(2) = 1/params(4);
T(3) = exp(y(30))*y(34)^(1/params(9));
T(4) = 1+1/params(9);
T(5) = exp(y(30))*y(34)^T(4)/T(4);
T(6) = y(37)^(-params(1));
T(7) = y(64)^(-params(1));
T(8) = exp(y(66))^(-params(1));
T(9) = y(24)^((1-params(8))*params(7));
T(10) = y(25)^((1-params(8))*params(7));
T(11) = params(6)*(exp(params(3))^params(1)/params(2)-1+1+params(5)/params(6)-exp(params(3)));
T(12) = params(10)/(T(1)*(1-params(5)))^params(8);
T(13) = params(10)/(params(5)*T(1))^params(8);
T(14) = params(10)*exp(params(3))^(-T(11));
T(15) = (1-params(5))/(T(14)*((1-params(5))*exp(params(3))*params(6))^T(11)*((1-params(5))*params(17))^((1-params(8))*params(7)));
T(16) = params(5)/(T(14)*(params(5)*exp(params(3))*params(6))^T(11)*(params(5)*params(17))^((1-params(8))*params(7)));
T(17) = exp(y(29))*(1-params(8))*params(5)*(1-params(8))*params(7)*params(16)/(1-params(8))/(params(5)*params(17))/params(17)^T(2);
T(18) = y(23)^T(2)*T(17);
T(19) = y(23)^(1+T(2))*T(17)/(1+T(2));
T(20) = 1-(1+params(5)/params(6)-exp(params(3)));
T(21) = params(2)*((1-params(8))*y(62)+y(65)*T(20));
T(22) = y(35)^params(8)*T(12);
T(23) = exp(y(39))^(-T(11));
T(24) = exp(y(26))*T(15)*T(22)*T(23);
T(25) = y(1)^T(11);
T(26) = T(24)*T(25);
T(27) = y(36)^params(8)*T(13);
T(28) = T(23)*exp(y(28))*T(16)*T(27);
T(29) = y(2)^T(11);
T(30) = T(28)*T(29);

end
