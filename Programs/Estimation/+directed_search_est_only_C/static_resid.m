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
    T = directed_search_est_only_C.static_resid_tt(T, y, x, params);
end
residual = zeros(39, 1);
lhs = y(3);
rhs = y(1)+T(10)*y(4)*(1-T(11));
residual(1) = lhs - rhs;
lhs = 0;
rhs = y(2);
residual(2) = lhs - rhs;
lhs = y(6);
rhs = y(3)+y(10);
residual(3) = lhs - rhs;
lhs = y(9);
rhs = y(4)*T(5)*T(10)+y(4)*params(13)*T(8)*T(10)*(T(5)-T(11))/params(8)*(1-T(10));
residual(4) = lhs - rhs;
lhs = y(13)+y(14);
rhs = y(6)-y(9)+T(12)*(y(1)+T(10)*y(4)-y(6));
residual(5) = lhs - rhs;
lhs = y(13)+y(15);
rhs = y(7)+T(12)*(-y(7));
residual(6) = lhs - rhs;
lhs = y(12)+y(21)+y(17);
rhs = y(13)+y(14);
residual(7) = lhs - rhs;
lhs = y(11)+y(22)+y(18);
rhs = y(13)+y(15);
residual(8) = lhs - rhs;
lhs = y(27)+1/params(5)*y(16);
rhs = y(13)+y(20);
residual(9) = lhs - rhs;
lhs = y(19);
rhs = y(19)*(1-params(3))+params(3)*y(7)-T(1)*(params(10)*y(22)+(1-params(10))*y(21));
residual(10) = lhs - rhs;
lhs = y(4);
rhs = y(10)-y(28);
residual(11) = lhs - rhs;
lhs = y(3)+y(20);
rhs = (-params(6))/(1-params(14))*(y(10)-y(10)*params(14));
residual(12) = lhs - rhs;
lhs = y(5);
rhs = y(12)*params(2)*T(1)+params(2)*y(5);
residual(13) = lhs - rhs;
lhs = y(5);
rhs = params(2)*y(5)+y(11)*params(2)*T(1);
residual(14) = lhs - rhs;
lhs = y(12);
rhs = y(5)+y(21)*params(4);
residual(15) = lhs - rhs;
lhs = y(11);
rhs = y(5)+y(22)*params(4);
residual(16) = lhs - rhs;
lhs = y(5);
rhs = params(3)*params(12)*(y(7)-y(19));
residual(17) = lhs - rhs;
lhs = y(34);
rhs = (-y(1));
residual(18) = lhs - rhs;
lhs = y(6);
rhs = T(6)*(y(24)+y(1)+y(4)*T(10)*(1-T(5))+T(3)*(y(21)+y(17))+T(4)*y(14))-(T(6)-1)*(y(1)+T(10)*y(4));
residual(19) = lhs - rhs;
lhs = y(7);
rhs = T(6)*(T(4)*y(15)+y(25)+T(3)*(y(22)+y(18)));
residual(20) = lhs - rhs;
lhs = y(16);
rhs = params(10)*y(15)+(1-params(10))*y(14);
residual(21) = lhs - rhs;
lhs = y(19);
rhs = params(10)*y(18)+(1-params(10))*y(17);
residual(22) = lhs - rhs;
lhs = y(23);
rhs = (1-params(10))*(T(10)*y(4)+T(3)*y(21))+params(10)*T(3)*y(22);
residual(23) = lhs - rhs;
lhs = y(8);
rhs = params(10)*y(7)+(1-params(10))*y(6);
residual(24) = lhs - rhs;
lhs = y(24);
rhs = y(24)*params(15)+x(2);
residual(25) = lhs - rhs;
lhs = y(26);
rhs = y(26)*params(16)+x(1);
residual(26) = lhs - rhs;
lhs = y(25);
rhs = y(24)+y(26);
residual(27) = lhs - rhs;
lhs = y(28);
rhs = y(28)*params(17)-x(4);
residual(28) = lhs - rhs;
lhs = y(27);
rhs = (params(18)+params(19))*y(27)+params(19)*(-params(18))*y(27)-x(3);
residual(29) = lhs - rhs;
lhs = y(29);
rhs = y(6)-y(1);
residual(30) = lhs - rhs;
lhs = y(30);
rhs = y(7);
residual(31) = lhs - rhs;
lhs = y(33);
rhs = params(10)*y(7)+(1-params(10))*(y(6)-y(1));
residual(32) = lhs - rhs;
lhs = y(38);
rhs = y(13);
residual(33) = lhs - rhs;
lhs = y(37);
rhs = y(33)-(1-params(9))*y(19)-params(9)*y(16);
residual(34) = lhs - rhs;
lhs = y(35);
rhs = y(33)-y(16);
residual(35) = lhs - rhs;
lhs = y(36);
rhs = y(16)+y(38)-y(33);
residual(36) = lhs - rhs;
lhs = y(31);
rhs = y(14);
residual(37) = lhs - rhs;
lhs = y(32);
rhs = y(15);
residual(38) = lhs - rhs;
lhs = y(39);
rhs = y(27);
residual(39) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
