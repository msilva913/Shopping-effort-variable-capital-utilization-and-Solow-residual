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
    T = directed_search_testing_only_C.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(41, 1);
lhs = y(13);
rhs = y(12)+y(14)*T(2)*(1-T(1));
residual(1) = lhs - rhs;
lhs = y(17);
rhs = y(13)+y(19);
residual(2) = lhs - rhs;
lhs = y(18);
rhs = y(14)*T(2)*params(6)*(1-(1-params(7)*params(8)))+y(14)*T(4);
residual(3) = lhs - rhs;
lhs = y(25)+y(26);
rhs = y(17)-y(18);
residual(4) = lhs - rhs;
lhs = y(25)+y(27);
rhs = y(22);
residual(5) = lhs - rhs;
lhs = y(43)+1/params(4)*y(28);
rhs = y(25)+y(19)*(-params(5))-y(13);
residual(6) = lhs - rhs;
lhs = y(29);
rhs = y(3)*(1-T(3))+y(1)*T(3)-y(5)*T(5);
residual(7) = lhs - rhs;
lhs = y(30);
rhs = y(4)*(1-T(3))+y(2)*T(3)-y(6)*T(5);
residual(8) = lhs - rhs;
lhs = y(14);
rhs = y(19)-y(41);
residual(9) = lhs - rhs;
lhs = y(19)*(-params(5));
rhs = y(13)+y(32);
residual(10) = lhs - rhs;
lhs = y(15);
rhs = params(2)*y(53)+y(60)-y(32)+(y(55)-y(58)-y(61)-y(56))*params(2)*T(5);
residual(11) = lhs - rhs;
lhs = y(16);
rhs = params(2)*y(54)+y(60)-y(32)+(y(57)-y(59)-y(62))*params(2)*T(5);
residual(12) = lhs - rhs;
lhs = y(29)+y(15)+y(34)+y(34)*params(3);
rhs = y(17)-y(18);
residual(13) = lhs - rhs;
lhs = y(30)+y(16)+y(35)+params(3)*y(35);
rhs = y(22);
residual(14) = lhs - rhs;
lhs = y(15);
rhs = (y(23)-y(29))*params(11)*T(3);
residual(15) = lhs - rhs;
lhs = y(16);
rhs = (y(24)-y(30))*params(11)*T(3);
residual(16) = lhs - rhs;
lhs = y(47);
rhs = (-y(12));
residual(17) = lhs - rhs;
lhs = y(17);
rhs = y(26)*(1-(1-params(7)*params(8)))+(1-params(7)*params(8))*(y(29)+y(34))+y(37)+y(12)+y(14)*T(2)*(1-params(6)*(1-(1-params(7)*params(8))));
residual(18) = lhs - rhs;
lhs = y(22);
rhs = y(38)+(1-params(7)*params(8))*(y(30)+y(35))+y(27)*(1-(1-params(7)*params(8)));
residual(19) = lhs - rhs;
lhs = y(20);
rhs = y(26)*(1-(1-params(7)*params(8)))+y(12)+y(37)+(1-params(7)*params(8))*y(29);
residual(20) = lhs - rhs;
lhs = y(21);
rhs = y(27)*(1-(1-params(7)*params(8)))+y(38)+(1-params(7)*params(8))*y(30);
residual(21) = lhs - rhs;
lhs = y(28);
rhs = params(9)*y(27)+(1-params(9))*y(26);
residual(22) = lhs - rhs;
lhs = y(31);
rhs = params(9)*y(30)+(1-params(9))*y(29);
residual(23) = lhs - rhs;
lhs = y(22);
rhs = params(9)*y(24)+(1-params(9))*y(23);
residual(24) = lhs - rhs;
lhs = y(36);
rhs = params(9)*(1-params(7)*params(8))*y(35)+(1-params(9))*((1-params(7)*params(8))*y(34)+y(14)*T(2));
residual(25) = lhs - rhs;
lhs = (1-params(9))*y(17);
rhs = params(8)*y(17)+(1-params(8)-params(9))*y(33);
residual(26) = lhs - rhs;
lhs = y(37);
rhs = params(13)*y(7)+x(it_, 2);
residual(27) = lhs - rhs;
lhs = y(39);
rhs = params(14)*y(8)+x(it_, 1);
residual(28) = lhs - rhs;
lhs = y(38);
rhs = y(37)+y(39);
residual(29) = lhs - rhs;
lhs = y(42);
rhs = params(15)*y(9)+x(it_, 3);
residual(30) = lhs - rhs;
lhs = y(41);
rhs = (-y(42));
residual(31) = lhs - rhs;
lhs = y(40);
rhs = y(42);
residual(32) = lhs - rhs;
lhs = y(43);
rhs = (params(17)+params(18))*y(10)+params(18)*(-params(17))*y(11)-x(it_, 4);
residual(33) = lhs - rhs;
lhs = y(45);
rhs = y(17)-y(12);
residual(34) = lhs - rhs;
lhs = y(46);
rhs = y(22);
residual(35) = lhs - rhs;
lhs = y(44);
rhs = params(9)*y(22)+(1-params(9))*(y(17)-y(12));
residual(36) = lhs - rhs;
lhs = y(51);
rhs = params(9)*y(21)+(1-params(9))*(y(20)-y(12));
residual(37) = lhs - rhs;
lhs = y(49);
rhs = y(44)-(1-params(8))*y(31)-params(8)*y(28);
residual(38) = lhs - rhs;
lhs = y(50);
rhs = y(51)-(1-params(8))*y(31)-params(8)*y(28);
residual(39) = lhs - rhs;
lhs = y(48);
rhs = y(44)-y(28);
residual(40) = lhs - rhs;
lhs = y(52);
rhs = y(10);
residual(41) = lhs - rhs;

end
