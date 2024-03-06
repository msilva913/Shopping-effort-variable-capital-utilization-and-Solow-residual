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
    T = BRS_growth_util_shock_err.static_resid_tt(T, y, x, params);
end
residual = zeros(52, 1);
lhs = T(13)*T(14);
rhs = T(5)*y(18);
residual(1) = lhs - rhs;
lhs = T(15);
rhs = T(4)*y(2)/y(26);
residual(2) = lhs - rhs;
lhs = T(15);
rhs = y(3)*T(4)*y(29)/y(27);
residual(3) = lhs - rhs;
lhs = y(28);
rhs = y(2)-T(17)-T(14)*T(19)/T(18);
residual(4) = lhs - rhs;
lhs = y(30);
rhs = y(29)/T(5);
residual(5) = lhs - rhs;
lhs = y(30);
rhs = (y(16)*y(19)+y(30)*(1-y(21)))*T(20);
residual(6) = lhs - rhs;
lhs = y(30);
rhs = T(20)*(y(17)*y(20)+y(30)*(1-y(22)));
residual(7) = lhs - rhs;
lhs = y(30)*y(23);
rhs = y(16);
residual(8) = lhs - rhs;
lhs = y(30)*y(24);
rhs = y(17);
residual(9) = lhs - rhs;
lhs = y(21);
rhs = T(22);
residual(10) = lhs - rhs;
lhs = y(22);
rhs = T(23);
residual(11) = lhs - rhs;
lhs = y(23);
rhs = exp(y(15))*(T(1)+T(2)+(y(19)-1)*(T(1)+T(2))*params(6));
residual(12) = lhs - rhs;
lhs = y(24);
rhs = exp(y(15))*(T(1)+T(2)+(T(1)+T(2))*params(6)*(y(20)-1));
residual(13) = lhs - rhs;
lhs = y(2);
rhs = T(28)*T(29);
residual(14) = lhs - rhs;
lhs = y(3);
rhs = T(33)*T(34);
residual(15) = lhs - rhs;
lhs = y(3)*exp(y(32));
rhs = exp(y(32))*(y(5)+y(6))-(1-y(21))*y(5)-(1-y(22))*y(6);
residual(16) = lhs - rhs;
lhs = T(5)*y(18);
rhs = params(10)*T(5)*y(2)/y(8);
residual(17) = lhs - rhs;
lhs = T(5)*y(18)/y(29);
rhs = params(10)*T(5)*y(3)/y(9);
residual(18) = lhs - rhs;
lhs = T(5)*y(16);
rhs = exp(y(32))*params(9)*(T(1)+T(2))*y(2)/(y(19)*y(5));
residual(19) = lhs - rhs;
lhs = T(5)*y(17)/y(29);
rhs = exp(y(32))*params(9)*(T(1)+T(2))*y(3)/(y(20)*y(6));
residual(20) = lhs - rhs;
lhs = y(7);
rhs = y(8)+y(9);
residual(21) = lhs - rhs;
lhs = y(4);
rhs = y(5)+y(6);
residual(22) = lhs - rhs;
lhs = y(25);
rhs = y(26)+y(27);
residual(23) = lhs - rhs;
lhs = y(1);
rhs = y(2)+params(20)*y(3);
residual(24) = lhs - rhs;
lhs = y(31);
rhs = y(19)*y(2)/y(1)+y(20)*y(3)/y(1);
residual(25) = lhs - rhs;
lhs = y(32);
rhs = params(4)*(1-params(14))+y(32)*params(14)+x(1);
residual(26) = lhs - rhs;
lhs = y(10);
rhs = y(10)*params(15)+x(2);
residual(27) = lhs - rhs;
lhs = y(11);
rhs = y(12)*params(16)+x(3);
residual(28) = lhs - rhs;
lhs = y(12);
rhs = y(10)+y(11);
residual(29) = lhs - rhs;
lhs = y(13);
rhs = y(13)*params(17)-x(4);
residual(30) = lhs - rhs;
lhs = y(14);
rhs = y(14)*params(18)-x(5);
residual(31) = lhs - rhs;
lhs = y(15);
rhs = y(15)*params(19)-x(6);
residual(32) = lhs - rhs;
lhs = y(33);
rhs = log(y(1))-(log(y(1)));
residual(33) = lhs - rhs;
lhs = y(34);
rhs = log(y(2))-(log(y(2)));
residual(34) = lhs - rhs;
lhs = y(35);
rhs = log(y(3))-(log(y(3)));
residual(35) = lhs - rhs;
lhs = y(36);
rhs = log(y(7))-(log(y(7)));
residual(36) = lhs - rhs;
lhs = y(37);
rhs = log(y(8))-(log(y(8)));
residual(37) = lhs - rhs;
lhs = y(38);
rhs = log(y(9))-(log(y(9)));
residual(38) = lhs - rhs;
lhs = y(39);
rhs = y(33)-y(36);
residual(39) = lhs - rhs;
lhs = y(40);
rhs = log(y(25))-(log(y(25)));
residual(40) = lhs - rhs;
lhs = y(41);
rhs = log(y(29))-(y(41));
residual(41) = lhs - rhs;
lhs = y(42);
rhs = log(y(31))-(log(y(31)));
residual(42) = lhs - rhs;
lhs = y(43);
rhs = y(32)-params(4);
residual(43) = lhs - rhs;
lhs = y(44);
rhs = y(32)-params(4);
residual(44) = lhs - rhs;
lhs = y(45);
rhs = y(32)-params(4);
residual(45) = lhs - rhs;
lhs = y(46);
rhs = y(32)-params(4);
residual(46) = lhs - rhs;
residual(47) = y(47);
residual(48) = y(48);
residual(49) = y(49);
residual(50) = y(50);
residual(51) = y(51);
residual(52) = y(52);
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
