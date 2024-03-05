function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
% function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = directed_search_simp.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(38, 1);
lhs = y(11);
rhs = y(9)+y(12)*T(3)*T(6);
residual(1) = lhs - rhs;
lhs = 0;
rhs = y(10)+T(6)*y(13)*T(3);
residual(2) = lhs - rhs;
lhs = y(14);
rhs = y(11)+y(19);
residual(3) = lhs - rhs;
lhs = y(17);
rhs = y(12)*T(7);
residual(4) = lhs - rhs;
lhs = y(18);
rhs = y(13)*T(7);
residual(5) = lhs - rhs;
lhs = y(22)+y(23);
rhs = y(14)-y(17);
residual(6) = lhs - rhs;
lhs = y(22)+y(24);
rhs = y(15)-y(18);
residual(7) = lhs - rhs;
lhs = y(21)+y(1);
rhs = y(22)+y(23);
residual(8) = lhs - rhs;
lhs = y(20)+y(2);
rhs = y(22)+y(24);
residual(9) = lhs - rhs;
lhs = y(34)+1/params(4)*y(25);
rhs = y(22)+y(29);
residual(10) = lhs - rhs;
lhs = y(28);
rhs = (1-params(3))*y(3)+params(3)*y(15);
residual(11) = lhs - rhs;
lhs = y(12);
rhs = y(19)-y(35);
residual(12) = lhs - rhs;
lhs = y(13);
rhs = y(15)-y(11)-y(35);
residual(13) = lhs - rhs;
lhs = y(11)+y(29);
rhs = y(19)*(-params(5))+(y(16)-y(14))*T(8);
residual(14) = lhs - rhs;
lhs = 0;
rhs = y(49)-y(29)+y(48)*T(1);
residual(15) = lhs - rhs;
lhs = 0;
rhs = y(49)-y(29)+y(47)*T(1);
residual(16) = lhs - rhs;
lhs = y(41);
rhs = y(10)-y(9);
residual(17) = lhs - rhs;
lhs = y(14);
rhs = y(23)*(1-(1-params(6)*params(7)))+(1-params(6)*params(7))*y(1)+y(31)+y(9)+y(12)*T(3);
residual(18) = lhs - rhs;
lhs = y(15);
rhs = y(24)*(1-(1-params(6)*params(7)))+(1-params(6)*params(7))*y(2)+y(32)+y(10)+y(13)*T(3);
residual(19) = lhs - rhs;
lhs = y(25);
rhs = y(23)*T(5)+y(24)*T(2);
residual(20) = lhs - rhs;
lhs = y(28);
rhs = y(26)*T(5)+y(27)*T(2);
residual(21) = lhs - rhs;
lhs = y(30);
rhs = T(5)*y(12)*T(3)+T(2)*y(13)*T(3);
residual(22) = lhs - rhs;
lhs = y(16);
rhs = y(14)*T(5)+y(15)*T(2);
residual(23) = lhs - rhs;
lhs = y(31);
rhs = params(10)*y(4)+x(it_, 2);
residual(24) = lhs - rhs;
lhs = y(33);
rhs = params(11)*y(5)+x(it_, 1);
residual(25) = lhs - rhs;
lhs = y(32);
rhs = y(31)+y(33);
residual(26) = lhs - rhs;
lhs = y(35);
rhs = params(12)*y(7)-x(it_, 4);
residual(27) = lhs - rhs;
lhs = y(34);
rhs = (params(13)+params(14))*y(6)+params(14)*(-params(13))*y(8)-x(it_, 3);
residual(28) = lhs - rhs;
lhs = y(36);
rhs = y(14)-y(9);
residual(29) = lhs - rhs;
lhs = y(37);
rhs = y(15)-y(10);
residual(30) = lhs - rhs;
lhs = y(40);
rhs = (y(14)-y(9))*T(5)+(y(15)-y(10))*T(2);
residual(31) = lhs - rhs;
lhs = y(45);
rhs = y(22)-y(10);
residual(32) = lhs - rhs;
lhs = y(44);
rhs = y(40)-(1-params(7))*y(3)-params(7)*y(25);
residual(33) = lhs - rhs;
lhs = y(42);
rhs = y(40)-y(25);
residual(34) = lhs - rhs;
lhs = y(43);
rhs = y(25)+y(45)-y(40);
residual(35) = lhs - rhs;
lhs = y(38);
rhs = y(23);
residual(36) = lhs - rhs;
lhs = y(39);
rhs = y(24);
residual(37) = lhs - rhs;
lhs = y(46);
rhs = y(6);
residual(38) = lhs - rhs;

end
