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
    T = BRS.static_resid_tt(T, y, x, params);
end
residual = zeros(32, 1);
lhs = T(12);
rhs = (1-params(8))*y(17);
residual(1) = lhs - rhs;
lhs = T(13);
rhs = params(8)*y(2)/y(19);
residual(2) = lhs - rhs;
lhs = T(13);
rhs = params(8)*y(22)*y(3)/y(20);
residual(3) = lhs - rhs;
lhs = y(21);
rhs = y(2)-T(15)-T(16);
residual(4) = lhs - rhs;
lhs = y(22)*T(17);
rhs = T(17)*T(1)*((1-params(8))*y(15)+T(2)*y(22));
residual(5) = lhs - rhs;
lhs = y(16);
rhs = y(15);
residual(6) = lhs - rhs;
lhs = y(2);
rhs = T(18)*T(21);
residual(7) = lhs - rhs;
lhs = y(3);
rhs = T(22)*T(25);
residual(8) = lhs - rhs;
lhs = y(3);
rhs = y(5)+y(6)-T(2)*(y(5)+y(6));
residual(9) = lhs - rhs;
lhs = (1-params(8))*y(17);
rhs = (1-params(8))*params(7)*y(2)/y(8);
residual(10) = lhs - rhs;
lhs = y(17)/y(15);
rhs = y(5)*T(26)/y(8);
residual(11) = lhs - rhs;
lhs = (1-params(8))*y(17)/y(22);
rhs = (1-params(8))*params(7)*y(3)/y(9);
residual(12) = lhs - rhs;
lhs = y(17)/y(16);
rhs = y(6)*T(26)/y(9);
residual(13) = lhs - rhs;
lhs = y(7);
rhs = y(8)+y(9);
residual(14) = lhs - rhs;
lhs = y(4);
rhs = y(5)+y(6);
residual(15) = lhs - rhs;
lhs = y(18);
rhs = y(19)+y(20);
residual(16) = lhs - rhs;
lhs = y(1);
rhs = y(2)+params(15)*y(3);
residual(17) = lhs - rhs;
lhs = y(10);
rhs = y(10)*params(11)+x(1);
residual(18) = lhs - rhs;
lhs = y(11);
rhs = y(12)*params(12)+x(2);
residual(19) = lhs - rhs;
lhs = y(12);
rhs = y(10)+y(11);
residual(20) = lhs - rhs;
lhs = y(13);
rhs = y(13)*params(13)-x(3);
residual(21) = lhs - rhs;
lhs = y(14);
rhs = y(14)*params(14)-x(4);
residual(22) = lhs - rhs;
lhs = y(23);
rhs = log(y(1));
residual(23) = lhs - rhs;
lhs = y(24);
rhs = log(y(2));
residual(24) = lhs - rhs;
lhs = y(25);
rhs = log(y(3));
residual(25) = lhs - rhs;
lhs = y(26);
rhs = log(y(7));
residual(26) = lhs - rhs;
lhs = y(27);
rhs = y(23)-y(26);
residual(27) = lhs - rhs;
lhs = y(28);
rhs = log(y(18));
residual(28) = lhs - rhs;
lhs = y(29);
rhs = y(25);
residual(29) = lhs - rhs;
lhs = y(30);
rhs = y(23);
residual(30) = lhs - rhs;
lhs = y(31);
rhs = y(27);
residual(31) = lhs - rhs;
lhs = y(32);
rhs = log(y(22));
residual(32) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
