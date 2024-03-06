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

assert(length(T) >= 44);

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
T(14) = (T(11)+(1-params(8))/params(14))/(T(13)*((1-params(8))*params(9)*exp(params(4)))^T(5)*((1-params(8))*params(23))^T(7));
T(15) = (T(12)+params(8)/params(14))/(T(13)*(params(8)*params(9)*exp(params(4)))^T(5)*(params(8)*params(23))^T(7));
T(16) = y(7)^(1/params(5));
T(17) = T(6)*params(10)/params(23)/T(16)*exp(y(13));
T(18) = exp(y(14))*y(28)^(1/params(13));
T(19) = 1+1/params(13);
T(20) = exp(y(14))*y(28)^T(19)/T(19);
T(21) = 1+1/params(5);
T(22) = y(7)^T(21);
T(23) = y(34)^2;
T(24) = T(3)*exp(y(37))^(-params(1));
T(25) = (T(1)+T(2))*params(6)/2;
T(26) = y(29)^T(4);
T(27) = T(9)*T(26);
T(28) = exp(y(37))^(-T(5));
T(29) = exp(y(10))*T(14)*T(28);
T(30) = (y(20)*y(5))^T(5);
T(31) = y(8)^T(7);
T(32) = y(30)^T(4);
T(33) = T(10)*T(32);
T(34) = exp(y(12))*T(15)*T(28);
T(35) = (y(21)*y(6))^T(5);
T(36) = y(9)^T(7);
T(37) = T(26)*T(9)*y(2)/y(1);
T(38) = T(37)*(T(30)*T(31)-T(11));
T(39) = y(5)^T(5);
T(40) = T(31)*T(39)-T(11);
T(41) = T(32)*T(10)*y(3)/y(1);
T(42) = T(41)*(T(35)*T(36)-T(12));
T(43) = y(6)^T(5);
T(44) = T(36)*T(43)-T(12);

end
