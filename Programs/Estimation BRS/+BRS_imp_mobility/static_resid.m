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
    T = BRS_imp_mobility.static_resid_tt(T, y, x, params);
end
residual = zeros(55, 1);
lhs = y(10);
rhs = T(16)^(1/(1+params(14)));
residual(1) = lhs - rhs;
lhs = T(13)*T(17);
rhs = y(19)*T(5)*exp(y(16));
residual(2) = lhs - rhs;
lhs = T(18);
rhs = y(2)*T(4)*exp(y(16))/y(27);
residual(3) = lhs - rhs;
lhs = T(18);
rhs = y(3)*T(4)*exp(y(16))*y(31)/y(28);
residual(4) = lhs - rhs;
lhs = y(29);
rhs = T(23)-params(13)*y(30);
residual(5) = lhs - rhs;
lhs = y(30);
rhs = T(23);
residual(6) = lhs - rhs;
lhs = y(32);
rhs = y(31)/T(5)*T(24);
residual(7) = lhs - rhs;
lhs = y(32);
rhs = (y(17)*y(20)+y(32)*(1-y(22)+y(33)*params(6)*(y(33)-params(7)/params(8))-T(25)))*T(26);
residual(8) = lhs - rhs;
lhs = y(32);
rhs = T(26)*(y(18)*y(21)+y(32)*(y(33)*params(6)*(y(33)-params(7)/params(8))+1-y(23)-T(25)));
residual(9) = lhs - rhs;
lhs = y(33);
rhs = exp(y(35))*y(3)/y(4);
residual(10) = lhs - rhs;
lhs = y(32)*y(24);
rhs = y(17);
residual(11) = lhs - rhs;
lhs = y(32)*y(25);
rhs = y(18);
residual(12) = lhs - rhs;
lhs = y(22);
rhs = T(2)+(T(1)+T(2))*(y(20)-1)+(y(20)-1)^2*T(27);
residual(13) = lhs - rhs;
lhs = y(23);
rhs = T(2)+(T(1)+T(2))*(y(21)-1)+T(27)*(y(21)-1)^2;
residual(14) = lhs - rhs;
lhs = y(24);
rhs = T(1)+T(2)+(y(20)-1)*(T(1)+T(2))*params(5);
residual(15) = lhs - rhs;
lhs = y(25);
rhs = T(1)+T(2)+(T(1)+T(2))*params(5)*(y(21)-1);
residual(16) = lhs - rhs;
lhs = y(2);
rhs = T(32)*T(33);
residual(17) = lhs - rhs;
lhs = y(3);
rhs = T(37)*T(38);
residual(18) = lhs - rhs;
lhs = y(3)*exp(y(35));
rhs = T(25)+exp(y(35))*(y(5)+y(6))-(1-y(22))*y(5)-(1-y(23))*y(6);
residual(19) = lhs - rhs;
lhs = T(5)*y(19);
rhs = params(9)*T(5)*y(2)/y(8);
residual(20) = lhs - rhs;
lhs = T(5)*y(19)/y(31);
rhs = params(9)*T(5)*y(3)/y(9);
residual(21) = lhs - rhs;
lhs = T(5)*y(17);
rhs = exp(y(35))*params(8)*(T(1)+T(2))*y(2)/(y(20)*y(5));
residual(22) = lhs - rhs;
lhs = T(5)*y(18)/y(31);
rhs = exp(y(35))*params(8)*(T(1)+T(2))*y(3)/(y(21)*y(6));
residual(23) = lhs - rhs;
lhs = y(7);
rhs = y(8)+y(9);
residual(24) = lhs - rhs;
lhs = y(4);
rhs = y(5)+y(6);
residual(25) = lhs - rhs;
lhs = y(26);
rhs = y(27)+y(28);
residual(26) = lhs - rhs;
lhs = y(1);
rhs = y(2)+params(21)*y(3);
residual(27) = lhs - rhs;
lhs = y(34);
rhs = T(28)*T(7)*y(2)/y(1)*T(39)+T(34)*T(8)*y(3)/y(1)*T(40);
residual(28) = lhs - rhs;
lhs = y(35);
rhs = params(3)*(1-params(15))+y(35)*params(15)+x(1);
residual(29) = lhs - rhs;
lhs = y(11);
rhs = y(11)*params(16)+x(2);
residual(30) = lhs - rhs;
lhs = y(12);
rhs = y(13)*params(17)+x(3);
residual(31) = lhs - rhs;
lhs = y(13);
rhs = y(11)+y(12);
residual(32) = lhs - rhs;
lhs = y(14);
rhs = y(14)*params(18)-x(4);
residual(33) = lhs - rhs;
lhs = y(15);
rhs = y(15)*params(19)-x(5);
residual(34) = lhs - rhs;
lhs = y(16);
rhs = y(16)*params(20)+x(6);
residual(35) = lhs - rhs;
lhs = y(36);
rhs = log(y(1))-(log(y(1)));
residual(36) = lhs - rhs;
lhs = y(37);
rhs = log(y(2))-(log(y(2)));
residual(37) = lhs - rhs;
lhs = y(38);
rhs = log(y(3))-(log(y(3)));
residual(38) = lhs - rhs;
lhs = y(39);
rhs = log(y(7))-(log(y(7)));
residual(39) = lhs - rhs;
lhs = y(40);
rhs = log(y(8))-(log(y(8)));
residual(40) = lhs - rhs;
lhs = y(41);
rhs = log(y(9))-(log(y(9)));
residual(41) = lhs - rhs;
lhs = y(42);
rhs = y(36)-y(39);
residual(42) = lhs - rhs;
lhs = y(43);
rhs = log(y(26))-(log(y(26)));
residual(43) = lhs - rhs;
lhs = y(44);
rhs = log(y(31))-(y(44));
residual(44) = lhs - rhs;
lhs = y(45);
rhs = log(y(34))-(log(y(34)));
residual(45) = lhs - rhs;
lhs = y(46);
rhs = y(35)-params(3);
residual(46) = lhs - rhs;
lhs = y(47);
rhs = y(35)-params(3);
residual(47) = lhs - rhs;
lhs = y(48);
rhs = y(35)-params(3);
residual(48) = lhs - rhs;
lhs = y(49);
rhs = y(35)-params(3);
residual(49) = lhs - rhs;
residual(50) = y(50);
residual(51) = y(51);
residual(52) = y(52);
residual(53) = y(53);
residual(54) = y(54);
residual(55) = y(55);
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
