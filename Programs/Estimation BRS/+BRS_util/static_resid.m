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
    T = BRS_util.static_resid_tt(T, y, x, params);
end
residual = zeros(49, 1);
lhs = T(10);
rhs = (1-params(8))*y(18);
residual(1) = lhs - rhs;
lhs = T(11);
rhs = params(8)*y(2)/y(20);
residual(2) = lhs - rhs;
lhs = T(11);
rhs = params(8)*y(23)*y(3)/y(21);
residual(3) = lhs - rhs;
lhs = y(22);
rhs = y(2)-T(13)-T(14);
residual(4) = lhs - rhs;
lhs = y(23)*T(15);
rhs = T(16)*T(15)*T(18);
residual(5) = lhs - rhs;
lhs = y(17);
rhs = y(16);
residual(6) = lhs - rhs;
lhs = y(2);
rhs = T(19)*T(24);
residual(7) = lhs - rhs;
lhs = y(3);
rhs = T(25)*T(29);
residual(8) = lhs - rhs;
lhs = y(3)*exp(y(24));
rhs = exp(y(24))*(y(6)+y(7))-T(17)*(y(6)+y(7));
residual(9) = lhs - rhs;
lhs = (1-params(8))*y(18);
rhs = (1-params(8))*params(7)*y(2)/y(9);
residual(10) = lhs - rhs;
lhs = (1-params(8))*y(16);
rhs = exp(y(24))*T(1)*y(2)/y(6);
residual(11) = lhs - rhs;
lhs = (1-params(8))*y(18)/y(23);
rhs = (1-params(8))*params(7)*y(3)/y(10);
residual(12) = lhs - rhs;
lhs = (1-params(8))*y(17)/y(23);
rhs = exp(y(24))*T(1)*y(3)/y(7);
residual(13) = lhs - rhs;
lhs = y(8);
rhs = y(9)+y(10);
residual(14) = lhs - rhs;
lhs = y(5);
rhs = y(6)+y(7);
residual(15) = lhs - rhs;
lhs = y(19);
rhs = y(20)+y(21);
residual(16) = lhs - rhs;
lhs = y(1);
rhs = y(2)+params(16)*y(3);
residual(17) = lhs - rhs;
lhs = y(4);
rhs = T(30)*T(37);
residual(18) = lhs - rhs;
lhs = y(25);
rhs = T(20);
residual(19) = lhs - rhs;
lhs = y(26);
rhs = T(26);
residual(20) = lhs - rhs;
lhs = y(27);
rhs = y(25)*y(2)/(y(2)+y(3))+y(26)*y(3)/(y(2)+y(3));
residual(21) = lhs - rhs;
lhs = y(24);
rhs = params(3)*(1-params(11))+y(24)*params(11)+x(1);
residual(22) = lhs - rhs;
lhs = y(11);
rhs = y(11)*params(12)+x(2);
residual(23) = lhs - rhs;
lhs = y(12);
rhs = y(13)*params(13)+x(3);
residual(24) = lhs - rhs;
lhs = y(13);
rhs = y(11)+y(12);
residual(25) = lhs - rhs;
lhs = y(14);
rhs = y(14)*params(14)-x(4);
residual(26) = lhs - rhs;
lhs = y(15);
rhs = y(15)*params(15)-x(5);
residual(27) = lhs - rhs;
lhs = y(28);
rhs = log(y(1))-(log(y(1)));
residual(28) = lhs - rhs;
lhs = y(29);
rhs = log(y(2))-(log(y(2)));
residual(29) = lhs - rhs;
lhs = y(30);
rhs = log(y(3))-(log(y(3)));
residual(30) = lhs - rhs;
lhs = y(31);
rhs = log(y(8))-(log(y(8)));
residual(31) = lhs - rhs;
lhs = y(32);
rhs = log(y(9))-(log(y(9)));
residual(32) = lhs - rhs;
lhs = y(33);
rhs = log(y(10))-(log(y(10)));
residual(33) = lhs - rhs;
lhs = y(34);
rhs = y(28)-y(31);
residual(34) = lhs - rhs;
lhs = y(35);
rhs = log(y(4))-(log(y(4)));
residual(35) = lhs - rhs;
lhs = y(36);
rhs = log(y(19))-(log(y(19)));
residual(36) = lhs - rhs;
lhs = y(37);
rhs = log(y(23))-(log(y(23)));
residual(37) = lhs - rhs;
lhs = y(38);
rhs = log(y(27))-(log(y(27)));
residual(38) = lhs - rhs;
lhs = y(39);
rhs = y(24)-params(3);
residual(39) = lhs - rhs;
lhs = y(40);
rhs = y(24)-params(3);
residual(40) = lhs - rhs;
lhs = y(41);
rhs = y(24)-params(3);
residual(41) = lhs - rhs;
lhs = y(42);
rhs = y(24)-params(3);
residual(42) = lhs - rhs;
lhs = y(43);
rhs = params(7)*(y(24)-params(3));
residual(43) = lhs - rhs;
residual(44) = y(44);
residual(45) = y(47);
residual(46) = y(45);
residual(47) = y(46);
residual(48) = y(48);
residual(49) = y(49);
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
