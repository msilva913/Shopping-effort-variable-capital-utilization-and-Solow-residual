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
    T = BRS_util.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(46, 1);
lhs = T(18);
rhs = (1-params(8))*y(34);
residual(1) = lhs - rhs;
lhs = T(3);
rhs = params(8)*y(19)/y(36);
residual(2) = lhs - rhs;
lhs = T(3);
rhs = params(8)*y(39)*y(20)/y(37);
residual(3) = lhs - rhs;
lhs = y(38);
rhs = y(19)-T(5)-T(19);
residual(4) = lhs - rhs;
lhs = y(39)*T(6);
rhs = T(8)*T(7)*T(21);
residual(5) = lhs - rhs;
lhs = y(65);
rhs = y(64);
residual(6) = lhs - rhs;
lhs = y(19);
rhs = T(9)*T(26);
residual(7) = lhs - rhs;
lhs = y(20);
rhs = T(10)*T(30);
residual(8) = lhs - rhs;
lhs = y(20)*exp(y(40));
rhs = exp(y(40))*(y(22)+y(23))-(y(1)+y(2))*T(20);
residual(9) = lhs - rhs;
lhs = (1-params(8))*y(34);
rhs = (1-params(8))*params(7)*y(19)/y(25);
residual(10) = lhs - rhs;
lhs = (1-params(8))*y(32);
rhs = exp(y(40))*y(19)*T(11)/y(1);
residual(11) = lhs - rhs;
lhs = (1-params(8))*y(34)/y(39);
rhs = (1-params(8))*params(7)*y(20)/y(26);
residual(12) = lhs - rhs;
lhs = (1-params(8))*y(33)/y(39);
rhs = exp(y(40))*y(20)*T(11)/y(2);
residual(13) = lhs - rhs;
lhs = y(24);
rhs = y(25)+y(26);
residual(14) = lhs - rhs;
lhs = y(21);
rhs = y(22)+y(23);
residual(15) = lhs - rhs;
lhs = y(35);
rhs = y(36)+y(37);
residual(16) = lhs - rhs;
lhs = y(18);
rhs = y(19)+params(16)*y(20);
residual(17) = lhs - rhs;
lhs = y(41);
rhs = T(22);
residual(18) = lhs - rhs;
lhs = y(42);
rhs = T(27);
residual(19) = lhs - rhs;
lhs = y(43);
rhs = y(41)*y(19)/(y(19)+y(20))+y(42)*y(20)/(y(19)+y(20));
residual(20) = lhs - rhs;
lhs = y(40);
rhs = params(3)*(1-params(11))+params(11)*y(7)+x(it_, 1);
residual(21) = lhs - rhs;
lhs = y(27);
rhs = params(12)*y(3)+x(it_, 2);
residual(22) = lhs - rhs;
lhs = y(28);
rhs = params(13)*y(4)+x(it_, 3);
residual(23) = lhs - rhs;
lhs = y(29);
rhs = y(27)+y(28);
residual(24) = lhs - rhs;
lhs = y(30);
rhs = params(14)*y(5)-x(it_, 4);
residual(25) = lhs - rhs;
lhs = y(31);
rhs = params(15)*y(6)-x(it_, 5);
residual(26) = lhs - rhs;
lhs = y(44);
rhs = log(y(18))-(log(steady_state(1)));
residual(27) = lhs - rhs;
lhs = y(45);
rhs = log(y(19))-(log(steady_state(2)));
residual(28) = lhs - rhs;
lhs = y(46);
rhs = log(y(20))-(log(steady_state(3)));
residual(29) = lhs - rhs;
lhs = y(47);
rhs = log(y(24))-(log(steady_state(7)));
residual(30) = lhs - rhs;
lhs = y(48);
rhs = log(y(25))-(log(steady_state(8)));
residual(31) = lhs - rhs;
lhs = y(49);
rhs = log(y(26))-(log(steady_state(9)));
residual(32) = lhs - rhs;
lhs = y(50);
rhs = y(44)-y(47);
residual(33) = lhs - rhs;
lhs = y(51);
rhs = log(y(35))-(log(steady_state(18)));
residual(34) = lhs - rhs;
lhs = y(52);
rhs = log(y(39))-(log(steady_state(22)));
residual(35) = lhs - rhs;
lhs = y(53);
rhs = log(y(43))-(log(steady_state(26)));
residual(36) = lhs - rhs;
lhs = y(54);
rhs = y(40)+y(45)-y(9)-params(3);
residual(37) = lhs - rhs;
lhs = y(55);
rhs = y(40)+y(46)-y(10)-params(3);
residual(38) = lhs - rhs;
lhs = y(56);
rhs = y(40)+y(44)-y(8)-params(3);
residual(39) = lhs - rhs;
lhs = y(57);
rhs = y(40)+y(50)-y(14)-params(3);
residual(40) = lhs - rhs;
lhs = y(58);
rhs = y(52)-y(16);
residual(41) = lhs - rhs;
lhs = y(61);
rhs = y(47)-y(11);
residual(42) = lhs - rhs;
lhs = y(59);
rhs = y(48)-y(12);
residual(43) = lhs - rhs;
lhs = y(60);
rhs = y(49)-y(13);
residual(44) = lhs - rhs;
lhs = y(62);
rhs = y(51)-y(15);
residual(45) = lhs - rhs;
lhs = y(63);
rhs = y(53)-y(17);
residual(46) = lhs - rhs;

end
