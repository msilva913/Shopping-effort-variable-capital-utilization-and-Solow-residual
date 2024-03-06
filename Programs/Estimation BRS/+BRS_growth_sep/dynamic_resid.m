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
    T = BRS_growth_sep.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(36, 1);
lhs = T(21);
rhs = T(4)*y(30)*(1-T(2));
residual(1) = lhs - rhs;
lhs = T(5);
rhs = T(2)*y(15)/y(32);
residual(2) = lhs - rhs;
lhs = T(5);
rhs = y(16)*T(2)*y(35)/y(33);
residual(3) = lhs - rhs;
lhs = y(34);
rhs = y(15)-T(6);
residual(4) = lhs - rhs;
lhs = T(4)*y(35);
rhs = T(8)*T(7)*T(23);
residual(5) = lhs - rhs;
lhs = y(51);
rhs = y(50);
residual(6) = lhs - rhs;
lhs = y(15);
rhs = T(24)*(T(28)*T(29)-T(15));
residual(7) = lhs - rhs;
lhs = y(16);
rhs = T(30)*(T(33)*T(34)-T(16));
residual(8) = lhs - rhs;
lhs = y(16)*exp(y(36));
rhs = exp(y(36))*(y(18)+y(19))-(y(1)+y(2))*T(22);
residual(9) = lhs - rhs;
lhs = y(30)*(1-T(2));
rhs = T(10)*(y(15)+T(15)*T(24))/y(21);
residual(10) = lhs - rhs;
lhs = y(28)*(1-T(2));
rhs = (y(15)+T(15)*T(24))*exp(y(36))*T(11)/y(1);
residual(11) = lhs - rhs;
lhs = y(30)*(1-T(2))/y(35);
rhs = T(10)*(y(16)+T(16)*T(30))/y(22);
residual(12) = lhs - rhs;
lhs = y(29)*(1-T(2))/y(35);
rhs = exp(y(36))*T(11)*(y(16)+T(16)*T(30))/y(2);
residual(13) = lhs - rhs;
lhs = y(20);
rhs = y(21)+y(22);
residual(14) = lhs - rhs;
lhs = y(17);
rhs = y(18)+y(19);
residual(15) = lhs - rhs;
lhs = y(31);
rhs = y(32)+y(33);
residual(16) = lhs - rhs;
lhs = y(14);
rhs = y(15)+y(16)*params(18);
residual(17) = lhs - rhs;
lhs = y(36);
rhs = params(4)*(1-params(13))+params(13)*y(7)+x(it_, 1);
residual(18) = lhs - rhs;
lhs = y(23);
rhs = params(14)*y(3)+x(it_, 2);
residual(19) = lhs - rhs;
lhs = y(24);
rhs = params(15)*y(4)+x(it_, 3);
residual(20) = lhs - rhs;
lhs = y(25);
rhs = y(23)+y(24);
residual(21) = lhs - rhs;
lhs = y(26);
rhs = params(16)*y(5)-x(it_, 4);
residual(22) = lhs - rhs;
lhs = y(27);
rhs = params(17)*y(6)-x(it_, 5);
residual(23) = lhs - rhs;
lhs = y(37);
rhs = log(y(14))-(log(steady_state(1)));
residual(24) = lhs - rhs;
lhs = y(38);
rhs = log(y(15))-(log(steady_state(2)));
residual(25) = lhs - rhs;
lhs = y(39);
rhs = log(y(16))-(log(steady_state(3)));
residual(26) = lhs - rhs;
lhs = y(40);
rhs = log(y(20))-(log(steady_state(7)));
residual(27) = lhs - rhs;
lhs = y(41);
rhs = y(37)-y(40);
residual(28) = lhs - rhs;
lhs = y(42);
rhs = log(y(31))-(log(steady_state(18)));
residual(29) = lhs - rhs;
lhs = y(43);
rhs = log(y(35))-(steady_state(30));
residual(30) = lhs - rhs;
lhs = y(44);
rhs = y(36)+y(38)-y(9)-params(4);
residual(31) = lhs - rhs;
lhs = y(45);
rhs = y(36)+y(39)-y(10)-params(4);
residual(32) = lhs - rhs;
lhs = y(46);
rhs = y(36)+y(37)-y(8)-params(4);
residual(33) = lhs - rhs;
lhs = y(47);
rhs = y(36)+y(41)-y(12)-params(4);
residual(34) = lhs - rhs;
lhs = y(48);
rhs = y(43)-y(13);
residual(35) = lhs - rhs;
lhs = y(49);
rhs = y(40)-y(11);
residual(36) = lhs - rhs;

end
