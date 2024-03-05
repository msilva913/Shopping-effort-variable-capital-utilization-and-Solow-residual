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

assert(length(T) >= 40);

T(1) = (1+params(3))^0.25-1.0;
T(2) = 1+params(8)/params(9)-exp(params(4));
T(3) = exp(params(4))^params(1)*1/(1+T(1));
T(4) = (1+params(12))*params(11)/(1+params(12)*params(11));
T(5) = 1-T(4);
T(6) = T(4)^(params(12)/(1+params(12)));
T(7) = params(13)/(T(6)*(1-params(8)))^T(4);
T(8) = params(13)/(params(8)*T(6))^T(4);
T(9) = params(13)*exp(params(4))^(-(params(9)*(T(1)+T(2))));
T(10) = (1-params(8))/(T(9)*((1-params(8))*params(9)*exp(params(4)))^(params(9)*(T(1)+T(2)))*((1-params(8))*params(23))^(params(10)*T(5)));
T(11) = params(8)/(T(9)*(params(8)*params(9)*exp(params(4)))^(params(9)*(T(1)+T(2)))*(params(8)*params(23))^(params(10)*T(5)));
T(12) = T(5)*params(8)*params(10)*T(5)*params(22)/T(5)/(params(8)*params(23));
T(13) = y(10)^(1/params(5));
T(14) = (1-params(8))^(-params(15));
T(15) = (1-(1-params(8)))^(-params(15));
T(16) = y(8)^(1+params(15))*T(14)+y(9)^(1+params(15))*T(15);
T(17) = T(12)/T(13)*exp(y(14));
T(18) = exp(y(15))*y(26)^(1/params(12));
T(19) = 1+1/params(12);
T(20) = exp(y(15))*y(26)^T(19)/T(19);
T(21) = 1+1/params(5);
T(22) = y(10)^T(21);
T(23) = exp(y(16))*y(2)-T(20)-T(17)*T(22)/T(21);
T(24) = (1-params(7)*(y(33)-params(8)/params(9)))^(-1);
T(25) = params(7)/2*(y(33)-params(8)/params(9))^2;
T(26) = T(3)*exp(y(35))^(-params(1));
T(27) = (T(1)+T(2))*params(6)/2;
T(28) = y(27)^T(4);
T(29) = exp(y(35))^(-(params(9)*(T(1)+T(2))));
T(30) = exp(y(11))*T(10)*T(7)*T(28)*T(29);
T(31) = (y(20)*y(5))^(params(9)*(T(1)+T(2)));
T(32) = T(30)*T(31);
T(33) = y(8)^(params(10)*T(5));
T(34) = y(28)^T(4);
T(35) = T(29)*exp(y(13))*T(11)*T(8)*T(34);
T(36) = (y(21)*y(6))^(params(9)*(T(1)+T(2)));
T(37) = T(35)*T(36);
T(38) = y(9)^(params(10)*T(5));
T(39) = y(20)^(params(9)*(T(1)+T(2)));
T(40) = y(21)^(params(9)*(T(1)+T(2)));

end
