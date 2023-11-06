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
    T = directed_search_testing.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(42, 1);
lhs = y(15);
rhs = y(13)+y(16)*T(7)*(1-T(5));
residual(1) = lhs - rhs;
lhs = 0;
rhs = y(14)+(1-T(5))*y(17)*T(7);
residual(2) = lhs - rhs;
lhs = y(18);
rhs = y(15)+y(21);
residual(3) = lhs - rhs;
lhs = y(19);
rhs = y(16)*T(4)*T(7)+y(16)*T(9);
residual(4) = lhs - rhs;
lhs = y(20);
rhs = y(17)*T(4)*T(7)+y(17)*T(9);
residual(5) = lhs - rhs;
lhs = y(27)+y(28);
rhs = y(18)-y(19);
residual(6) = lhs - rhs;
lhs = y(27)+y(29);
rhs = y(24)-y(20);
residual(7) = lhs - rhs;
lhs = y(27)+y(30);
rhs = y(24);
residual(8) = lhs - rhs;
lhs = y(45)+1/params(5)*y(31);
rhs = y(27)+y(21)*(-params(6))-y(15);
residual(9) = lhs - rhs;
lhs = y(32);
rhs = (1-params(3))*y(3)+params(3)*y(1)-y(5)*T(1);
residual(10) = lhs - rhs;
lhs = y(33);
rhs = (1-params(3))*y(4)+params(3)*y(2)-y(6)*T(1);
residual(11) = lhs - rhs;
lhs = y(16);
rhs = y(21)-y(43);
residual(12) = lhs - rhs;
lhs = y(17);
rhs = y(30)+y(41);
residual(13) = lhs - rhs;
lhs = y(21)*(-params(6));
rhs = y(15)+y(35);
residual(14) = lhs - rhs;
lhs = 0;
rhs = y(61)-y(35)+(y(55)-y(56)-y(59)-y(62))*params(2)*T(1);
residual(15) = lhs - rhs;
lhs = 0;
rhs = y(61)-y(35)+(y(58)-y(57)-y(60)-y(63))*params(2)*T(1);
residual(16) = lhs - rhs;
lhs = y(32)+y(36)+y(36)*params(4);
rhs = y(18)-y(19);
residual(17) = lhs - rhs;
lhs = y(33)+y(37)+params(4)*y(37);
rhs = y(24)-y(20);
residual(18) = lhs - rhs;
lhs = y(49);
rhs = y(14)-y(13);
residual(19) = lhs - rhs;
lhs = y(18);
rhs = y(38)+y(13)+y(16)*T(7)*(1-T(4))+(y(32)+y(36))*T(2)+y(28)*T(3);
residual(20) = lhs - rhs;
lhs = y(24);
rhs = y(39)+y(14)+y(17)*T(7)*(1-T(4))+(y(33)+y(37))*T(2)+y(29)*T(3);
residual(21) = lhs - rhs;
lhs = y(22);
rhs = y(28)*T(3)+y(13)+y(38)+y(32)*T(2);
residual(22) = lhs - rhs;
lhs = y(23);
rhs = y(29)*T(3)+y(14)+y(39)+y(33)*T(2);
residual(23) = lhs - rhs;
lhs = y(31);
rhs = (params(10)*y(29)+(1-params(10))*y(28))*(1-T(8))+y(30)*T(8);
residual(24) = lhs - rhs;
lhs = y(34);
rhs = params(10)*y(33)+(1-params(10))*y(32);
residual(25) = lhs - rhs;
lhs = y(24);
rhs = params(10)*y(26)+(1-params(10))*y(25);
residual(26) = lhs - rhs;
lhs = y(38);
rhs = params(14)*y(7)+x(it_, 2);
residual(27) = lhs - rhs;
lhs = y(40);
rhs = params(15)*y(8)+x(it_, 1);
residual(28) = lhs - rhs;
lhs = y(39);
rhs = y(38)+y(40);
residual(29) = lhs - rhs;
lhs = y(44);
rhs = params(16)*y(10)+x(it_, 3);
residual(30) = lhs - rhs;
lhs = y(43);
rhs = (-y(44));
residual(31) = lhs - rhs;
lhs = y(41);
rhs = params(17)*y(9)+x(it_, 4);
residual(32) = lhs - rhs;
lhs = y(42);
rhs = y(41)+y(44);
residual(33) = lhs - rhs;
lhs = y(45);
rhs = (params(18)+params(19))*y(11)+params(19)*(-params(18))*y(12)-x(it_, 5);
residual(34) = lhs - rhs;
lhs = y(47);
rhs = y(18)-y(13);
residual(35) = lhs - rhs;
lhs = y(48);
rhs = y(24)-y(14);
residual(36) = lhs - rhs;
lhs = y(46);
rhs = params(10)*(y(24)-y(14))+(1-params(10))*(y(18)-y(13));
residual(37) = lhs - rhs;
lhs = y(53);
rhs = params(10)*(y(23)-y(14))+(1-params(10))*(y(22)-y(13));
residual(38) = lhs - rhs;
lhs = y(51);
rhs = y(46)-(1-params(9))*y(34)-params(9)*y(31);
residual(39) = lhs - rhs;
lhs = y(52);
rhs = y(53)-(1-params(9))*y(34)-params(9)*y(31);
residual(40) = lhs - rhs;
lhs = y(50);
rhs = y(46)-y(31);
residual(41) = lhs - rhs;
lhs = y(54);
rhs = y(11);
residual(42) = lhs - rhs;

end
