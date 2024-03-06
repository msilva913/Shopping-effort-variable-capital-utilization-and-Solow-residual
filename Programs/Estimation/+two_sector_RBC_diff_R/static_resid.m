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
    T = two_sector_RBC_diff_R.static_resid_tt(T, y, x, params);
end
residual = zeros(23, 1);
lhs = 0;
rhs = y(2);
residual(1) = lhs - rhs;
lhs = y(8)+y(9);
rhs = y(1)+y(5);
residual(2) = lhs - rhs;
lhs = y(8)+y(10);
rhs = y(3);
residual(3) = lhs - rhs;
lhs = y(6)+y(12);
rhs = y(1)+y(5);
residual(4) = lhs - rhs;
lhs = y(7)+y(13);
rhs = y(3);
residual(5) = lhs - rhs;
lhs = 1/params(3)*y(11);
rhs = y(8)+y(15);
residual(6) = lhs - rhs;
lhs = y(14);
rhs = y(14)*(1-params(2))+params(2)*y(3);
residual(7) = lhs - rhs;
lhs = y(1)+y(15);
rhs = (-params(4))/(1-params(8))*(y(5)-y(5)*params(8));
residual(8) = lhs - rhs;
lhs = 0;
rhs = y(6)*params(1)*(1/params(1)-1+params(2));
residual(9) = lhs - rhs;
residual(10) = y(6)-y(7);
lhs = y(20);
rhs = (-y(1));
residual(11) = lhs - rhs;
lhs = y(5);
rhs = y(16)+(1-params(5)*params(6))*y(12)+(1-(1-params(5)*params(6)))*y(9);
residual(12) = lhs - rhs;
lhs = y(3);
rhs = y(16)+(1-params(5)*params(6))*y(13)+(1-(1-params(5)*params(6)))*y(10);
residual(13) = lhs - rhs;
lhs = y(11);
rhs = (1-T(1))*y(9)+T(1)*y(10);
residual(14) = lhs - rhs;
lhs = y(14);
rhs = (1-T(1))*y(12)+T(1)*y(13);
residual(15) = lhs - rhs;
lhs = y(4);
rhs = (1-T(1))*(y(1)+y(5))+T(1)*y(3);
residual(16) = lhs - rhs;
lhs = y(16);
rhs = y(16)*params(9)+x(1);
residual(17) = lhs - rhs;
lhs = y(18);
rhs = y(5);
residual(18) = lhs - rhs;
lhs = y(19);
rhs = y(3);
residual(19) = lhs - rhs;
lhs = y(17);
rhs = T(1)*y(3)+(1-T(1))*y(5);
residual(20) = lhs - rhs;
lhs = y(23);
rhs = y(17)-y(14)*(1-params(6))-params(6)*y(11);
residual(21) = lhs - rhs;
lhs = y(21);
rhs = y(17)-y(11);
residual(22) = lhs - rhs;
lhs = y(22);
rhs = y(8)+y(11)-y(17);
residual(23) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
