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
residual = zeros(45, 1);
lhs = y(15);
rhs = y(13)+y(16)*T(7)*(1-T(5));
residual(1) = lhs - rhs;
lhs = 0;
rhs = y(14)+(1-T(5))*y(17)*T(7);
residual(2) = lhs - rhs;
lhs = y(20);
rhs = y(15)+y(23);
residual(3) = lhs - rhs;
lhs = y(21);
rhs = y(16)*T(4)*T(7)+y(16)*T(9);
residual(4) = lhs - rhs;
lhs = y(22);
rhs = y(17)*T(4)*T(7)+y(17)*T(9);
residual(5) = lhs - rhs;
lhs = y(29)+y(30);
rhs = y(20)-y(21);
residual(6) = lhs - rhs;
lhs = y(29)+y(31);
rhs = y(26)-y(22);
residual(7) = lhs - rhs;
lhs = y(29)+y(32);
rhs = y(26);
residual(8) = lhs - rhs;
lhs = y(48)+1/params(5)*y(33);
rhs = y(29)+y(23)*(-params(6))-y(15);
residual(9) = lhs - rhs;
lhs = y(34);
rhs = (1-params(3))*y(3)+params(3)*y(1)-y(5)*T(1);
residual(10) = lhs - rhs;
lhs = y(35);
rhs = (1-params(3))*y(4)+params(3)*y(2)-y(6)*T(1);
residual(11) = lhs - rhs;
lhs = y(16)*T(7)*(1/params(11)+T(5)-1);
rhs = y(23)-y(46);
residual(12) = lhs - rhs;
lhs = y(17);
rhs = y(32)+y(45);
residual(13) = lhs - rhs;
lhs = y(23)*(-params(6));
rhs = y(15)+y(37);
residual(14) = lhs - rhs;
lhs = y(18);
rhs = y(66)-y(37)+(y(60)-y(64)-y(67)-y(61))*params(2)*T(1)+params(2)*y(58);
residual(15) = lhs - rhs;
lhs = y(19);
rhs = y(66)-y(37)+(y(63)-y(65)-y(68)-y(62))*params(2)*T(1)+params(2)*y(59);
residual(16) = lhs - rhs;
lhs = y(34)+y(18)+y(39)+y(39)*params(4);
rhs = y(20)-y(21);
residual(17) = lhs - rhs;
lhs = y(35)+y(19)+y(40)+params(4)*y(40);
rhs = y(26)-y(22);
residual(18) = lhs - rhs;
lhs = y(18);
rhs = params(3)*params(12)*(y(27)-y(34));
residual(19) = lhs - rhs;
lhs = y(19);
rhs = params(3)*params(12)*(y(28)-y(35));
residual(20) = lhs - rhs;
lhs = y(52);
rhs = y(14)-y(13);
residual(21) = lhs - rhs;
lhs = y(20);
rhs = y(42)+y(13)+y(16)*T(7)*(1-T(4))+(y(34)+y(39))*T(2)+y(30)*T(3);
residual(22) = lhs - rhs;
lhs = y(26);
rhs = y(43)+y(14)+y(17)*T(7)*(1-T(4))+(y(35)+y(40))*T(2)+y(31)*T(3);
residual(23) = lhs - rhs;
lhs = y(24);
rhs = y(30)*T(3)+y(13)+y(42)+y(34)*T(2);
residual(24) = lhs - rhs;
lhs = y(25);
rhs = y(31)*T(3)+y(14)+y(43)+y(35)*T(2);
residual(25) = lhs - rhs;
lhs = y(33);
rhs = (params(10)*y(31)+(1-params(10))*y(30))*(1-T(8))+y(32)*T(8);
residual(26) = lhs - rhs;
lhs = y(36);
rhs = params(10)*y(35)+(1-params(10))*y(34);
residual(27) = lhs - rhs;
lhs = y(26);
rhs = params(10)*y(28)+(1-params(10))*y(27);
residual(28) = lhs - rhs;
lhs = y(41);
rhs = (1-params(10))*(y(16)*T(7)+y(39)*T(2))+params(10)*(y(17)*T(7)+y(40)*T(2));
residual(29) = lhs - rhs;
lhs = (1-params(10))*y(20);
rhs = params(9)*y(20)+(1-params(9)-params(10))*y(38);
residual(30) = lhs - rhs;
lhs = y(42);
rhs = params(14)*y(7)+x(it_, 2);
residual(31) = lhs - rhs;
lhs = y(44);
rhs = params(15)*y(8)+x(it_, 1);
residual(32) = lhs - rhs;
lhs = y(43);
rhs = y(42)+y(44);
residual(33) = lhs - rhs;
lhs = y(47);
rhs = params(16)*y(10)+x(it_, 3);
residual(34) = lhs - rhs;
lhs = y(46);
rhs = (-y(47));
residual(35) = lhs - rhs;
lhs = y(45);
rhs = params(17)*y(9)+x(it_, 4);
residual(36) = lhs - rhs;
lhs = y(48);
rhs = (params(18)+params(19))*y(11)+params(19)*(-params(18))*y(12)-x(it_, 5);
residual(37) = lhs - rhs;
lhs = y(50);
rhs = y(20)-y(13);
residual(38) = lhs - rhs;
lhs = y(51);
rhs = y(26)-y(14);
residual(39) = lhs - rhs;
lhs = y(49);
rhs = params(10)*(y(26)-y(14))+(1-params(10))*(y(20)-y(13));
residual(40) = lhs - rhs;
lhs = y(56);
rhs = params(10)*(y(25)-y(14))+(1-params(10))*(y(24)-y(13));
residual(41) = lhs - rhs;
lhs = y(54);
rhs = y(49)-(1-params(9))*y(36)-params(9)*y(33);
residual(42) = lhs - rhs;
lhs = y(55);
rhs = y(56)-(1-params(9))*y(36)-params(9)*y(33);
residual(43) = lhs - rhs;
lhs = y(53);
rhs = y(49)-y(33);
residual(44) = lhs - rhs;
lhs = y(57);
rhs = y(11);
residual(45) = lhs - rhs;

end
