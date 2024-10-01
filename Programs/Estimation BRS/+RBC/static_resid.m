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
    T = RBC.static_resid_tt(T, y, x, params);
end
residual = zeros(38, 1);
lhs = T(5);
rhs = y(17);
residual(1) = lhs - rhs;
lhs = y(18);
rhs = y(2)-T(6);
residual(2) = lhs - rhs;
lhs = T(7)*y(19);
rhs = T(8)*T(7)*params(2)*(y(15)+y(19)*T(9));
residual(3) = lhs - rhs;
lhs = y(16);
rhs = y(15);
residual(4) = lhs - rhs;
lhs = y(2);
rhs = T(10)*T(15);
residual(5) = lhs - rhs;
lhs = y(3);
rhs = T(16)*T(20);
residual(6) = lhs - rhs;
lhs = exp(y(20))*y(3);
rhs = exp(y(20))*(y(6)+y(7))-T(9)*(y(6)+y(7));
residual(7) = lhs - rhs;
lhs = y(17);
rhs = params(7)*y(2)/y(9);
residual(8) = lhs - rhs;
lhs = y(15);
rhs = exp(y(20))*T(1)*y(2)/y(6);
residual(9) = lhs - rhs;
lhs = y(17)/y(19);
rhs = params(7)*y(3)/y(10);
residual(10) = lhs - rhs;
lhs = y(16)/y(19);
rhs = exp(y(20))*T(1)*y(3)/y(7);
residual(11) = lhs - rhs;
lhs = y(8);
rhs = y(9)+y(10);
residual(12) = lhs - rhs;
lhs = y(5);
rhs = y(6)+y(7);
residual(13) = lhs - rhs;
lhs = y(1);
rhs = y(2)+params(12)*y(3);
residual(14) = lhs - rhs;
lhs = y(4);
rhs = T(21)*T(26);
residual(15) = lhs - rhs;
lhs = y(20);
rhs = params(3)*(1-params(8))+y(20)*params(8)+x(1);
residual(16) = lhs - rhs;
lhs = y(11);
rhs = y(11)*params(9)+x(2);
residual(17) = lhs - rhs;
lhs = y(12);
rhs = y(13)*params(10)+x(3);
residual(18) = lhs - rhs;
lhs = y(13);
rhs = y(11)+y(12);
residual(19) = lhs - rhs;
lhs = y(14);
rhs = y(14)*params(11)-x(4);
residual(20) = lhs - rhs;
lhs = y(21);
rhs = log(y(1))-(log(y(1)));
residual(21) = lhs - rhs;
lhs = y(22);
rhs = log(y(2))-(log(y(2)));
residual(22) = lhs - rhs;
lhs = y(23);
rhs = log(y(3))-(log(y(3)));
residual(23) = lhs - rhs;
lhs = y(24);
rhs = log(y(8))-(log(y(8)));
residual(24) = lhs - rhs;
lhs = y(25);
rhs = log(y(9))-(log(y(9)));
residual(25) = lhs - rhs;
lhs = y(26);
rhs = log(y(10))-(log(y(10)));
residual(26) = lhs - rhs;
lhs = y(27);
rhs = y(21)-y(24);
residual(27) = lhs - rhs;
lhs = y(28);
rhs = log(y(4))-(log(y(4)));
residual(28) = lhs - rhs;
lhs = y(29);
rhs = log(y(19))-(log(y(19)));
residual(29) = lhs - rhs;
lhs = y(30);
rhs = y(20)-params(3);
residual(30) = lhs - rhs;
lhs = y(31);
rhs = y(20)-params(3);
residual(31) = lhs - rhs;
lhs = y(32);
rhs = y(20)-params(3);
residual(32) = lhs - rhs;
lhs = y(33);
rhs = y(20)-params(3);
residual(33) = lhs - rhs;
lhs = y(34);
rhs = params(7)*(y(20)-params(3));
residual(34) = lhs - rhs;
residual(35) = y(35);
residual(36) = y(38);
residual(37) = y(36);
residual(38) = y(37);
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
