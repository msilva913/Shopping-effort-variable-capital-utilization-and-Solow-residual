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
    T = directed_search_testing_only_C.static_resid_tt(T, y, x, params);
end
residual = zeros(41, 1);
lhs = y(2);
rhs = y(1)+T(2)*y(3)*(1-T(1));
residual(1) = lhs - rhs;
lhs = y(6);
rhs = y(2)+y(8);
residual(2) = lhs - rhs;
lhs = y(7);
rhs = y(3)*T(2)*params(6)*(1-(1-params(7)*params(8)))+y(3)*T(4);
residual(3) = lhs - rhs;
lhs = y(14)+y(15);
rhs = y(6)-y(7);
residual(4) = lhs - rhs;
lhs = y(14)+y(16);
rhs = y(11);
residual(5) = lhs - rhs;
lhs = y(32)+1/params(4)*y(17);
rhs = y(14)+y(8)*(-params(5))-y(2);
residual(6) = lhs - rhs;
lhs = y(18);
rhs = y(18)*(1-T(3))+T(3)*y(12)-y(23)*T(5);
residual(7) = lhs - rhs;
lhs = y(19);
rhs = (1-T(3))*y(19)+T(3)*y(13)-T(5)*y(24);
residual(8) = lhs - rhs;
lhs = y(3);
rhs = y(8)-y(30);
residual(9) = lhs - rhs;
lhs = y(8)*(-params(5));
rhs = y(2)+y(21);
residual(10) = lhs - rhs;
lhs = y(4);
rhs = params(2)*y(4)+(y(6)-y(18)-y(23)-y(7))*params(2)*T(5);
residual(11) = lhs - rhs;
lhs = y(5);
rhs = params(2)*y(5)+params(2)*T(5)*(y(11)-y(19)-y(24));
residual(12) = lhs - rhs;
lhs = y(18)+y(23)+y(4)+y(23)*params(3);
rhs = y(6)-y(7);
residual(13) = lhs - rhs;
lhs = y(19)+y(24)+y(5)+y(24)*params(3);
rhs = y(11);
residual(14) = lhs - rhs;
lhs = y(4);
rhs = (y(12)-y(18))*T(3)*params(11);
residual(15) = lhs - rhs;
lhs = y(5);
rhs = T(3)*params(11)*(y(13)-y(19));
residual(16) = lhs - rhs;
lhs = y(36);
rhs = (-y(1));
residual(17) = lhs - rhs;
lhs = y(6);
rhs = (1-(1-params(7)*params(8)))*y(15)+(1-params(7)*params(8))*(y(18)+y(23))+y(26)+y(1)+y(3)*T(2)*(1-params(6)*(1-(1-params(7)*params(8))));
residual(18) = lhs - rhs;
lhs = y(11);
rhs = y(27)+(1-params(7)*params(8))*(y(19)+y(24))+(1-(1-params(7)*params(8)))*y(16);
residual(19) = lhs - rhs;
lhs = y(9);
rhs = (1-(1-params(7)*params(8)))*y(15)+y(1)+y(26)+(1-params(7)*params(8))*y(18);
residual(20) = lhs - rhs;
lhs = y(10);
rhs = (1-(1-params(7)*params(8)))*y(16)+y(27)+(1-params(7)*params(8))*y(19);
residual(21) = lhs - rhs;
lhs = y(17);
rhs = params(9)*y(16)+(1-params(9))*y(15);
residual(22) = lhs - rhs;
lhs = y(20);
rhs = params(9)*y(19)+(1-params(9))*y(18);
residual(23) = lhs - rhs;
lhs = y(11);
rhs = params(9)*y(13)+(1-params(9))*y(12);
residual(24) = lhs - rhs;
lhs = y(25);
rhs = params(9)*(1-params(7)*params(8))*y(24)+(1-params(9))*(T(2)*y(3)+(1-params(7)*params(8))*y(23));
residual(25) = lhs - rhs;
lhs = (1-params(9))*y(6);
rhs = params(8)*y(6)+(1-params(8)-params(9))*y(22);
residual(26) = lhs - rhs;
lhs = y(26);
rhs = y(26)*params(13)+x(2);
residual(27) = lhs - rhs;
lhs = y(28);
rhs = y(27)*params(14)+x(1);
residual(28) = lhs - rhs;
lhs = y(27);
rhs = y(26)+y(28);
residual(29) = lhs - rhs;
lhs = y(31);
rhs = y(31)*params(15)+x(3);
residual(30) = lhs - rhs;
lhs = y(30);
rhs = (-y(31));
residual(31) = lhs - rhs;
lhs = y(29);
rhs = y(31);
residual(32) = lhs - rhs;
lhs = y(32);
rhs = (params(17)+params(18))*y(32)+params(18)*(-params(17))*y(32)-x(4);
residual(33) = lhs - rhs;
lhs = y(34);
rhs = y(6)-y(1);
residual(34) = lhs - rhs;
lhs = y(35);
rhs = y(11);
residual(35) = lhs - rhs;
lhs = y(33);
rhs = params(9)*y(11)+(1-params(9))*(y(6)-y(1));
residual(36) = lhs - rhs;
lhs = y(40);
rhs = params(9)*y(10)+(1-params(9))*(y(9)-y(1));
residual(37) = lhs - rhs;
lhs = y(38);
rhs = y(33)-(1-params(8))*y(20)-params(8)*y(17);
residual(38) = lhs - rhs;
lhs = y(39);
rhs = y(40)-(1-params(8))*y(20)-params(8)*y(17);
residual(39) = lhs - rhs;
lhs = y(37);
rhs = y(33)-y(17);
residual(40) = lhs - rhs;
lhs = y(41);
rhs = y(32);
residual(41) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
