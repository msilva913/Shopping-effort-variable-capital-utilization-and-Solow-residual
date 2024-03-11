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

assert(length(T) >= 46);

T(1) = (1+params(3))^0.25-1.0;
T(2) = 1+params(8)/params(9)-exp(params(4));
T(3) = exp(params(4))^params(1)*1/(1+T(1));
T(4) = (1+params(14))*params(13)/(1+params(14)*params(13));
T(5) = params(9)*(T(1)+T(2))/(1+params(11));
T(6) = params(10)*(1-T(4))/(1+params(11));
T(7) = T(4)^(params(14)/(1+params(14)));
T(8) = params(15)/(T(7)*(1-params(8)))^T(4);
T(9) = params(15)/(params(8)*T(7))^T(4);
T(10) = 1+1/params(14);
T(11) = params(11)*(1-params(8))/params(15);
T(12) = params(8)*params(11)/params(15);
T(13) = exp(params(4))^(-T(5));
T(14) = (T(11)+(1-params(8))/params(15))/(T(13)*((1-params(8))*params(9)*exp(params(4)))^T(5)*((1-params(8))*params(25))^T(6));
T(15) = (T(12)+params(8)/params(15))/(T(13)*(params(8)*params(9)*exp(params(4)))^T(5)*(params(8)*params(25))^T(6));
T(16) = (1-params(8))^(-params(16));
T(17) = (1-(1-params(8)))^(-params(16));
T(18) = y(8)^(1+params(16))*T(16)+y(9)^(1+params(16))*T(17);
T(19) = exp(y(15))*y(30)^T(10)/T(10);
T(20) = (y(8)/y(10))^params(16);
T(21) = (1-T(4))*params(10)/params(25)/(((1-params(8))*(1-params(12))-(T(7))^T(10)/T(10))*(1-params(25))^(-params(5)))*exp(y(14));
T(22) = (1-y(10))^(-params(5))*T(21);
T(23) = (y(9)/y(10))^params(16);
T(24) = exp(y(15))*y(30)^(1/params(14));
T(25) = y(36)^2;
T(26) = T(3)*exp(y(39))^(-params(1));
T(27) = (T(1)+T(2))*params(6)/2;
T(28) = y(31)^T(4);
T(29) = T(8)*T(28);
T(30) = exp(y(39))^(-T(5));
T(31) = exp(y(11))*T(14)*T(30);
T(32) = (y(22)*y(5))^T(5);
T(33) = y(8)^T(6);
T(34) = y(32)^T(4);
T(35) = T(9)*T(34);
T(36) = exp(y(13))*T(15)*T(30);
T(37) = (y(23)*y(6))^T(5);
T(38) = y(9)^T(6);
T(39) = T(28)*T(8)*y(2)/y(1);
T(40) = T(39)*(T(32)*T(33)-T(11));
T(41) = y(5)^T(5);
T(42) = T(33)*T(41)-T(11);
T(43) = T(34)*T(9)*y(3)/y(1);
T(44) = T(43)*(T(37)*T(38)-T(12));
T(45) = y(6)^T(5);
T(46) = T(38)*T(45)-T(12);

end
