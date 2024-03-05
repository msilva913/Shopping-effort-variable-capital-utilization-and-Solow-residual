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
    T = BRS_pred_labor.static_resid_tt(T, y, x, params);
end
residual = zeros(61, 1);
lhs = T(18);
rhs = y(19)*T(6)*exp(y(16));
residual(1) = lhs - rhs;
lhs = T(18);
rhs = T(6)*exp(y(16))*y(20);
residual(2) = lhs - rhs;
lhs = T(19);
rhs = y(2)*T(4)*exp(y(16))/y(30);
residual(3) = lhs - rhs;
lhs = T(19)*exp(y(15));
rhs = y(3)*T(4)*exp(y(16))*y(33)/y(31);
residual(4) = lhs - rhs;
lhs = y(32);
rhs = exp(y(16))*y(2)-T(21)-T(17)*T(23)/T(22);
residual(5) = lhs - rhs;
lhs = y(27);
rhs = params(7)/2*(y(35)-exp(params(4)))^2;
residual(6) = lhs - rhs;
lhs = y(28);
rhs = params(14)*(y(35)-exp(params(4)));
residual(7) = lhs - rhs;
lhs = y(35);
rhs = exp(y(38));
residual(8) = lhs - rhs;
lhs = y(33)/T(6);
rhs = y(34)*(1-y(35)*y(28)-y(27))+T(24)*y(28)*y(34)*T(25);
residual(9) = lhs - rhs;
lhs = y(34);
rhs = T(25)*(y(17)*y(21)+y(34)*(1-y(23)));
residual(10) = lhs - rhs;
lhs = y(34);
rhs = T(25)*(y(18)*y(22)+y(34)*(1-y(24)));
residual(11) = lhs - rhs;
lhs = y(34)*y(25);
rhs = y(17);
residual(12) = lhs - rhs;
lhs = y(34)*y(26);
rhs = y(18);
residual(13) = lhs - rhs;
lhs = y(23);
rhs = T(2)+(T(1)+T(2))*(y(21)-1)+(y(21)-1)^2*T(26);
residual(14) = lhs - rhs;
lhs = y(24);
rhs = T(2)+(T(1)+T(2))*(y(22)-1)+T(26)*(y(22)-1)^2;
residual(15) = lhs - rhs;
lhs = y(25);
rhs = T(1)+T(2)+(y(21)-1)*(T(1)+T(2))*params(6);
residual(16) = lhs - rhs;
lhs = y(26);
rhs = T(1)+T(2)+(T(1)+T(2))*params(6)*(y(22)-1);
residual(17) = lhs - rhs;
lhs = y(2);
rhs = T(28)*(T(30)*T(31)*T(32)-T(11));
residual(18) = lhs - rhs;
lhs = y(3);
rhs = T(34)*(T(35)*T(36)*T(37)-T(12));
residual(19) = lhs - rhs;
lhs = exp(y(38))*y(3)*(1-y(27));
rhs = exp(y(38))*(y(5)+y(6))-(1-y(23))*y(5)-(1-y(24))*y(6);
residual(20) = lhs - rhs;
lhs = T(6)*y(19);
rhs = T(7)*(y(2)+T(11)*T(28))/y(8);
residual(21) = lhs - rhs;
lhs = T(6)*y(20)/y(33);
rhs = T(7)*(y(3)+T(12)*T(34))/y(9);
residual(22) = lhs - rhs;
lhs = T(6)*y(17);
rhs = (y(2)+T(11)*T(28))*T(5)*exp(y(38))/(y(21)*y(5));
residual(23) = lhs - rhs;
lhs = T(6)*y(18)/y(33);
rhs = (y(3)+T(12)*T(34))*T(5)*exp(y(38))/(y(22)*y(6));
residual(24) = lhs - rhs;
lhs = y(7);
rhs = y(8)+y(9);
residual(25) = lhs - rhs;
lhs = y(4);
rhs = y(5)+y(6);
residual(26) = lhs - rhs;
lhs = y(29);
rhs = y(30)+y(31);
residual(27) = lhs - rhs;
lhs = y(1);
rhs = y(2)+y(3)*params(22);
residual(28) = lhs - rhs;
lhs = y(37);
rhs = T(39)/T(41)+T(43)/T(45);
residual(29) = lhs - rhs;
lhs = y(38);
rhs = params(4)*(1-params(15))+y(38)*params(15)+x(1);
residual(30) = lhs - rhs;
lhs = y(10);
rhs = y(10)*params(16)+x(2);
residual(31) = lhs - rhs;
lhs = y(11);
rhs = y(12)*params(17)+x(3);
residual(32) = lhs - rhs;
lhs = y(12);
rhs = y(10)+y(11);
residual(33) = lhs - rhs;
lhs = y(13);
rhs = y(13)*params(18)-x(4);
residual(34) = lhs - rhs;
lhs = y(14);
rhs = y(14)*params(19)-x(5);
residual(35) = lhs - rhs;
lhs = y(15);
rhs = y(15)*params(20)-x(6);
residual(36) = lhs - rhs;
lhs = y(16);
rhs = y(16)*params(21)+x(7);
residual(37) = lhs - rhs;
lhs = y(39);
rhs = log(y(1))-(log(y(1)));
residual(38) = lhs - rhs;
lhs = y(40);
rhs = log(y(2))-(log(y(2)));
residual(39) = lhs - rhs;
lhs = y(41);
rhs = log(y(3))-(log(y(3)));
residual(40) = lhs - rhs;
lhs = y(42);
rhs = log(y(7))-(log(y(7)));
residual(41) = lhs - rhs;
lhs = y(43);
rhs = log(y(8))-(log(y(8)));
residual(42) = lhs - rhs;
lhs = y(44);
rhs = log(y(9))-(log(y(9)));
residual(43) = lhs - rhs;
lhs = y(45);
rhs = log(y(4))-(log(y(4)));
residual(44) = lhs - rhs;
lhs = y(46);
rhs = y(39)-y(42);
residual(45) = lhs - rhs;
lhs = y(47);
rhs = log(y(29))-(log(y(29)));
residual(46) = lhs - rhs;
lhs = y(48);
rhs = log(y(33))-(y(48));
residual(47) = lhs - rhs;
lhs = y(49);
rhs = log(y(37))-(log(y(37)));
residual(48) = lhs - rhs;
lhs = y(36);
rhs = y(39)-y(45)*(1-params(10))-params(10)*y(42);
residual(49) = lhs - rhs;
lhs = y(50);
rhs = y(38)-params(4);
residual(50) = lhs - rhs;
lhs = y(51);
rhs = y(38)-params(4);
residual(51) = lhs - rhs;
lhs = y(52);
rhs = y(38)-params(4);
residual(52) = lhs - rhs;
lhs = y(53);
rhs = y(38)-params(4);
residual(53) = lhs - rhs;
lhs = y(60);
rhs = y(38)-params(4);
residual(54) = lhs - rhs;
lhs = y(61);
rhs = y(52)-params(10)*y(55)-(1-params(10))*y(60);
residual(55) = lhs - rhs;
residual(56) = y(54);
residual(57) = y(55);
residual(58) = y(56);
residual(59) = y(57);
residual(60) = y(58);
residual(61) = y(59);
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
