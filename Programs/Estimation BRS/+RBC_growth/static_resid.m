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
    T = RBC_growth.static_resid_tt(T, y, x, params);
end
residual = zeros(55, 1);
lhs = y(10);
rhs = T(12)^(1/(1+params(13)));
residual(1) = lhs - rhs;
lhs = T(10)*T(13)*T(15);
rhs = exp(y(15))*y(18);
residual(2) = lhs - rhs;
lhs = T(11)*T(15)*T(16);
rhs = exp(y(15))*y(19);
residual(3) = lhs - rhs;
lhs = y(28);
rhs = exp(y(15))*(y(2)-y(2)*params(12))-T(17);
residual(4) = lhs - rhs;
lhs = y(26);
rhs = params(7)/2*(y(31)-exp(params(4)))^2;
residual(5) = lhs - rhs;
lhs = y(27);
rhs = params(7)*(y(31)-exp(params(4)));
residual(6) = lhs - rhs;
lhs = y(31);
rhs = exp(y(34));
residual(7) = lhs - rhs;
lhs = y(29);
rhs = y(30)*(1-y(31)*y(27)-y(26))+T(18)*y(27)*y(30)*T(19);
residual(8) = lhs - rhs;
lhs = y(30);
rhs = T(19)*(y(16)*y(20)+y(30)*(1-y(22)));
residual(9) = lhs - rhs;
lhs = y(30);
rhs = T(19)*(y(17)*y(21)+y(30)*(1-y(23)));
residual(10) = lhs - rhs;
lhs = y(30)*y(24);
rhs = y(16);
residual(11) = lhs - rhs;
lhs = y(30)*y(25);
rhs = y(17);
residual(12) = lhs - rhs;
lhs = y(22);
rhs = T(2)+(T(1)+T(2))*(y(20)-1)+(y(20)-1)^2*T(20);
residual(13) = lhs - rhs;
lhs = y(23);
rhs = T(2)+(T(1)+T(2))*(y(21)-1)+T(20)*(y(21)-1)^2;
residual(14) = lhs - rhs;
lhs = y(24);
rhs = T(1)+T(2)+(y(20)-1)*(T(1)+T(2))*params(6);
residual(15) = lhs - rhs;
lhs = y(25);
rhs = T(1)+T(2)+(T(1)+T(2))*params(6)*(y(21)-1);
residual(16) = lhs - rhs;
lhs = y(2);
rhs = T(21)*T(23)*T(24)-params(11)*(1-params(8));
residual(17) = lhs - rhs;
lhs = y(3);
rhs = T(25)*T(26)*T(27)-params(8)*params(11);
residual(18) = lhs - rhs;
lhs = exp(y(34))*y(3)*(1-y(26));
rhs = exp(y(34))*(y(5)+y(6))-(1-y(22))*y(5)-(1-y(23))*y(6);
residual(19) = lhs - rhs;
lhs = y(18);
rhs = T(5)*(params(11)*(1-params(8))+y(2))/y(8);
residual(20) = lhs - rhs;
lhs = y(19)/y(29);
rhs = T(5)*(params(8)*params(11)+y(3))/y(9);
residual(21) = lhs - rhs;
lhs = y(16);
rhs = (params(11)*(1-params(8))+y(2))*T(4)*exp(y(34))/(y(20)*y(5));
residual(22) = lhs - rhs;
lhs = y(17)/y(29);
rhs = (params(8)*params(11)+y(3))*T(4)*exp(y(34))/(y(21)*y(6));
residual(23) = lhs - rhs;
lhs = y(7);
rhs = y(8)+y(9);
residual(24) = lhs - rhs;
lhs = y(4);
rhs = y(5)+y(6);
residual(25) = lhs - rhs;
lhs = y(1);
rhs = y(2)+y(3)*params(19);
residual(26) = lhs - rhs;
lhs = y(33);
rhs = T(29)/T(31)+T(33)/T(35);
residual(27) = lhs - rhs;
lhs = y(34);
rhs = params(4)*(1-params(14))+y(34)*params(14)+x(1);
residual(28) = lhs - rhs;
lhs = y(11);
rhs = y(11)*params(15)+x(2);
residual(29) = lhs - rhs;
lhs = y(12);
rhs = y(13)*params(16)+x(3);
residual(30) = lhs - rhs;
lhs = y(13);
rhs = y(11)+y(12);
residual(31) = lhs - rhs;
lhs = y(14);
rhs = y(14)*params(17)-x(4);
residual(32) = lhs - rhs;
lhs = y(15);
rhs = y(15)*params(18)+x(5);
residual(33) = lhs - rhs;
lhs = y(35);
rhs = log(y(1))-(log(y(1)));
residual(34) = lhs - rhs;
lhs = y(36);
rhs = log(y(2))-(log(y(2)));
residual(35) = lhs - rhs;
lhs = y(37);
rhs = log(y(3))-(log(y(3)));
residual(36) = lhs - rhs;
lhs = y(38);
rhs = log(y(7))-(log(y(7)));
residual(37) = lhs - rhs;
lhs = y(39);
rhs = log(y(8))-(log(y(8)));
residual(38) = lhs - rhs;
lhs = y(40);
rhs = log(y(9))-(log(y(9)));
residual(39) = lhs - rhs;
lhs = y(41);
rhs = log(y(4))-(log(y(4)));
residual(40) = lhs - rhs;
lhs = y(42);
rhs = y(35)-y(38);
residual(41) = lhs - rhs;
lhs = y(43);
rhs = log(y(29))-(y(43));
residual(42) = lhs - rhs;
lhs = y(44);
rhs = log(y(33))-(log(y(33)));
residual(43) = lhs - rhs;
lhs = y(32);
rhs = y(35)-y(41)*(1-params(10))-params(10)*y(38);
residual(44) = lhs - rhs;
lhs = y(45);
rhs = y(34)-params(4);
residual(45) = lhs - rhs;
lhs = y(46);
rhs = y(34)-params(4);
residual(46) = lhs - rhs;
lhs = y(47);
rhs = y(34)-params(4);
residual(47) = lhs - rhs;
lhs = y(48);
rhs = y(34)-params(4);
residual(48) = lhs - rhs;
lhs = y(54);
rhs = y(34)-params(4);
residual(49) = lhs - rhs;
lhs = y(55);
rhs = y(47)-params(10)*y(50)-(1-params(10))*y(54);
residual(50) = lhs - rhs;
residual(51) = y(49);
residual(52) = y(50);
residual(53) = y(51);
residual(54) = y(52);
residual(55) = y(53);
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
