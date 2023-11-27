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
lhs = y(13);
rhs = y(11)+y(14)*T(10)*T(12);
residual(1) = lhs - rhs;
lhs = 0;
rhs = y(12)+T(12)*y(15)*T(10);
residual(2) = lhs - rhs;
lhs = y(17);
rhs = y(13)+y(22);
residual(3) = lhs - rhs;
lhs = y(20);
rhs = y(14)*T(5)*T(10)+y(14)*T(13);
residual(4) = lhs - rhs;
lhs = y(21);
rhs = y(15)*T(5)*T(10)+y(15)*T(13);
residual(5) = lhs - rhs;
lhs = y(27)+y(28);
rhs = y(17)-y(20)+T(14)*(y(11)+y(14)*T(10)-y(17));
residual(6) = lhs - rhs;
lhs = y(27)+y(29);
rhs = y(18)-y(21)+T(14)*(y(12)+y(15)*T(10)-y(18));
residual(7) = lhs - rhs;
lhs = y(26)+y(35)+y(31);
rhs = y(27)+y(28);
residual(8) = lhs - rhs;
lhs = y(25)+y(36)+y(32);
rhs = y(27)+y(29);
residual(9) = lhs - rhs;
lhs = y(43)+1/params(5)*y(30);
rhs = y(27)+y(22)*(-params(6))-y(13);
residual(10) = lhs - rhs;
lhs = y(33);
rhs = (1-params(3))*y(2)+params(3)*y(1)-T(1)*(params(10)*y(4)+(1-params(10))*y(3));
residual(11) = lhs - rhs;
lhs = y(14);
rhs = y(22)-y(40);
residual(12) = lhs - rhs;
lhs = y(15);
rhs = y(18)-y(13)-y(42)-y(40);
residual(13) = lhs - rhs;
lhs = y(13)+y(34);
rhs = y(22)*(-params(6))+(y(19)-y(17))*T(15);
residual(14) = lhs - rhs;
lhs = y(16);
rhs = y(56)-y(34)+y(55)*params(2)*T(1)+params(2)*y(53);
residual(15) = lhs - rhs;
lhs = y(16);
rhs = params(2)*y(53)+y(56)-y(34)+y(54)*params(2)*T(1);
residual(16) = lhs - rhs;
lhs = y(26);
rhs = y(16)+y(35)*params(4);
residual(17) = lhs - rhs;
lhs = y(25);
rhs = y(16)+y(36)*params(4);
residual(18) = lhs - rhs;
lhs = y(16);
rhs = params(3)*params(12)*(y(18)-y(33));
residual(19) = lhs - rhs;
lhs = y(47);
rhs = y(12)-y(11);
residual(20) = lhs - rhs;
lhs = y(17);
rhs = T(6)*(y(37)+y(11)+y(14)*T(10)*(1-T(5))+(y(35)+y(31))*T(3)+y(28)*T(4))-(T(6)-1)*(y(11)+y(14)*T(10));
residual(21) = lhs - rhs;
lhs = y(18);
rhs = T(6)*(y(38)+y(12)+y(15)*T(10)*(1-T(5))+(y(36)+y(32))*T(3)+y(29)*T(4))-(T(6)-1)*(y(12)+y(15)*T(10));
residual(22) = lhs - rhs;
lhs = y(23);
rhs = T(6)*(y(28)*T(4)+y(11)+y(37)+y(31)*T(3))-y(11)*(T(6)-1);
residual(23) = lhs - rhs;
lhs = y(24);
rhs = T(6)*(y(29)*T(4)+y(12)+y(38)+y(32)*T(3))-y(12)*(T(6)-1);
residual(24) = lhs - rhs;
lhs = y(30);
rhs = params(10)*y(29)+(1-params(10))*y(28);
residual(25) = lhs - rhs;
lhs = y(33);
rhs = params(10)*y(32)+(1-params(10))*y(31);
residual(26) = lhs - rhs;
lhs = y(19);
rhs = params(10)*y(18)+(1-params(10))*y(17);
residual(27) = lhs - rhs;
lhs = y(37);
rhs = params(14)*y(5)+x(it_, 2);
residual(28) = lhs - rhs;
lhs = y(39);
rhs = params(15)*y(6)+x(it_, 1);
residual(29) = lhs - rhs;
lhs = y(38);
rhs = y(37)+y(39);
residual(30) = lhs - rhs;
lhs = y(40);
rhs = params(16)*y(7)-x(it_, 3);
residual(31) = lhs - rhs;
lhs = y(41);
rhs = params(17)*y(8)-x(it_, 4);
residual(32) = lhs - rhs;
lhs = y(42);
rhs = y(41);
residual(33) = lhs - rhs;
lhs = y(43);
rhs = (params(18)+params(19))*y(9)+params(19)*(-params(18))*y(10)-x(it_, 5);
residual(34) = lhs - rhs;
lhs = y(45);
rhs = y(17)-y(11);
residual(35) = lhs - rhs;
lhs = y(46);
rhs = y(18)-y(12);
residual(36) = lhs - rhs;
lhs = y(44);
rhs = params(10)*(y(18)-y(12))+(1-params(10))*(y(17)-y(11));
residual(37) = lhs - rhs;
lhs = y(51);
rhs = params(10)*(y(24)-y(12))+(1-params(10))*(y(23)-y(11));
residual(38) = lhs - rhs;
lhs = y(49);
rhs = y(44)-(1-params(9))*y(33)-params(9)*y(30);
residual(39) = lhs - rhs;
lhs = y(50);
rhs = y(51)-(1-params(9))*y(33)-params(9)*y(30);
residual(40) = lhs - rhs;
lhs = y(48);
rhs = y(44)-y(30);
residual(41) = lhs - rhs;
lhs = y(52);
rhs = y(9);
residual(42) = lhs - rhs;

end
