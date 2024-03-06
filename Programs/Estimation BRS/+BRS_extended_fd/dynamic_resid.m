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
    T = BRS_extended_fd.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(43, 1);
lhs = T(21);
rhs = (1-params(10))*y(30);
residual(1) = lhs - rhs;
lhs = T(5);
rhs = params(10)*y(15)/y(38);
residual(2) = lhs - rhs;
lhs = T(5);
rhs = params(10)*y(41)*y(16)/y(39);
residual(3) = lhs - rhs;
lhs = y(40);
rhs = y(15)-T(7)-T(22);
residual(4) = lhs - rhs;
lhs = y(42);
rhs = y(41)/(1-params(10))*T(9);
residual(5) = lhs - rhs;
lhs = y(42);
rhs = (y(57)*y(59)+y(64)*(1-y(61)+y(65)*params(6)*(y(65)-T(2))-T(10)))*T(23);
residual(6) = lhs - rhs;
lhs = y(42);
rhs = (y(58)*y(60)+y(64)*(1-y(62)+y(65)*params(6)*(y(65)-T(2))-T(10)))*T(23);
residual(7) = lhs - rhs;
lhs = y(43);
rhs = y(16)/y(1);
residual(8) = lhs - rhs;
lhs = y(42)*y(35);
rhs = y(28);
residual(9) = lhs - rhs;
lhs = y(42)*y(36);
rhs = y(29);
residual(10) = lhs - rhs;
lhs = y(33);
rhs = T(2)+(y(31)-1)*(T(1)+T(2))+(y(31)-1)^2*T(24);
residual(11) = lhs - rhs;
lhs = y(34);
rhs = T(2)+(y(32)-1)*(T(1)+T(2))+(y(32)-1)^2*T(24);
residual(12) = lhs - rhs;
lhs = y(35);
rhs = T(1)+T(2)+(y(31)-1)*params(5)*(T(1)+T(2));
residual(13) = lhs - rhs;
lhs = y(36);
rhs = T(1)+T(2)+(y(32)-1)*params(5)*(T(1)+T(2));
residual(14) = lhs - rhs;
lhs = y(15);
rhs = T(11)*T(27);
residual(15) = lhs - rhs;
lhs = y(16);
rhs = T(12)*T(30);
residual(16) = lhs - rhs;
lhs = y(16);
rhs = y(18)+y(19)-y(2)*(1-y(33))-y(3)*(1-y(34))+T(8)*(y(43)-T(2))^2;
residual(17) = lhs - rhs;
lhs = (1-params(10))*y(30);
rhs = (1-params(10))*params(9)*y(15)/y(21);
residual(18) = lhs - rhs;
lhs = y(30)/y(28);
rhs = y(2)*y(31)*T(31)/y(21);
residual(19) = lhs - rhs;
lhs = (1-params(10))*y(30)/y(41);
rhs = (1-params(10))*params(9)*y(16)/y(22);
residual(20) = lhs - rhs;
lhs = y(30)/y(29);
rhs = y(3)*y(32)*T(31)/y(22);
residual(21) = lhs - rhs;
lhs = y(20);
rhs = y(21)+y(22);
residual(22) = lhs - rhs;
lhs = y(17);
rhs = y(18)+y(19);
residual(23) = lhs - rhs;
lhs = y(37);
rhs = y(38)+y(39);
residual(24) = lhs - rhs;
lhs = y(14);
rhs = y(15)+params(17)*y(16);
residual(25) = lhs - rhs;
lhs = y(23);
rhs = params(13)*y(4)+x(it_, 1);
residual(26) = lhs - rhs;
lhs = y(24);
rhs = params(14)*y(5)+x(it_, 2);
residual(27) = lhs - rhs;
lhs = y(25);
rhs = y(23)+y(24);
residual(28) = lhs - rhs;
lhs = y(26);
rhs = params(15)*y(6)-x(it_, 3);
residual(29) = lhs - rhs;
lhs = y(27);
rhs = params(16)*y(7)-x(it_, 4);
residual(30) = lhs - rhs;
lhs = y(44);
rhs = log(y(14))-(log(steady_state(1)));
residual(31) = lhs - rhs;
lhs = y(45);
rhs = log(y(15))-(log(steady_state(2)));
residual(32) = lhs - rhs;
lhs = y(46);
rhs = log(y(16))-(log(steady_state(3)));
residual(33) = lhs - rhs;
lhs = y(47);
rhs = log(y(20))-(log(steady_state(7)));
residual(34) = lhs - rhs;
lhs = y(48);
rhs = y(44)-y(47);
residual(35) = lhs - rhs;
lhs = y(49);
rhs = log(y(37))-(log(steady_state(24)));
residual(36) = lhs - rhs;
lhs = y(50);
rhs = log(y(41))-(steady_state(37));
residual(37) = lhs - rhs;
lhs = y(51);
rhs = y(45)-y(9);
residual(38) = lhs - rhs;
lhs = y(52);
rhs = y(46)-y(10);
residual(39) = lhs - rhs;
lhs = y(53);
rhs = y(44)-y(8);
residual(40) = lhs - rhs;
lhs = y(54);
rhs = y(48)-y(12);
residual(41) = lhs - rhs;
lhs = y(55);
rhs = y(50)-y(13);
residual(42) = lhs - rhs;
lhs = y(56);
rhs = y(47)-y(11);
residual(43) = lhs - rhs;

end
