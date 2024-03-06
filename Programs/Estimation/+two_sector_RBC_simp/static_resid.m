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
    T = two_sector_RBC_simp.static_resid_tt(T, y, x, params);
end
residual = zeros(24, 1);
lhs = y(3);
rhs = y(1);
residual(1) = lhs - rhs;
lhs = 0;
rhs = y(2);
residual(2) = lhs - rhs;
lhs = y(4);
rhs = y(3)+y(7);
residual(3) = lhs - rhs;
lhs = y(9)+y(10);
rhs = y(4);
residual(4) = lhs - rhs;
lhs = y(9)+y(11);
rhs = y(5);
residual(5) = lhs - rhs;
lhs = y(8)+y(13);
rhs = y(9)+y(10);
residual(6) = lhs - rhs;
lhs = y(8)+y(14);
rhs = y(9)+y(11);
residual(7) = lhs - rhs;
lhs = 1/params(3)*y(12);
rhs = y(9)+y(16);
residual(8) = lhs - rhs;
lhs = y(15);
rhs = y(15)*(1-params(2))+params(2)*y(5);
residual(9) = lhs - rhs;
lhs = y(3)+y(16);
rhs = (-params(4))/(1-params(9))*(y(7)-y(7)*params(9));
residual(10) = lhs - rhs;
lhs = 0;
rhs = y(8)*params(1)*(1/params(1)-1+params(2));
residual(11) = lhs - rhs;
lhs = y(21);
rhs = (-y(1));
residual(12) = lhs - rhs;
lhs = y(4);
rhs = y(1)+y(17)+(1-params(6)*params(7))*y(13)+(1-(1-params(6)*params(7)))*y(10);
residual(13) = lhs - rhs;
lhs = y(5);
rhs = (1-(1-params(6)*params(7)))*y(11)+y(17)+(1-params(6)*params(7))*y(14);
residual(14) = lhs - rhs;
lhs = y(12);
rhs = (1-T(1))*y(10)+T(1)*y(11);
residual(15) = lhs - rhs;
lhs = y(15);
rhs = (1-T(1))*y(13)+T(1)*y(14);
residual(16) = lhs - rhs;
lhs = y(6);
rhs = (1-T(1))*y(4)+T(1)*y(5);
residual(17) = lhs - rhs;
lhs = y(17);
rhs = y(17)*params(10)+x(1);
residual(18) = lhs - rhs;
lhs = y(19);
rhs = y(4)-y(1);
residual(19) = lhs - rhs;
lhs = y(20);
rhs = y(5);
residual(20) = lhs - rhs;
lhs = y(18);
rhs = T(1)*y(5)+(1-T(1))*(y(4)-y(1));
residual(21) = lhs - rhs;
lhs = y(24);
rhs = y(18)-(1-params(7))*y(15)-params(7)*y(12);
residual(22) = lhs - rhs;
lhs = y(22);
rhs = y(18)-y(12);
residual(23) = lhs - rhs;
lhs = y(23);
rhs = y(9)+y(12)-y(18);
residual(24) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
