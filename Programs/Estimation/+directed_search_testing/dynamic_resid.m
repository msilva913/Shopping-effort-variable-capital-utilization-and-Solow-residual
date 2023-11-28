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
lhs = y(18);
rhs = y(13)+y(25);
residual(3) = lhs - rhs;
lhs = y(23);
rhs = y(14)*T(5)*T(10)+y(14)*T(13);
residual(4) = lhs - rhs;
lhs = y(24);
rhs = y(15)*T(5)*T(10)+y(15)*T(13);
residual(5) = lhs - rhs;
lhs = y(30)+y(31);
rhs = y(18)-y(23)+T(14)*(y(11)+y(14)*T(10)-y(18));
residual(6) = lhs - rhs;
lhs = y(30)+y(32);
rhs = y(19)-y(24)+T(14)*(y(12)+y(15)*T(10)-y(19));
residual(7) = lhs - rhs;
lhs = y(29)+y(38)+y(34);
rhs = y(30)+y(31);
residual(8) = lhs - rhs;
lhs = y(28)+y(39)+y(35);
rhs = y(30)+y(32);
residual(9) = lhs - rhs;
lhs = y(42)+1/params(5)*y(33);
rhs = y(30)+y(25)*(-params(6))-y(13);
residual(10) = lhs - rhs;
lhs = y(34);
rhs = (1-params(3))*y(3)+params(3)*y(1)-T(1)*(1-params(10))*y(5);
residual(11) = lhs - rhs;
lhs = y(35);
rhs = (1-params(3))*y(4)+params(3)*y(2)-params(10)*y(6)*T(1);
residual(12) = lhs - rhs;
lhs = y(14);
rhs = y(25)-y(41);
residual(13) = lhs - rhs;
lhs = y(15);
rhs = y(19)-y(13)-y(41);
residual(14) = lhs - rhs;
lhs = y(13)+y(37);
rhs = y(25)*(-params(6))+(y(22)-y(18))*T(15);
residual(15) = lhs - rhs;
lhs = y(16);
rhs = y(57)-y(37)+y(56)*params(2)*T(1)+params(2)*y(53);
residual(16) = lhs - rhs;
lhs = y(17);
rhs = y(57)-y(37)+y(55)*params(2)*T(1)+params(2)*y(54);
residual(17) = lhs - rhs;
lhs = y(29);
rhs = y(16)+y(38)*params(4);
residual(18) = lhs - rhs;
lhs = y(28);
rhs = y(17)+y(39)*params(4);
residual(19) = lhs - rhs;
lhs = y(16);
rhs = params(3)*params(12)*(y(20)-y(34));
residual(20) = lhs - rhs;
lhs = y(17);
rhs = params(3)*params(12)*(y(21)-y(35));
residual(21) = lhs - rhs;
lhs = y(46);
rhs = y(12)-y(11);
residual(22) = lhs - rhs;
lhs = y(18);
rhs = T(6)*(y(40)+y(11)+y(14)*T(10)*(1-T(5))+(y(38)+y(34))*T(3)+y(31)*T(4))-(T(6)-1)*(y(11)+y(14)*T(10));
residual(23) = lhs - rhs;
lhs = y(19);
rhs = T(6)*(y(40)+y(12)+y(15)*T(10)*(1-T(5))+(y(39)+y(35))*T(3)+y(32)*T(4))-(T(6)-1)*(y(12)+y(15)*T(10));
residual(24) = lhs - rhs;
lhs = y(26);
rhs = T(6)*(y(31)*T(4)+y(11)+y(40)+y(34)*T(3))-y(11)*(T(6)-1);
residual(25) = lhs - rhs;
lhs = y(27);
rhs = T(6)*(y(32)*T(4)+y(12)+y(40)+y(35)*T(3))-y(12)*(T(6)-1);
residual(26) = lhs - rhs;
lhs = y(33);
rhs = params(10)*y(32)+(1-params(10))*y(31);
residual(27) = lhs - rhs;
lhs = y(36);
rhs = params(10)*y(35)+(1-params(10))*y(34);
residual(28) = lhs - rhs;
lhs = y(19);
rhs = params(10)*y(21)+(1-params(10))*y(20);
residual(29) = lhs - rhs;
lhs = y(22);
rhs = params(10)*y(19)+(1-params(10))*y(18);
residual(30) = lhs - rhs;
lhs = y(40);
rhs = params(14)*y(7)+x(it_, 1);
residual(31) = lhs - rhs;
lhs = y(41);
rhs = params(16)*y(8)-x(it_, 2);
residual(32) = lhs - rhs;
lhs = y(42);
rhs = (params(18)+params(19))*y(9)+params(19)*(-params(18))*y(10)-x(it_, 3);
residual(33) = lhs - rhs;
lhs = y(44);
rhs = y(18)-y(11);
residual(34) = lhs - rhs;
lhs = y(45);
rhs = y(19)-y(12);
residual(35) = lhs - rhs;
lhs = y(43);
rhs = params(10)*(y(19)-y(12))+(1-params(10))*(y(18)-y(11));
residual(36) = lhs - rhs;
lhs = y(51);
rhs = params(10)*(y(27)-y(12))+(1-params(10))*(y(26)-y(11));
residual(37) = lhs - rhs;
lhs = y(49);
rhs = y(43)-(1-params(9))*y(36)-params(9)*y(33);
residual(38) = lhs - rhs;
lhs = y(50);
rhs = y(51)-(1-params(9))*y(36)-params(9)*y(33);
residual(39) = lhs - rhs;
lhs = y(47);
rhs = y(43)-y(33);
residual(40) = lhs - rhs;
lhs = y(48);
rhs = y(33)+y(30)-y(12)-y(43);
residual(41) = lhs - rhs;
lhs = y(52);
rhs = y(9);
residual(42) = lhs - rhs;

end
