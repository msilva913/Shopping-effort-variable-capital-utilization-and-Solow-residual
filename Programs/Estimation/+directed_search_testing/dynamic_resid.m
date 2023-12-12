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
residual = zeros(43, 1);
lhs = y(16);
rhs = y(14)+y(17)*T(10)*T(14);
residual(1) = lhs - rhs;
lhs = 0;
rhs = y(15)+T(14)*y(18)*T(10);
residual(2) = lhs - rhs;
lhs = y(21);
rhs = y(16)+y(28);
residual(3) = lhs - rhs;
lhs = y(26);
rhs = y(17)*T(5)*T(10)+y(17)*T(15);
residual(4) = lhs - rhs;
lhs = y(27);
rhs = y(18)*T(5)*T(10)+y(18)*T(15);
residual(5) = lhs - rhs;
lhs = y(33)+y(34);
rhs = y(21)-y(26)+T(16)*(y(14)+y(17)*T(10)-y(21));
residual(6) = lhs - rhs;
lhs = y(33)+y(35);
rhs = y(22)-y(27)+T(16)*(y(15)+y(18)*T(10)-y(22));
residual(7) = lhs - rhs;
lhs = y(32)+y(41)+y(37);
rhs = y(33)+y(34);
residual(8) = lhs - rhs;
lhs = y(31)+y(42)+y(38);
rhs = y(33)+y(35);
residual(9) = lhs - rhs;
lhs = y(45)+1/params(5)*y(36);
rhs = y(33)+y(28)*(-params(6))-y(16);
residual(10) = lhs - rhs;
lhs = y(37);
rhs = (1-params(3))*y(6)+params(3)*y(2)-T(1)*(1-params(10))*y(8);
residual(11) = lhs - rhs;
lhs = y(38);
rhs = (1-params(3))*y(7)+params(3)*y(3)-params(10)*y(9)*T(1);
residual(12) = lhs - rhs;
lhs = y(17);
rhs = y(28)-y(44);
residual(13) = lhs - rhs;
lhs = y(18);
rhs = y(22)-y(16)-y(44);
residual(14) = lhs - rhs;
lhs = y(16)+y(40);
rhs = T(17)*(y(28)*T(13)-(y(25)-y(21))*T(12)-params(14)*(y(5)*T(13)-(y(4)-y(1))*T(12)));
residual(15) = lhs - rhs;
lhs = y(19);
rhs = y(61)-y(40)+y(60)*params(2)*T(1)+params(2)*y(57);
residual(16) = lhs - rhs;
lhs = y(20);
rhs = y(61)-y(40)+y(59)*params(2)*T(1)+params(2)*y(58);
residual(17) = lhs - rhs;
lhs = y(32);
rhs = y(19)+y(41)*params(4);
residual(18) = lhs - rhs;
lhs = y(31);
rhs = y(20)+y(42)*params(4);
residual(19) = lhs - rhs;
lhs = y(19);
rhs = params(3)*params(12)*(y(23)-y(37));
residual(20) = lhs - rhs;
lhs = y(20);
rhs = params(3)*params(12)*(y(24)-y(38));
residual(21) = lhs - rhs;
lhs = y(49);
rhs = y(15)-y(14);
residual(22) = lhs - rhs;
lhs = y(21);
rhs = T(6)*(y(43)+y(14)+y(17)*T(10)*(1-T(5))+(y(41)+y(37))*T(3)+y(34)*T(4))-(T(6)-1)*(y(14)+y(17)*T(10));
residual(23) = lhs - rhs;
lhs = y(22);
rhs = T(6)*(y(43)+y(15)+y(18)*T(10)*(1-T(5))+(y(42)+y(38))*T(3)+y(35)*T(4))-(T(6)-1)*(y(15)+y(18)*T(10));
residual(24) = lhs - rhs;
lhs = y(29);
rhs = T(6)*(y(34)*T(4)+y(14)+y(43)+y(37)*T(3))-y(14)*(T(6)-1);
residual(25) = lhs - rhs;
lhs = y(30);
rhs = T(6)*(y(35)*T(4)+y(15)+y(43)+y(38)*T(3))-y(15)*(T(6)-1);
residual(26) = lhs - rhs;
lhs = y(36);
rhs = params(10)*y(35)+(1-params(10))*y(34);
residual(27) = lhs - rhs;
lhs = y(39);
rhs = params(10)*y(38)+(1-params(10))*y(37);
residual(28) = lhs - rhs;
lhs = y(22);
rhs = params(10)*y(24)+(1-params(10))*y(23);
residual(29) = lhs - rhs;
lhs = y(25);
rhs = params(10)*y(22)+(1-params(10))*y(21);
residual(30) = lhs - rhs;
lhs = y(43);
rhs = params(15)*y(10)+x(it_, 1);
residual(31) = lhs - rhs;
lhs = y(44);
rhs = params(17)*y(11)-x(it_, 2);
residual(32) = lhs - rhs;
lhs = y(45);
rhs = (params(19)+params(20))*y(12)+params(20)*(-params(19))*y(13)-x(it_, 3);
residual(33) = lhs - rhs;
lhs = y(47);
rhs = y(21)-y(14);
residual(34) = lhs - rhs;
lhs = y(48);
rhs = y(22)-y(15);
residual(35) = lhs - rhs;
lhs = y(46);
rhs = params(10)*(y(22)-y(15))+(1-params(10))*(y(21)-y(14));
residual(36) = lhs - rhs;
lhs = y(53);
rhs = y(33)-y(15);
residual(37) = lhs - rhs;
lhs = y(55);
rhs = params(10)*(y(30)-y(15))+(1-params(10))*(y(29)-y(14));
residual(38) = lhs - rhs;
lhs = y(52);
rhs = y(46)-(1-params(9))*y(39)-params(9)*y(36);
residual(39) = lhs - rhs;
lhs = y(54);
rhs = y(55)-(1-params(9))*y(39)-params(9)*y(36);
residual(40) = lhs - rhs;
lhs = y(50);
rhs = y(46)-y(36);
residual(41) = lhs - rhs;
lhs = y(51);
rhs = y(36)+y(53)-y(46);
residual(42) = lhs - rhs;
lhs = y(56);
rhs = y(12);
residual(43) = lhs - rhs;

end
