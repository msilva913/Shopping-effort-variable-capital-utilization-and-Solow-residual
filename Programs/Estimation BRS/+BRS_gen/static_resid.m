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
    T = BRS_gen.static_resid_tt(T, y, x, params);
end
residual = zeros(63, 1);
lhs = y(10);
rhs = T(19)^(1/(1+params(17)));
residual(1) = lhs - rhs;
lhs = T(17)*T(20)*T(22);
rhs = y(20)*(1-T(4))*exp(y(17))/y(34);
residual(2) = lhs - rhs;
lhs = T(18)*T(22)*T(23);
rhs = (1-T(4))*exp(y(17))*y(21)/y(34);
residual(3) = lhs - rhs;
lhs = T(24);
rhs = y(2)*T(4)*exp(y(17))/y(31);
residual(4) = lhs - rhs;
lhs = T(24)*exp(y(16));
rhs = y(3)*T(4)*exp(y(17))*y(35)/y(32);
residual(5) = lhs - rhs;
lhs = y(33);
rhs = T(26)-T(28);
residual(6) = lhs - rhs;
lhs = y(34);
rhs = T(29)*T(30);
residual(7) = lhs - rhs;
lhs = y(28);
rhs = params(8)/2*(y(37)-exp(params(4)))^2;
residual(8) = lhs - rhs;
lhs = y(29);
rhs = params(8)*(y(37)-exp(params(4)));
residual(9) = lhs - rhs;
lhs = y(37);
rhs = exp(y(40));
residual(10) = lhs - rhs;
lhs = y(35)/(1-T(4));
rhs = y(36)*(1-y(37)*y(29)-y(28))+T(31)*y(29)*y(36)*T(32);
residual(11) = lhs - rhs;
lhs = y(36);
rhs = T(32)*(y(18)*y(22)+y(36)*(1-y(24)));
residual(12) = lhs - rhs;
lhs = y(36);
rhs = T(32)*(y(19)*y(23)+y(36)*(1-y(25)));
residual(13) = lhs - rhs;
lhs = y(36)*y(26);
rhs = y(18);
residual(14) = lhs - rhs;
lhs = y(36)*y(27);
rhs = y(19);
residual(15) = lhs - rhs;
lhs = y(24);
rhs = T(2)+(T(1)+T(2))*(y(22)-1)+(y(22)-1)^2*T(33);
residual(16) = lhs - rhs;
lhs = y(25);
rhs = T(2)+(T(1)+T(2))*(y(23)-1)+T(33)*(y(23)-1)^2;
residual(17) = lhs - rhs;
lhs = y(26);
rhs = T(1)+T(2)+(y(22)-1)*(T(1)+T(2))*params(7);
residual(18) = lhs - rhs;
lhs = y(27);
rhs = T(1)+T(2)+(T(1)+T(2))*params(7)*(y(23)-1);
residual(19) = lhs - rhs;
lhs = y(2);
rhs = T(35)*(T(37)*T(38)*T(39)-T(10));
residual(20) = lhs - rhs;
lhs = y(3);
rhs = T(41)*(T(42)*T(43)*T(44)-T(11));
residual(21) = lhs - rhs;
lhs = exp(y(40))*y(3)*(1-y(28));
rhs = exp(y(40))*(y(5)+y(6))-(1-y(24))*y(5)-(1-y(25))*y(6);
residual(22) = lhs - rhs;
lhs = (1-T(4))*y(20);
rhs = T(6)*(y(2)+T(10)*T(35))/y(8);
residual(23) = lhs - rhs;
lhs = (1-T(4))*y(21)/y(35);
rhs = T(6)*(y(3)+T(11)*T(41))/y(9);
residual(24) = lhs - rhs;
lhs = (1-T(4))*y(18);
rhs = (y(2)+T(10)*T(35))*T(5)*exp(y(40))/(y(22)*y(5));
residual(25) = lhs - rhs;
lhs = (1-T(4))*y(19)/y(35);
rhs = (y(3)+T(11)*T(41))*T(5)*exp(y(40))/(y(23)*y(6));
residual(26) = lhs - rhs;
lhs = y(7);
rhs = y(8)+y(9);
residual(27) = lhs - rhs;
lhs = y(4);
rhs = y(5)+y(6);
residual(28) = lhs - rhs;
lhs = y(30);
rhs = y(31)+exp(y(16))*y(32);
residual(29) = lhs - rhs;
lhs = y(1);
rhs = y(2)+y(3)*params(25);
residual(30) = lhs - rhs;
lhs = y(39);
rhs = T(46)/T(48)+T(50)/T(52);
residual(31) = lhs - rhs;
lhs = y(40);
rhs = params(4)*(1-params(18))+y(40)*params(18)+x(1);
residual(32) = lhs - rhs;
lhs = y(11);
rhs = y(11)*params(19)+x(2);
residual(33) = lhs - rhs;
lhs = y(12);
rhs = y(13)*params(20)+x(3);
residual(34) = lhs - rhs;
lhs = y(13);
rhs = y(11)+y(12);
residual(35) = lhs - rhs;
lhs = y(14);
rhs = y(14)*params(21)-x(4);
residual(36) = lhs - rhs;
lhs = y(15);
rhs = y(15)*params(22)-x(5);
residual(37) = lhs - rhs;
lhs = y(16);
rhs = y(16)*params(23)-x(6);
residual(38) = lhs - rhs;
lhs = y(17);
rhs = y(17)*params(24)+x(7);
residual(39) = lhs - rhs;
lhs = y(41);
rhs = log(y(1))-(log(y(1)));
residual(40) = lhs - rhs;
lhs = y(42);
rhs = log(y(2))-(log(y(2)));
residual(41) = lhs - rhs;
lhs = y(43);
rhs = log(y(3))-(log(y(3)));
residual(42) = lhs - rhs;
lhs = y(44);
rhs = log(y(7))-(log(y(7)));
residual(43) = lhs - rhs;
lhs = y(45);
rhs = log(y(8))-(log(y(8)));
residual(44) = lhs - rhs;
lhs = y(46);
rhs = log(y(9))-(log(y(9)));
residual(45) = lhs - rhs;
lhs = y(47);
rhs = log(y(4))-(log(y(4)));
residual(46) = lhs - rhs;
lhs = y(48);
rhs = y(41)-y(44);
residual(47) = lhs - rhs;
lhs = y(49);
rhs = log(y(30))-(log(y(30)));
residual(48) = lhs - rhs;
lhs = y(50);
rhs = log(y(35))-(y(50));
residual(49) = lhs - rhs;
lhs = y(51);
rhs = log(y(39))-(log(y(39)));
residual(50) = lhs - rhs;
lhs = y(38);
rhs = y(41)-y(47)*(1-params(11))-params(11)*y(44);
residual(51) = lhs - rhs;
lhs = y(52);
rhs = y(40)-params(4);
residual(52) = lhs - rhs;
lhs = y(53);
rhs = y(40)-params(4);
residual(53) = lhs - rhs;
lhs = y(54);
rhs = y(40)-params(4);
residual(54) = lhs - rhs;
lhs = y(55);
rhs = y(40)-params(4);
residual(55) = lhs - rhs;
lhs = y(62);
rhs = y(40)-params(4);
residual(56) = lhs - rhs;
lhs = y(63);
rhs = y(54)-params(11)*y(57)-(1-params(11))*y(62);
residual(57) = lhs - rhs;
residual(58) = y(56);
residual(59) = y(57);
residual(60) = y(58);
residual(61) = y(59);
residual(62) = y(60);
residual(63) = y(61);
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
