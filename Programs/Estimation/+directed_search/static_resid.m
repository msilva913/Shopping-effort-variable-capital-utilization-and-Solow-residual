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
residual = zeros(44, 1);
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
lhs = y(17)+y(18);
rhs = y(8)-y(9);
residual(6) = lhs - rhs;
lhs = y(17)+y(19);
rhs = y(14)-y(10);
residual(7) = lhs - rhs;
lhs = y(17)+y(20);
rhs = y(14);
residual(8) = lhs - rhs;
lhs = y(35)+1/params(5)*y(21);
rhs = y(17)+y(11)*(-params(6))-y(3);
residual(9) = lhs - rhs;
lhs = y(22);
rhs = y(22)*(1-params(3))+params(3)*y(15)-T(1)*y(26);
residual(10) = lhs - rhs;
lhs = y(23);
rhs = (1-params(3))*y(23)+params(3)*y(16)-T(1)*y(27);
residual(11) = lhs - rhs;
lhs = T(7)*(T(5)+1/params(11)-1)*y(4);
rhs = y(11)-y(33);
residual(12) = lhs - rhs;
lhs = y(5);
rhs = y(20)+y(31);
residual(13) = lhs - rhs;
lhs = y(11)*(-params(6));
rhs = y(3)+y(25);
residual(14) = lhs - rhs;
lhs = y(6);
rhs = (y(8)-y(22)-y(26)-y(9))*params(2)*T(1)+params(2)*y(6);
residual(15) = lhs - rhs;
lhs = y(7);
rhs = params(2)*T(1)*(y(14)-y(23)-y(27)-y(10))+params(2)*y(7);
residual(16) = lhs - rhs;
lhs = y(22)+y(26)+y(26)*params(4);
rhs = y(8)-y(9);
residual(17) = lhs - rhs;
lhs = y(23)+y(27)+y(27)*params(4);
rhs = y(14)-y(10);
residual(18) = lhs - rhs;
lhs = y(6);
rhs = params(3)*params(12)*(y(15)-y(22));
residual(19) = lhs - rhs;
lhs = y(7);
rhs = params(3)*params(12)*(y(16)-y(23));
residual(20) = lhs - rhs;
lhs = y(39);
rhs = y(2)-y(1);
residual(21) = lhs - rhs;
lhs = y(8);
rhs = y(28)+y(1)+y(4)*T(7)*(1-T(4))+T(2)*(y(22)+y(26))+T(3)*y(18);
residual(22) = lhs - rhs;
lhs = y(14);
rhs = y(29)+y(2)+T(7)*y(5)*(1-T(4))+T(2)*(y(23)+y(27))+T(3)*y(19);
residual(23) = lhs - rhs;
lhs = y(12);
rhs = T(3)*y(18)+y(1)+y(28)+T(2)*y(22);
residual(24) = lhs - rhs;
lhs = y(13);
rhs = T(3)*y(19)+y(2)+y(29)+T(2)*y(23);
residual(25) = lhs - rhs;
lhs = y(21);
rhs = (params(10)*y(19)+(1-params(10))*y(18))*(1-T(8))+T(8)*y(20);
residual(26) = lhs - rhs;
lhs = y(24);
rhs = params(10)*y(23)+(1-params(10))*y(22);
residual(27) = lhs - rhs;
lhs = y(14);
rhs = params(10)*y(16)+(1-params(10))*y(15);
residual(28) = lhs - rhs;
lhs = y(28);
rhs = y(28)*params(14)+x(2);
residual(29) = lhs - rhs;
lhs = y(30);
rhs = y(29)*params(15)+x(1);
residual(30) = lhs - rhs;
lhs = y(29);
rhs = y(28)+y(30);
residual(31) = lhs - rhs;
lhs = y(34);
rhs = y(34)*params(16)+x(3);
residual(32) = lhs - rhs;
lhs = y(33);
rhs = (-y(34));
residual(33) = lhs - rhs;
lhs = y(31);
rhs = y(31)*params(17)+x(4);
residual(34) = lhs - rhs;
lhs = y(32);
rhs = y(31)+y(34);
residual(35) = lhs - rhs;
lhs = y(35);
rhs = (params(18)+params(19))*y(35)+params(19)*(-params(18))*y(35)-x(5);
residual(36) = lhs - rhs;
lhs = y(37);
rhs = y(8)-y(1);
residual(37) = lhs - rhs;
lhs = y(38);
rhs = y(14)-y(2);
residual(38) = lhs - rhs;
lhs = y(36);
rhs = params(10)*(y(14)-y(2))+(1-params(10))*(y(8)-y(1));
residual(39) = lhs - rhs;
lhs = y(43);
rhs = params(10)*(y(13)-y(2))+(1-params(10))*(y(12)-y(1));
residual(40) = lhs - rhs;
lhs = y(41);
rhs = y(36)-(1-params(9))*y(24)-params(9)*y(21);
residual(41) = lhs - rhs;
lhs = y(42);
rhs = y(43)-(1-params(9))*y(24)-params(9)*y(21);
residual(42) = lhs - rhs;
lhs = y(40);
rhs = y(36)-y(21);
residual(43) = lhs - rhs;
lhs = y(44);
rhs = y(35);
residual(44) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
