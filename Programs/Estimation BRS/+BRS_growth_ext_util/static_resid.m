function residual = static_resid(T, y, x, params, T_flag)
% function residual = static_resid(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = BRS_growth_ext_util.static_resid_tt(T, y, x, params);
end
residual = zeros(52, 1);
lhs = T(12);
rhs = (1-params(10))*exp(y(13))*y(16);
residual(1) = lhs - rhs;
lhs = T(13);
rhs = params(10)*exp(y(13))*y(2)/y(24);
residual(2) = lhs - rhs;
lhs = T(13);
rhs = params(10)*exp(y(13))*y(28)*y(3)/y(25);
residual(3) = lhs - rhs;
lhs = y(26);
rhs = T(17)-params(13)*y(27);
residual(4) = lhs - rhs;
lhs = y(27);
rhs = T(17);
residual(5) = lhs - rhs;
lhs = y(29);
rhs = y(28)/(1-params(10))*T(18);
residual(6) = lhs - rhs;
lhs = y(29);
rhs = (y(14)*y(17)+y(29)*(1-y(19)+y(30)*params(6)*(y(30)-params(7)/params(8))-T(19)))*T(20);
residual(7) = lhs - rhs;
lhs = y(29);
rhs = T(20)*(y(15)*y(18)+y(29)*(y(30)*params(6)*(y(30)-params(7)/params(8))+1-y(20)-T(19)));
residual(8) = lhs - rhs;
lhs = y(30);
rhs = exp(y(32))*y(3)/y(4);
residual(9) = lhs - rhs;
lhs = y(29)*y(21);
rhs = y(14);
residual(10) = lhs - rhs;
lhs = y(29)*y(22);
rhs = y(15);
residual(11) = lhs - rhs;
lhs = y(19);
rhs = T(2)+(T(1)+T(2))*(y(17)-1)+(y(17)-1)^2*T(21);
residual(12) = lhs - rhs;
lhs = y(20);
rhs = T(2)+(T(1)+T(2))*(y(18)-1)+T(21)*(y(18)-1)^2;
residual(13) = lhs - rhs;
lhs = y(21);
rhs = T(1)+T(2)+(y(17)-1)*(T(1)+T(2))*params(5);
residual(14) = lhs - rhs;
lhs = y(22);
rhs = T(1)+T(2)+(T(1)+T(2))*params(5)*(y(18)-1);
residual(15) = lhs - rhs;
lhs = y(2);
rhs = T(22)*T(27);
residual(16) = lhs - rhs;
lhs = y(3);
rhs = T(28)*T(32);
residual(17) = lhs - rhs;
lhs = y(3)*exp(y(32));
rhs = T(19)+exp(y(32))*(y(5)+y(6))-(1-y(19))*y(5)-(1-y(20))*y(6);
residual(18) = lhs - rhs;
lhs = (1-params(10))*y(16);
rhs = (1-params(10))*params(9)*y(2)/y(8);
residual(19) = lhs - rhs;
lhs = (1-params(10))*y(16)/y(28);
rhs = (1-params(10))*params(9)*y(3)/y(9);
residual(20) = lhs - rhs;
lhs = (1-params(10))*y(14);
rhs = exp(y(32))*params(8)*(T(1)+T(2))*y(2)/(y(17)*y(5));
residual(21) = lhs - rhs;
lhs = (1-params(10))*y(15)/y(28);
rhs = exp(y(32))*params(8)*(T(1)+T(2))*y(3)/(y(18)*y(6));
residual(22) = lhs - rhs;
lhs = y(7);
rhs = y(8)+y(9);
residual(23) = lhs - rhs;
lhs = y(4);
rhs = y(5)+y(6);
residual(24) = lhs - rhs;
lhs = y(23);
rhs = y(24)+y(25);
residual(25) = lhs - rhs;
lhs = y(1);
rhs = y(2)+params(19)*y(3);
residual(26) = lhs - rhs;
lhs = y(31);
rhs = T(23)*T(5)*y(2)/y(1)*T(33)+T(29)*T(6)*y(3)/y(1)*T(34);
residual(27) = lhs - rhs;
lhs = y(33);
rhs = x(1)+y(33)*params(14)+params(3)*(1-params(8)*(T(1)+T(2)))*(1-params(14));
residual(28) = lhs - rhs;
lhs = y(32);
rhs = y(33)/(1-params(8)*(T(1)+T(2)));
residual(29) = lhs - rhs;
lhs = y(10);
rhs = y(10)*params(15)+x(2);
residual(30) = lhs - rhs;
lhs = y(11);
rhs = y(11)*params(16)-x(3);
residual(31) = lhs - rhs;
lhs = y(12);
rhs = y(12)*params(17)-x(4);
residual(32) = lhs - rhs;
lhs = y(13);
rhs = y(13)*params(18)+x(5);
residual(33) = lhs - rhs;
lhs = y(34);
rhs = log(y(1))-(log(y(1)));
residual(34) = lhs - rhs;
lhs = y(35);
rhs = log(y(2))-(log(y(2)));
residual(35) = lhs - rhs;
lhs = y(36);
rhs = log(y(3))-(log(y(3)));
residual(36) = lhs - rhs;
lhs = y(37);
rhs = log(y(7))-(log(y(7)));
residual(37) = lhs - rhs;
lhs = y(38);
rhs = log(y(8))-(log(y(8)));
residual(38) = lhs - rhs;
lhs = y(39);
rhs = log(y(9))-(log(y(9)));
residual(39) = lhs - rhs;
lhs = y(40);
rhs = y(34)-y(37);
residual(40) = lhs - rhs;
lhs = y(41);
rhs = log(y(23))-(log(y(23)));
residual(41) = lhs - rhs;
lhs = y(42);
rhs = log(y(28))-(y(42));
residual(42) = lhs - rhs;
lhs = y(43);
rhs = log(y(31))-(log(y(31)));
residual(43) = lhs - rhs;
residual(44) = y(44);
residual(45) = y(45);
residual(46) = y(50);
residual(47) = y(51);
residual(48) = y(46);
residual(49) = y(47);
residual(50) = y(48);
residual(51) = y(49);
residual(52) = y(52);
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
