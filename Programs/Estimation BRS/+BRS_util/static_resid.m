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
residual = zeros(46, 1);
lhs = T(10);
rhs = (1-params(8))*y(17);
residual(1) = lhs - rhs;
lhs = T(11);
rhs = params(8)*y(2)/y(19);
residual(2) = lhs - rhs;
lhs = T(11);
rhs = params(8)*y(22)*y(3)/y(20);
residual(3) = lhs - rhs;
lhs = y(21);
rhs = y(2)-T(13)-T(14);
residual(4) = lhs - rhs;
lhs = y(22)*T(15);
rhs = T(16)*T(15)*T(18);
residual(5) = lhs - rhs;
lhs = y(16);
rhs = y(15);
residual(6) = lhs - rhs;
lhs = y(2);
rhs = T(19)*T(24);
residual(7) = lhs - rhs;
lhs = y(3);
rhs = T(25)*T(29);
residual(8) = lhs - rhs;
lhs = y(3)*exp(y(23));
rhs = exp(y(23))*(y(5)+y(6))-T(17)*(y(5)+y(6));
residual(9) = lhs - rhs;
lhs = (1-params(8))*y(17);
rhs = (1-params(8))*params(7)*y(2)/y(8);
residual(10) = lhs - rhs;
lhs = (1-params(8))*y(15);
rhs = exp(y(23))*T(1)*y(2)/y(5);
residual(11) = lhs - rhs;
lhs = (1-params(8))*y(17)/y(22);
rhs = (1-params(8))*params(7)*y(3)/y(9);
residual(12) = lhs - rhs;
lhs = (1-params(8))*y(16)/y(22);
rhs = exp(y(23))*T(1)*y(3)/y(6);
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
rhs = y(2)+params(16)*y(3);
residual(17) = lhs - rhs;
lhs = y(24);
rhs = T(20);
residual(18) = lhs - rhs;
lhs = y(25);
rhs = T(26);
residual(19) = lhs - rhs;
lhs = y(26);
rhs = y(24)*y(2)/(y(2)+y(3))+y(25)*y(3)/(y(2)+y(3));
residual(20) = lhs - rhs;
lhs = y(23);
rhs = params(3)*(1-params(11))+y(23)*params(11)+x(1);
residual(21) = lhs - rhs;
lhs = y(10);
rhs = y(10)*params(12)+x(2);
residual(22) = lhs - rhs;
lhs = y(11);
rhs = y(12)*params(13)+x(3);
residual(23) = lhs - rhs;
lhs = y(12);
rhs = y(10)+y(11);
residual(24) = lhs - rhs;
lhs = y(13);
rhs = y(13)*params(14)-x(4);
residual(25) = lhs - rhs;
lhs = y(14);
rhs = y(14)*params(15)-x(5);
residual(26) = lhs - rhs;
lhs = y(27);
rhs = log(y(1))-(log(y(1)));
residual(27) = lhs - rhs;
lhs = y(28);
rhs = log(y(2))-(log(y(2)));
residual(28) = lhs - rhs;
lhs = y(29);
rhs = log(y(3))-(log(y(3)));
residual(29) = lhs - rhs;
lhs = y(30);
rhs = log(y(7))-(log(y(7)));
residual(30) = lhs - rhs;
lhs = y(31);
rhs = log(y(8))-(log(y(8)));
residual(31) = lhs - rhs;
lhs = y(32);
rhs = log(y(9))-(log(y(9)));
residual(32) = lhs - rhs;
lhs = y(33);
rhs = y(27)-y(30);
residual(33) = lhs - rhs;
lhs = y(34);
rhs = log(y(18))-(log(y(18)));
residual(34) = lhs - rhs;
lhs = y(35);
rhs = log(y(22))-(log(y(22)));
residual(35) = lhs - rhs;
lhs = y(36);
rhs = log(y(26))-(log(y(26)));
residual(36) = lhs - rhs;
lhs = y(37);
rhs = y(23)-params(3);
residual(37) = lhs - rhs;
lhs = y(38);
rhs = y(23)-params(3);
residual(38) = lhs - rhs;
lhs = y(39);
rhs = y(23)-params(3);
residual(39) = lhs - rhs;
lhs = y(40);
rhs = y(23)-params(3);
residual(40) = lhs - rhs;
residual(41) = y(41);
residual(42) = y(44);
residual(43) = y(42);
residual(44) = y(43);
residual(45) = y(45);
residual(46) = y(46);
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
