function T = static_resid_tt(T, y, x, params)
% function T = static_resid_tt(T, y, x, params)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%
% Output:
%   T         [#temp variables by 1]  double   vector of temporary terms
%

assert(length(T) >= 50);

T(1) = (1+params(3))^0.25-1.0;
T(2) = 1+params(8)/params(9)-exp(params(4));
T(3) = exp(params(4))^params(1)*1/(1+T(1));
T(4) = (1+params(13))*params(12)/(1+params(13)*params(12));
T(5) = params(9)*(T(1)+T(2))/(1+params(11));
T(6) = 1-T(4);
T(7) = params(10)*T(6)/(1+params(11));
T(8) = T(4)^(params(13)/(1+params(13)));
T(9) = params(14)/(T(8)*(1-params(8)))^T(4);
T(10) = params(14)/(params(8)*T(8))^T(4);
T(11) = params(11)*(1-params(8))/params(14);
T(12) = params(8)*params(11)/params(14);
T(13) = exp(params(4))^(-T(5));
T(14) = (T(11)+(1-params(8))/params(14))/(T(13)*((1-params(8))*params(9)*exp(params(4)))^T(5)*((1-params(8))*params(24))^T(7));
T(15) = (T(12)+params(8)/params(14))/(T(13)*(params(8)*params(9)*exp(params(4)))^T(5)*(params(8)*params(24))^T(7));
T(16) = y(10)^(1/params(5));
T(17) = (1-params(8))^(-params(15));
T(18) = (1-(1-params(8)))^(-params(15));
T(19) = y(8)^(1+params(15))*T(17)+y(9)^(1+params(15))*T(18);
T(20) = (y(8)/y(10))^params(15);
T(21) = T(6)*params(10)/params(24)/T(16)*exp(y(14));
T(22) = T(16)*T(21);
T(23) = (y(9)/y(10))^params(15);
T(24) = exp(y(15))*y(30)^(1/params(13));
T(25) = 1+1/params(13);
T(26) = exp(y(15))*y(30)^T(25)/T(25);
T(27) = 1+1/params(5);
T(28) = y(10)^T(27);
T(29) = y(36)^2;
T(30) = T(3)*exp(y(39))^(-params(1));
T(31) = (T(1)+T(2))*params(6)/2;
T(32) = y(31)^T(4);
T(33) = T(9)*T(32);
T(34) = exp(y(39))^(-T(5));
T(35) = exp(y(11))*T(14)*T(34);
T(36) = (y(22)*y(5))^T(5);
T(37) = y(8)^T(7);
T(38) = y(32)^T(4);
T(39) = T(10)*T(38);
T(40) = exp(y(13))*T(15)*T(34);
T(41) = (y(23)*y(6))^T(5);
T(42) = y(9)^T(7);
T(43) = T(32)*T(9)*y(2)/y(1);
T(44) = T(43)*(T(36)*T(37)-T(11));
T(45) = y(5)^T(5);
T(46) = T(37)*T(45)-T(11);
T(47) = T(38)*T(10)*y(3)/y(1);
T(48) = T(47)*(T(41)*T(42)-T(12));
T(49) = y(6)^T(5);
T(50) = T(42)*T(49)-T(12);

end
