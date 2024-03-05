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
    T = BRS_growth_ext_fd_v1.static_resid_tt(T, y, x, params);
end
residual = zeros(43, 1);
lhs = T(12);
rhs = (1-params(10))*y(15);
residual(1) = lhs - rhs;
lhs = T(13);
rhs = params(10)*y(2)/y(23);
residual(2) = lhs - rhs;
lhs = T(13);
rhs = params(10)*y(26)*y(3)/y(24);
residual(3) = lhs - rhs;
lhs = y(25);
rhs = y(2)-T(15)-T(16);
residual(4) = lhs - rhs;
lhs = y(27);
rhs = y(26)/(1-params(10))*T(17);
residual(5) = lhs - rhs;
lhs = y(27);
rhs = (y(13)*y(16)+y(27)*(1-y(18)+y(28)*params(6)*(y(28)-params(7)/params(8))-T(18)))*T(19);
residual(6) = lhs - rhs;
lhs = y(27);
rhs = T(19)*(y(14)*y(17)+y(27)*(y(28)*params(6)*(y(28)-params(7)/params(8))+1-y(19)-T(18)));
residual(7) = lhs - rhs;
lhs = y(28);
rhs = exp(y(29))*y(3)/y(4);
residual(8) = lhs - rhs;
lhs = y(27)*y(20);
rhs = y(13);
residual(9) = lhs - rhs;
lhs = y(27)*y(21);
rhs = y(14);
residual(10) = lhs - rhs;
lhs = y(18);
rhs = T(2)+(T(1)+T(2))*(y(16)-1)+(y(16)-1)^2*T(20);
residual(11) = lhs - rhs;
lhs = y(19);
rhs = T(2)+(T(1)+T(2))*(y(17)-1)+T(20)*(y(17)-1)^2;
residual(12) = lhs - rhs;
lhs = y(20);
rhs = T(1)+T(2)+(y(16)-1)*(T(1)+T(2))*params(5);
residual(13) = lhs - rhs;
lhs = y(21);
rhs = T(1)+T(2)+(T(1)+T(2))*params(5)*(y(17)-1);
residual(14) = lhs - rhs;
lhs = y(2);
rhs = T(21)*T(26);
residual(15) = lhs - rhs;
lhs = y(3);
rhs = T(27)*T(31);
residual(16) = lhs - rhs;
lhs = y(3)*exp(y(29));
rhs = T(18)+exp(y(29))*(y(5)+y(6))-(1-y(18))*y(5)-(1-y(19))*y(6);
residual(17) = lhs - rhs;
lhs = (1-params(10))*y(15);
rhs = (1-params(10))*params(9)*y(2)/y(8);
residual(18) = lhs - rhs;
lhs = (1-params(10))*y(13);
rhs = exp(y(29))*params(8)*(T(1)+T(2))*y(2)/(y(16)*y(5));
residual(19) = lhs - rhs;
lhs = (1-params(10))*y(15)/y(26);
rhs = (1-params(10))*params(9)*y(3)/y(9);
residual(20) = lhs - rhs;
lhs = (1-params(10))*y(13);
rhs = exp(y(29))*params(8)*(T(1)+T(2))*y(3)/(y(16)*y(6));
residual(21) = lhs - rhs;
lhs = y(7);
rhs = y(8)+y(9);
residual(22) = lhs - rhs;
lhs = y(4);
rhs = y(5)+y(6);
residual(23) = lhs - rhs;
lhs = y(22);
rhs = y(23)+y(24);
residual(24) = lhs - rhs;
lhs = y(1);
rhs = y(2)+params(17)*y(3);
residual(25) = lhs - rhs;
lhs = y(30);
rhs = x(1)+y(30)*params(13)+params(3)*(1-params(8)*(T(1)+T(2)))*(1-params(13));
residual(26) = lhs - rhs;
lhs = y(29);
rhs = y(30)/(1-params(8)*(T(1)+T(2)));
residual(27) = lhs - rhs;
lhs = y(10);
rhs = y(10)*params(14)+x(2);
residual(28) = lhs - rhs;
lhs = y(11);
rhs = y(11)*params(15)-x(3);
residual(29) = lhs - rhs;
lhs = y(12);
rhs = y(12)*params(16)-x(4);
residual(30) = lhs - rhs;
lhs = y(31);
rhs = log(y(1))-(log(y(1)));
residual(31) = lhs - rhs;
lhs = y(32);
rhs = log(y(2))-(log(y(2)));
residual(32) = lhs - rhs;
lhs = y(33);
rhs = log(y(3))-(log(y(3)));
residual(33) = lhs - rhs;
lhs = y(34);
rhs = log(y(7))-(log(y(7)));
residual(34) = lhs - rhs;
lhs = y(35);
rhs = y(31)-y(34);
residual(35) = lhs - rhs;
lhs = y(36);
rhs = log(y(22))-(log(y(22)));
residual(36) = lhs - rhs;
lhs = y(37);
rhs = log(y(26))-(y(37));
residual(37) = lhs - rhs;
residual(38) = y(38);
residual(39) = y(39);
residual(40) = y(40);
residual(41) = y(41);
residual(42) = y(42);
residual(43) = y(43);
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
