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
    T = directed_search_testing.static_resid_tt(T, y, x, params);
end
residual = zeros(42, 1);
lhs = y(3);
rhs = y(1)+T(7)*y(4)*(1-T(5));
residual(1) = lhs - rhs;
lhs = 0;
rhs = y(2)+(1-T(5))*T(7)*y(5);
residual(2) = lhs - rhs;
lhs = y(6);
rhs = y(3)+y(9);
residual(3) = lhs - rhs;
lhs = y(7);
rhs = y(4)*T(4)*T(7)+y(4)*T(9);
residual(4) = lhs - rhs;
lhs = y(8);
rhs = y(5)*T(4)*T(7)+y(5)*T(9);
residual(5) = lhs - rhs;
lhs = y(15)+y(16);
rhs = y(6)-y(7);
residual(6) = lhs - rhs;
lhs = y(15)+y(17);
rhs = y(12)-y(8);
residual(7) = lhs - rhs;
lhs = y(15)+y(18);
rhs = y(12);
residual(8) = lhs - rhs;
lhs = y(33)+1/params(5)*y(19);
rhs = y(15)+y(9)*(-params(6))-y(3);
residual(9) = lhs - rhs;
lhs = y(20);
rhs = y(20)*(1-params(3))+params(3)*y(13)-T(1)*y(24);
residual(10) = lhs - rhs;
lhs = y(21);
rhs = (1-params(3))*y(21)+params(3)*y(14)-T(1)*y(25);
residual(11) = lhs - rhs;
lhs = y(4);
rhs = y(9)-y(31);
residual(12) = lhs - rhs;
lhs = y(5);
rhs = y(18)+y(29);
residual(13) = lhs - rhs;
lhs = y(9)*(-params(6));
rhs = y(3)+y(23);
residual(14) = lhs - rhs;
lhs = 0;
rhs = (y(6)-y(7)-y(20)-y(24))*params(2)*T(1);
residual(15) = lhs - rhs;
lhs = 0;
rhs = params(2)*T(1)*(y(12)-y(8)-y(21)-y(25));
residual(16) = lhs - rhs;
lhs = y(20)+y(24)+y(24)*params(4);
rhs = y(6)-y(7);
residual(17) = lhs - rhs;
lhs = y(21)+y(25)+y(25)*params(4);
rhs = y(12)-y(8);
residual(18) = lhs - rhs;
lhs = y(37);
rhs = y(2)-y(1);
residual(19) = lhs - rhs;
lhs = y(6);
rhs = y(26)+y(1)+y(4)*T(7)*(1-T(4))+T(2)*(y(20)+y(24))+T(3)*y(16);
residual(20) = lhs - rhs;
lhs = y(12);
rhs = y(27)+y(2)+T(7)*y(5)*(1-T(4))+T(2)*(y(21)+y(25))+T(3)*y(17);
residual(21) = lhs - rhs;
lhs = y(10);
rhs = T(3)*y(16)+y(1)+y(26)+T(2)*y(20);
residual(22) = lhs - rhs;
lhs = y(11);
rhs = T(3)*y(17)+y(2)+y(27)+T(2)*y(21);
residual(23) = lhs - rhs;
lhs = y(19);
rhs = (params(10)*y(17)+(1-params(10))*y(16))*(1-T(8))+T(8)*y(18);
residual(24) = lhs - rhs;
lhs = y(22);
rhs = params(10)*y(21)+(1-params(10))*y(20);
residual(25) = lhs - rhs;
lhs = y(12);
rhs = params(10)*y(14)+(1-params(10))*y(13);
residual(26) = lhs - rhs;
lhs = y(26);
rhs = y(26)*params(14)+x(2);
residual(27) = lhs - rhs;
lhs = y(28);
rhs = y(27)*params(15)+x(1);
residual(28) = lhs - rhs;
lhs = y(27);
rhs = y(26)+y(28);
residual(29) = lhs - rhs;
lhs = y(32);
rhs = y(32)*params(16)+x(3);
residual(30) = lhs - rhs;
lhs = y(31);
rhs = (-y(32));
residual(31) = lhs - rhs;
lhs = y(29);
rhs = y(29)*params(17)+x(4);
residual(32) = lhs - rhs;
lhs = y(30);
rhs = y(29)+y(32);
residual(33) = lhs - rhs;
lhs = y(33);
rhs = (params(18)+params(19))*y(33)+params(19)*(-params(18))*y(33)-x(5);
residual(34) = lhs - rhs;
lhs = y(35);
rhs = y(6)-y(1);
residual(35) = lhs - rhs;
lhs = y(36);
rhs = y(12)-y(2);
residual(36) = lhs - rhs;
lhs = y(34);
rhs = params(10)*(y(12)-y(2))+(1-params(10))*(y(6)-y(1));
residual(37) = lhs - rhs;
lhs = y(41);
rhs = params(10)*(y(11)-y(2))+(1-params(10))*(y(10)-y(1));
residual(38) = lhs - rhs;
lhs = y(39);
rhs = y(34)-(1-params(9))*y(22)-params(9)*y(19);
residual(39) = lhs - rhs;
lhs = y(40);
rhs = y(41)-(1-params(9))*y(22)-params(9)*y(19);
residual(40) = lhs - rhs;
lhs = y(38);
rhs = y(34)-y(19);
residual(41) = lhs - rhs;
lhs = y(42);
rhs = y(33);
residual(42) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
