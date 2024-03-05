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
    T = BRS_growth_alt.static_resid_tt(T, y, x, params);
end
residual = zeros(35, 1);
lhs = T(12);
rhs = (1-params(8))*y(15);
residual(1) = lhs - rhs;
lhs = T(13);
rhs = params(8)*y(2)/y(17);
residual(2) = lhs - rhs;
lhs = T(13);
rhs = params(8)*y(20)*y(3)/y(18);
residual(3) = lhs - rhs;
lhs = y(19);
rhs = y(2)-T(15)-T(16);
residual(4) = lhs - rhs;
lhs = y(20)*T(17);
rhs = T(18)*T(17)*T(20);
residual(5) = lhs - rhs;
lhs = y(14);
rhs = y(13);
residual(6) = lhs - rhs;
lhs = y(2);
rhs = T(21)*T(26);
residual(7) = lhs - rhs;
lhs = y(3);
rhs = T(27)*T(31);
residual(8) = lhs - rhs;
lhs = y(3)*exp(y(21));
rhs = exp(y(21))*(y(5)+y(6))-T(19)*(y(5)+y(6));
residual(9) = lhs - rhs;
lhs = (1-params(8))*y(15);
rhs = (1-params(8))*params(7)*y(2)/y(8);
residual(10) = lhs - rhs;
lhs = (1-params(8))*y(13);
rhs = exp(y(21))*T(3)*y(2)/y(5);
residual(11) = lhs - rhs;
lhs = (1-params(8))*y(15)/y(20);
rhs = (1-params(8))*params(7)*y(3)/y(9);
residual(12) = lhs - rhs;
lhs = (1-params(8))*y(14)/y(20);
rhs = exp(y(21))*T(3)*y(3)/y(6);
residual(13) = lhs - rhs;
lhs = y(7);
rhs = y(8)+y(9);
residual(14) = lhs - rhs;
lhs = y(4);
rhs = y(5)+y(6);
residual(15) = lhs - rhs;
lhs = y(16);
rhs = y(17)+y(18);
residual(16) = lhs - rhs;
lhs = y(1);
rhs = y(2)+params(15)*y(3);
residual(17) = lhs - rhs;
lhs = y(22);
rhs = x(1)+y(22)*params(11)+params(3)*(1-T(3))*(1-params(11));
residual(18) = lhs - rhs;
lhs = y(21);
rhs = y(22)/(1-T(3));
residual(19) = lhs - rhs;
lhs = y(10);
rhs = y(10)*params(12)+x(2);
residual(20) = lhs - rhs;
lhs = y(11);
rhs = y(11)*params(13)-x(3);
residual(21) = lhs - rhs;
lhs = y(12);
rhs = y(12)*params(14)-x(4);
residual(22) = lhs - rhs;
lhs = y(23);
rhs = log(y(1))-(log(y(1)));
residual(23) = lhs - rhs;
lhs = y(24);
rhs = log(y(2))-(log(y(2)));
residual(24) = lhs - rhs;
lhs = y(25);
rhs = log(y(3))-(log(y(3)));
residual(25) = lhs - rhs;
lhs = y(26);
rhs = log(y(7))-(log(y(7)));
residual(26) = lhs - rhs;
lhs = y(27);
rhs = y(23)-y(26);
residual(27) = lhs - rhs;
lhs = y(28);
rhs = log(y(16))-(log(y(16)));
residual(28) = lhs - rhs;
lhs = y(29);
rhs = log(y(20))-(y(29));
residual(29) = lhs - rhs;
lhs = y(30);
rhs = y(21)-params(3);
residual(30) = lhs - rhs;
lhs = y(31);
rhs = y(21)-params(3);
residual(31) = lhs - rhs;
lhs = y(32);
rhs = y(21)-params(3);
residual(32) = lhs - rhs;
lhs = y(33);
rhs = y(21)-params(3);
residual(33) = lhs - rhs;
residual(34) = y(34);
residual(35) = y(35);
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
