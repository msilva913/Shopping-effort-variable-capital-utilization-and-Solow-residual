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
    T = directed_search_est.static_resid_tt(T, y, x, params);
end
residual = zeros(45, 1);
lhs = y(3);
rhs = y(1)+T(10)*y(4)*T(13);
residual(1) = lhs - rhs;
lhs = 0;
rhs = y(2)+T(13)*T(10)*y(5);
residual(2) = lhs - rhs;
lhs = y(8);
rhs = y(3)+y(15);
residual(3) = lhs - rhs;
lhs = y(13);
rhs = y(4)*T(5)*T(10)+y(4)*T(14);
residual(4) = lhs - rhs;
lhs = y(14);
rhs = y(5)*T(5)*T(10)+y(5)*T(14);
residual(5) = lhs - rhs;
lhs = y(20)+y(21);
rhs = y(8)-y(13)+T(15)*(y(1)+T(10)*y(4)-y(8));
residual(6) = lhs - rhs;
lhs = y(20)+y(22);
rhs = y(9)-y(14)+T(15)*(y(2)+T(10)*y(5)-y(9));
residual(7) = lhs - rhs;
lhs = y(19)+y(28)+y(24);
rhs = y(20)+y(21);
residual(8) = lhs - rhs;
lhs = y(18)+y(29)+y(25);
rhs = y(20)+y(22);
residual(9) = lhs - rhs;
lhs = 1/params(5)*y(23);
rhs = y(20)+y(27);
residual(10) = lhs - rhs;
lhs = y(24);
rhs = y(24)*(1-params(3))+params(3)*y(10)-T(1)*(1-params(10))*y(28);
residual(11) = lhs - rhs;
lhs = y(25);
rhs = y(25)*(1-params(3))+params(3)*y(11)-T(1)*params(10)*y(29);
residual(12) = lhs - rhs;
lhs = y(4);
rhs = y(15)-y(33);
residual(13) = lhs - rhs;
lhs = y(5);
rhs = y(9)-y(3)-y(33);
residual(14) = lhs - rhs;
lhs = y(3)+y(27);
rhs = T(16)*(T(17)-params(14)*T(17));
residual(15) = lhs - rhs;
lhs = y(6);
rhs = y(19)*params(2)*T(1)+params(2)*y(6);
residual(16) = lhs - rhs;
lhs = y(7);
rhs = y(18)*params(2)*T(1)+params(2)*y(7);
residual(17) = lhs - rhs;
lhs = y(19);
rhs = y(6)+y(28)*params(4);
residual(18) = lhs - rhs;
lhs = y(18);
rhs = y(7)+y(29)*params(4);
residual(19) = lhs - rhs;
lhs = y(6);
rhs = params(3)*params(12)*(y(10)-y(24));
residual(20) = lhs - rhs;
lhs = y(7);
rhs = params(3)*params(12)*(y(11)-y(25));
residual(21) = lhs - rhs;
lhs = y(39);
rhs = y(2)-y(1);
residual(22) = lhs - rhs;
lhs = y(8);
rhs = T(6)*(y(30)+y(1)+y(4)*T(10)*(1-T(5))+T(3)*(y(28)+y(24))+T(4)*y(21))-(T(6)-1)*(y(1)+T(10)*y(4));
residual(23) = lhs - rhs;
lhs = y(9);
rhs = T(6)*(y(31)+y(2)+T(10)*y(5)*(1-T(5))+T(3)*(y(29)+y(25))+T(4)*y(22))-(T(6)-1)*(y(2)+T(10)*y(5));
residual(24) = lhs - rhs;
lhs = y(16);
rhs = T(6)*(T(4)*y(21)+y(1)+y(30)+T(3)*y(24))-(T(6)-1)*y(1);
residual(25) = lhs - rhs;
lhs = y(17);
rhs = T(6)*(T(4)*y(22)+y(2)+y(31)+T(3)*y(25))-(T(6)-1)*y(2);
residual(26) = lhs - rhs;
lhs = y(23);
rhs = params(10)*y(22)+(1-params(10))*y(21);
residual(27) = lhs - rhs;
lhs = y(26);
rhs = params(10)*y(25)+(1-params(10))*y(24);
residual(28) = lhs - rhs;
lhs = y(9);
rhs = params(10)*y(11)+(1-params(10))*y(10);
residual(29) = lhs - rhs;
lhs = y(12);
rhs = params(10)*y(9)+(1-params(10))*y(8);
residual(30) = lhs - rhs;
lhs = y(30);
rhs = y(30)*params(15)+x(2);
residual(31) = lhs - rhs;
lhs = y(32);
rhs = y(32)*params(16)+x(1);
residual(32) = lhs - rhs;
lhs = y(31);
rhs = y(30)+y(32);
residual(33) = lhs - rhs;
lhs = y(33);
rhs = y(33)*params(17)-x(3);
residual(34) = lhs - rhs;
lhs = y(34);
rhs = y(8)-y(1);
residual(35) = lhs - rhs;
lhs = y(35);
rhs = y(9)-y(2);
residual(36) = lhs - rhs;
lhs = y(38);
rhs = params(10)*(y(9)-y(2))+(1-params(10))*(y(8)-y(1));
residual(37) = lhs - rhs;
lhs = y(43);
rhs = y(20)-y(2);
residual(38) = lhs - rhs;
lhs = y(45);
rhs = params(10)*(y(17)-y(2))+(1-params(10))*(y(16)-y(1));
residual(39) = lhs - rhs;
lhs = y(42);
rhs = y(38)-(1-params(9))*y(26)-params(9)*y(23);
residual(40) = lhs - rhs;
lhs = y(44);
rhs = y(45)-(1-params(9))*y(26)-params(9)*y(23);
residual(41) = lhs - rhs;
lhs = y(40);
rhs = y(38)-y(23);
residual(42) = lhs - rhs;
lhs = y(41);
rhs = y(23)+y(43)-y(38);
residual(43) = lhs - rhs;
lhs = y(36);
rhs = y(23);
residual(44) = lhs - rhs;
lhs = y(37);
rhs = y(23);
residual(45) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
