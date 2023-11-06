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
    T = directed_search.static_resid_tt(T, y, x, params);
end
residual = zeros(46, 1);
lhs = y(3);
rhs = y(1)+T(7)*y(4)*(1-T(5));
residual(1) = lhs - rhs;
lhs = 0;
rhs = y(2)+(1-T(5))*T(7)*y(5);
residual(2) = lhs - rhs;
lhs = y(8);
rhs = y(3)+y(11);
residual(3) = lhs - rhs;
lhs = y(9);
rhs = y(4)*T(4)*T(7)+y(4)*T(9);
residual(4) = lhs - rhs;
lhs = y(10);
rhs = y(5)*T(4)*T(7)+y(5)*T(9);
residual(5) = lhs - rhs;
lhs = y(19)+y(20);
rhs = y(8)-y(9);
residual(6) = lhs - rhs;
lhs = y(19)+y(21);
rhs = y(16)-y(10);
residual(7) = lhs - rhs;
lhs = y(19)+y(22);
rhs = y(16);
residual(8) = lhs - rhs;
lhs = y(37)+1/params(5)*y(23);
rhs = y(19)+y(11)*(-params(6))-y(3);
residual(9) = lhs - rhs;
lhs = y(24);
rhs = y(24)*(1-params(3))+params(3)*y(17)-T(1)*y(28);
residual(10) = lhs - rhs;
lhs = y(25);
rhs = (1-params(3))*y(25)+params(3)*y(18)-T(1)*y(29);
residual(11) = lhs - rhs;
lhs = T(7)*(T(5)+1/params(11)-1)*y(4);
rhs = y(11)-y(35);
residual(12) = lhs - rhs;
lhs = y(5);
rhs = y(22)+y(34);
residual(13) = lhs - rhs;
lhs = y(11)*(-params(6));
rhs = y(3)+y(27);
residual(14) = lhs - rhs;
lhs = y(6);
rhs = (y(8)-y(24)-y(28)-y(9))*params(2)*T(1)+params(2)*y(6);
residual(15) = lhs - rhs;
lhs = y(7);
rhs = params(2)*T(1)*(y(16)-y(25)-y(29)-y(10))+params(2)*y(7);
residual(16) = lhs - rhs;
lhs = y(24)+y(28)+y(6)+y(28)*params(4);
rhs = y(8)-y(9);
residual(17) = lhs - rhs;
lhs = y(25)+y(29)+y(7)+y(29)*params(4);
rhs = y(16)-y(10);
residual(18) = lhs - rhs;
lhs = y(6);
rhs = params(3)*params(12)*(y(17)-y(24));
residual(19) = lhs - rhs;
lhs = y(7);
rhs = params(3)*params(12)*(y(18)-y(25));
residual(20) = lhs - rhs;
lhs = y(41);
rhs = y(2)-y(1);
residual(21) = lhs - rhs;
lhs = y(8);
rhs = y(30)+y(1)+y(4)*T(7)*(1-T(4))+T(2)*(y(24)+y(28))+T(3)*y(20);
residual(22) = lhs - rhs;
lhs = y(16);
rhs = y(31)+y(2)+T(7)*y(5)*(1-T(4))+T(2)*(y(25)+y(29))+T(3)*y(21);
residual(23) = lhs - rhs;
lhs = y(12);
rhs = T(3)*y(20)+y(1)+y(30)+T(2)*y(24);
residual(24) = lhs - rhs;
lhs = y(13);
rhs = T(3)*y(21)+y(2)+y(31)+T(2)*y(25);
residual(25) = lhs - rhs;
lhs = y(23);
rhs = (params(10)*y(21)+(1-params(10))*y(20))*(1-T(8))+T(8)*y(22);
residual(26) = lhs - rhs;
lhs = y(26);
rhs = params(10)*y(25)+(1-params(10))*y(24);
residual(27) = lhs - rhs;
lhs = y(16);
rhs = params(10)*y(18)+(1-params(10))*y(17);
residual(28) = lhs - rhs;
lhs = y(14);
rhs = (1-params(10))*(T(7)*y(4)+T(2)*y(28))+params(10)*(T(7)*y(5)+T(2)*y(29));
residual(29) = lhs - rhs;
lhs = (1-params(10))*y(8);
rhs = params(9)*y(8)+(1-params(9)-params(10))*y(15);
residual(30) = lhs - rhs;
lhs = y(30);
rhs = y(30)*params(14)+x(2);
residual(31) = lhs - rhs;
lhs = y(32);
rhs = y(31)*params(15)+x(1);
residual(32) = lhs - rhs;
lhs = y(31);
rhs = y(30)+y(32);
residual(33) = lhs - rhs;
lhs = y(36);
rhs = y(36)*params(16)+x(3);
residual(34) = lhs - rhs;
lhs = y(35);
rhs = (-y(36));
residual(35) = lhs - rhs;
lhs = y(33);
rhs = y(33)*params(17)+x(4);
residual(36) = lhs - rhs;
lhs = y(34);
rhs = y(36)+y(33);
residual(37) = lhs - rhs;
lhs = y(37);
rhs = (params(18)+params(19))*y(37)+params(19)*(-params(18))*y(37)-x(5);
residual(38) = lhs - rhs;
lhs = y(39);
rhs = y(8)-y(1);
residual(39) = lhs - rhs;
lhs = y(40);
rhs = y(16)-y(2);
residual(40) = lhs - rhs;
lhs = y(38);
rhs = params(10)*(y(16)-y(2))+(1-params(10))*(y(8)-y(1));
residual(41) = lhs - rhs;
lhs = y(45);
rhs = params(10)*(y(13)-y(2))+(1-params(10))*(y(12)-y(1));
residual(42) = lhs - rhs;
lhs = y(43);
rhs = y(38)-(1-params(9))*y(26)-params(9)*y(23);
residual(43) = lhs - rhs;
lhs = y(44);
rhs = y(45)-(1-params(9))*y(26)-params(9)*y(23);
residual(44) = lhs - rhs;
lhs = y(42);
rhs = y(38)-y(23);
residual(45) = lhs - rhs;
lhs = y(46);
rhs = y(37);
residual(46) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
