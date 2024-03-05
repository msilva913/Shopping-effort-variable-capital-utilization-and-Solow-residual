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
    T = BRS_growth_ext_comovement.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(48, 1);
lhs = T(23);
rhs = (1-params(10))*exp(y(29))*y(32);
residual(1) = lhs - rhs;
lhs = T(4);
rhs = params(10)*exp(y(29))*y(18)/y(40);
residual(2) = lhs - rhs;
lhs = T(4);
rhs = params(10)*exp(y(29))*y(43)*y(19)/y(41);
residual(3) = lhs - rhs;
lhs = y(42);
rhs = exp(y(29))*y(18)-T(6)-T(24);
residual(4) = lhs - rhs;
lhs = y(44);
rhs = y(43)/(1-params(10))*T(10);
residual(5) = lhs - rhs;
lhs = y(44);
rhs = T(27);
residual(6) = lhs - rhs;
lhs = y(44);
rhs = T(28);
residual(7) = lhs - rhs;
lhs = y(45);
rhs = y(19)/y(1)*exp(y(46));
residual(8) = lhs - rhs;
lhs = y(44)*y(37);
rhs = y(30);
residual(9) = lhs - rhs;
lhs = y(44)*y(38);
rhs = y(31);
residual(10) = lhs - rhs;
lhs = y(35);
rhs = T(16)+(y(33)-1)*(T(1)+T(16))+(y(33)-1)^2*T(29);
residual(11) = lhs - rhs;
lhs = y(36);
rhs = T(16)+(y(34)-1)*(T(1)+T(16))+(y(34)-1)^2*T(29);
residual(12) = lhs - rhs;
lhs = y(37);
rhs = T(1)+T(16)+(y(33)-1)*params(5)*(T(1)+T(16));
residual(13) = lhs - rhs;
lhs = y(38);
rhs = T(1)+T(16)+(y(34)-1)*params(5)*(T(1)+T(16));
residual(14) = lhs - rhs;
lhs = y(18);
rhs = T(14)*T(34);
residual(15) = lhs - rhs;
lhs = y(19);
rhs = T(15)*T(38);
residual(16) = lhs - rhs;
lhs = y(19)*exp(y(46));
rhs = exp(y(46))*(y(21)+y(22))-y(2)*(1-y(35))-y(3)*(1-y(36))+T(9)*(y(45)-params(7)/params(8))^2;
residual(17) = lhs - rhs;
lhs = (1-params(10))*y(32);
rhs = (1-params(10))*params(9)*y(18)/y(24);
residual(18) = lhs - rhs;
lhs = (1-params(10))*y(30);
rhs = exp(y(46))*y(18)*params(8)*(T(1)+T(16))/(y(33)*y(2));
residual(19) = lhs - rhs;
lhs = (1-params(10))*y(32)/y(43);
rhs = (1-params(10))*params(9)*y(19)/y(25);
residual(20) = lhs - rhs;
lhs = (1-params(10))*y(30);
rhs = exp(y(46))*y(19)*params(8)*(T(1)+T(16))/(y(33)*y(3));
residual(21) = lhs - rhs;
lhs = y(23);
rhs = y(24)+y(25);
residual(22) = lhs - rhs;
lhs = y(20);
rhs = y(21)+y(22);
residual(23) = lhs - rhs;
lhs = y(39);
rhs = y(40)+y(41);
residual(24) = lhs - rhs;
lhs = y(17);
rhs = y(18)+params(18)*y(19);
residual(25) = lhs - rhs;
lhs = y(47);
rhs = x(it_, 1)+params(13)*y(8)+(1-params(13))*params(3)*(1-params(8)*(T(1)+T(16)));
residual(26) = lhs - rhs;
lhs = y(46);
rhs = y(47)/(1-params(8)*(T(1)+T(16)));
residual(27) = lhs - rhs;
lhs = y(26);
rhs = params(14)*y(4)+x(it_, 2);
residual(28) = lhs - rhs;
lhs = y(27);
rhs = params(15)*y(5)-x(it_, 3);
residual(29) = lhs - rhs;
lhs = y(28);
rhs = params(16)*y(6)-x(it_, 4);
residual(30) = lhs - rhs;
lhs = y(29);
rhs = params(17)*y(7)+x(it_, 5);
residual(31) = lhs - rhs;
lhs = y(48);
rhs = log(y(17))-(log(steady_state(1)));
residual(32) = lhs - rhs;
lhs = y(49);
rhs = log(y(18))-(log(steady_state(2)));
residual(33) = lhs - rhs;
lhs = y(50);
rhs = log(y(19))-(log(steady_state(3)));
residual(34) = lhs - rhs;
lhs = y(51);
rhs = log(y(23))-(log(steady_state(7)));
residual(35) = lhs - rhs;
lhs = y(52);
rhs = log(y(24))-(log(steady_state(8)));
residual(36) = lhs - rhs;
lhs = y(53);
rhs = log(y(25))-(log(steady_state(9)));
residual(37) = lhs - rhs;
lhs = y(54);
rhs = y(48)-y(51);
residual(38) = lhs - rhs;
lhs = y(55);
rhs = log(y(39))-(log(steady_state(23)));
residual(39) = lhs - rhs;
lhs = y(56);
rhs = log(y(43))-(steady_state(40));
residual(40) = lhs - rhs;
lhs = y(57);
rhs = y(49)-y(10);
residual(41) = lhs - rhs;
lhs = y(58);
rhs = y(50)-y(11);
residual(42) = lhs - rhs;
lhs = y(63);
rhs = y(52)-y(13);
residual(43) = lhs - rhs;
lhs = y(64);
rhs = y(53)-y(14);
residual(44) = lhs - rhs;
lhs = y(59);
rhs = y(48)-y(9);
residual(45) = lhs - rhs;
lhs = y(60);
rhs = y(54)-y(15);
residual(46) = lhs - rhs;
lhs = y(61);
rhs = y(56)-y(16);
residual(47) = lhs - rhs;
lhs = y(62);
rhs = y(51)-y(12);
residual(48) = lhs - rhs;

end
