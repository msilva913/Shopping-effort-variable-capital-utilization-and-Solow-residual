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
    T = two_sector_RBC_testing.static_resid_tt(T, y, x, params);
end
residual = zeros(35, 1);
lhs = y(3);
rhs = y(1);
residual(1) = lhs - rhs;
lhs = 0;
rhs = y(2);
residual(2) = lhs - rhs;
lhs = y(5);
rhs = y(3)+y(8);
residual(3) = lhs - rhs;
lhs = y(13)+y(14);
rhs = y(5)-0.0*(y(1)-y(5));
residual(4) = lhs - rhs;
lhs = y(13)+y(15);
rhs = y(6)-0.0*(-y(6));
residual(5) = lhs - rhs;
lhs = y(12)+y(21)+y(17);
rhs = y(13)+y(14);
residual(6) = lhs - rhs;
lhs = y(11)+y(22)+y(18);
rhs = y(13)+y(15);
residual(7) = lhs - rhs;
lhs = y(26)+1/params(5)*y(16);
rhs = y(13)+y(8)*(-params(6))-y(3);
residual(8) = lhs - rhs;
lhs = y(19);
rhs = y(19)*(1-params(3))+params(3)*y(6)-T(1)*(params(10)*y(22)+(1-params(10))*y(21));
residual(9) = lhs - rhs;
lhs = y(3)+y(20);
rhs = y(8)*(-params(6));
residual(10) = lhs - rhs;
lhs = y(4);
rhs = y(12)*params(2)*T(1)+params(2)*y(4);
residual(11) = lhs - rhs;
lhs = y(4);
rhs = params(2)*y(4)+y(11)*params(2)*T(1);
residual(12) = lhs - rhs;
lhs = y(12);
rhs = y(4)+y(21)*params(4);
residual(13) = lhs - rhs;
lhs = y(11);
rhs = y(4)+y(22)*params(4);
residual(14) = lhs - rhs;
lhs = y(4);
rhs = params(3)*params(11)*(y(6)-y(19));
residual(15) = lhs - rhs;
lhs = y(30);
rhs = (-y(1));
residual(16) = lhs - rhs;
lhs = y(5);
rhs = y(1)+y(23)+T(3)*(y(21)+y(17))+(1-T(3))*y(14)-0.0*y(1);
residual(17) = lhs - rhs;
lhs = y(6);
rhs = (1-T(3))*y(15)+y(24)+T(3)*(y(22)+y(18));
residual(18) = lhs - rhs;
lhs = y(9);
rhs = (1-T(3))*y(14)+y(1)+y(23)+T(3)*y(17)-0.0*y(1);
residual(19) = lhs - rhs;
lhs = y(10);
rhs = (1-T(3))*y(15)+y(24)+T(3)*y(18);
residual(20) = lhs - rhs;
lhs = y(16);
rhs = params(10)*y(15)+(1-params(10))*y(14);
residual(21) = lhs - rhs;
lhs = y(19);
rhs = params(10)*y(18)+(1-params(10))*y(17);
residual(22) = lhs - rhs;
lhs = y(7);
rhs = params(10)*y(6)+(1-params(10))*y(5);
residual(23) = lhs - rhs;
lhs = y(23);
rhs = y(23)*params(12)+x(2);
residual(24) = lhs - rhs;
lhs = y(25);
rhs = y(24)*params(13)+x(1);
residual(25) = lhs - rhs;
lhs = y(24);
rhs = y(23)+y(25);
residual(26) = lhs - rhs;
lhs = y(26);
rhs = (params(14)+params(15))*y(26)+params(15)*(-params(14))*y(26)-x(3);
residual(27) = lhs - rhs;
lhs = y(28);
rhs = y(5)-y(1);
residual(28) = lhs - rhs;
lhs = y(29);
rhs = y(6);
residual(29) = lhs - rhs;
lhs = y(27);
rhs = params(10)*y(6)+(1-params(10))*(y(5)-y(1));
residual(30) = lhs - rhs;
lhs = y(34);
rhs = params(10)*y(10)+(1-params(10))*(y(9)-y(1));
residual(31) = lhs - rhs;
lhs = y(32);
rhs = y(27)-(1-params(9))*y(19)-params(9)*y(16);
residual(32) = lhs - rhs;
lhs = y(33);
rhs = y(34)-(1-params(9))*y(19)-params(9)*y(16);
residual(33) = lhs - rhs;
lhs = y(31);
rhs = y(27)-y(16);
residual(34) = lhs - rhs;
lhs = y(35);
rhs = y(26);
residual(35) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
