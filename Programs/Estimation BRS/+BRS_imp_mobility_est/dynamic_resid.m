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
    T = BRS_imp_mobility_est.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(55, 1);
lhs = y(32);
rhs = T(31)^(1/(1+params(15)));
residual(1) = lhs - rhs;
lhs = T(3)*T(32);
rhs = y(41)*exp(y(38))*T(14);
residual(2) = lhs - rhs;
lhs = T(4);
rhs = y(24)*T(2)*exp(y(38))/y(49);
residual(3) = lhs - rhs;
lhs = T(4);
rhs = y(25)*y(53)*T(2)*exp(y(38))/y(50);
residual(4) = lhs - rhs;
lhs = y(51);
rhs = exp(y(38))*y(24)-T(6)-T(8)*T(32)/T(7)-params(14)*y(52);
residual(5) = lhs - rhs;
lhs = y(52);
rhs = exp(y(38))*y(1)-T(9)-T(10)*T(32)/T(7);
residual(6) = lhs - rhs;
lhs = y(54);
rhs = y(53)/T(14)*T(15);
residual(7) = lhs - rhs;
lhs = y(54);
rhs = T(35);
residual(8) = lhs - rhs;
lhs = y(54);
rhs = T(36);
residual(9) = lhs - rhs;
lhs = y(55);
rhs = y(25)/y(2)*exp(y(57));
residual(10) = lhs - rhs;
lhs = y(54)*y(46);
rhs = y(39);
residual(11) = lhs - rhs;
lhs = y(54)*y(47);
rhs = y(40);
residual(12) = lhs - rhs;
lhs = y(44);
rhs = T(21)+(y(42)-1)*(T(1)+T(21))+(y(42)-1)^2*T(37);
residual(13) = lhs - rhs;
lhs = y(45);
rhs = T(21)+(y(43)-1)*(T(1)+T(21))+(y(43)-1)^2*T(37);
residual(14) = lhs - rhs;
lhs = y(46);
rhs = T(1)+T(21)+(y(42)-1)*params(6)*(T(1)+T(21));
residual(15) = lhs - rhs;
lhs = y(47);
rhs = T(1)+T(21)+(y(43)-1)*params(6)*(T(1)+T(21));
residual(16) = lhs - rhs;
lhs = y(24);
rhs = T(41)*T(42);
residual(17) = lhs - rhs;
lhs = y(25);
rhs = T(45)*T(46);
residual(18) = lhs - rhs;
lhs = y(25)*exp(y(57));
rhs = exp(y(57))*(y(27)+y(28))-y(3)*(1-y(44))-y(4)*(1-y(45))+T(13)*(y(55)-params(8)/params(9))^2;
residual(19) = lhs - rhs;
lhs = y(41)*T(14);
rhs = y(24)*params(10)*T(14)/y(30);
residual(20) = lhs - rhs;
lhs = y(41)*T(14)/y(53);
rhs = y(25)*params(10)*T(14)/y(31);
residual(21) = lhs - rhs;
lhs = y(39)*T(14);
rhs = exp(y(57))*y(24)*params(9)*(T(1)+T(21))/(y(42)*y(3));
residual(22) = lhs - rhs;
lhs = y(40)*T(14)/y(53);
rhs = exp(y(57))*y(25)*params(9)*(T(1)+T(21))/(y(43)*y(4));
residual(23) = lhs - rhs;
lhs = y(29);
rhs = y(30)+y(31);
residual(24) = lhs - rhs;
lhs = y(26);
rhs = y(27)+y(28);
residual(25) = lhs - rhs;
lhs = y(48);
rhs = y(49)+y(50);
residual(26) = lhs - rhs;
lhs = y(23);
rhs = y(24)+params(22)*y(25);
residual(27) = lhs - rhs;
lhs = y(56);
rhs = T(19)*y(24)/y(23)*T(23)*T(47)+T(20)*y(25)/y(23)*T(24)*T(48);
residual(28) = lhs - rhs;
lhs = y(57);
rhs = params(4)*(1-params(16))+params(16)*y(12)+x(it_, 1);
residual(29) = lhs - rhs;
lhs = y(33);
rhs = params(17)*y(6)+x(it_, 2);
residual(30) = lhs - rhs;
lhs = y(34);
rhs = params(18)*y(7)+x(it_, 3);
residual(31) = lhs - rhs;
lhs = y(35);
rhs = y(33)+y(34);
residual(32) = lhs - rhs;
lhs = y(36);
rhs = params(19)*y(8)-x(it_, 4);
residual(33) = lhs - rhs;
lhs = y(37);
rhs = params(20)*y(9)-x(it_, 5);
residual(34) = lhs - rhs;
lhs = y(38);
rhs = params(21)*y(10)+x(it_, 6);
residual(35) = lhs - rhs;
lhs = y(58);
rhs = log(y(23))-(log(steady_state(1)));
residual(36) = lhs - rhs;
lhs = y(59);
rhs = log(y(24))-(log(steady_state(2)));
residual(37) = lhs - rhs;
lhs = y(60);
rhs = log(y(25))-(log(steady_state(3)));
residual(38) = lhs - rhs;
lhs = y(61);
rhs = log(y(29))-(log(steady_state(7)));
residual(39) = lhs - rhs;
lhs = y(62);
rhs = log(y(30))-(log(steady_state(8)));
residual(40) = lhs - rhs;
lhs = y(63);
rhs = log(y(31))-(log(steady_state(9)));
residual(41) = lhs - rhs;
lhs = y(64);
rhs = y(58)-y(61);
residual(42) = lhs - rhs;
lhs = y(65);
rhs = log(y(48))-(log(steady_state(26)));
residual(43) = lhs - rhs;
lhs = y(66);
rhs = log(y(53))-(steady_state(44));
residual(44) = lhs - rhs;
lhs = y(67);
rhs = log(y(56))-(log(steady_state(34)));
residual(45) = lhs - rhs;
lhs = y(68);
rhs = y(57)+y(59)-y(14)-params(4);
residual(46) = lhs - rhs;
lhs = y(69);
rhs = y(57)+y(60)-y(15)-params(4);
residual(47) = lhs - rhs;
lhs = y(70);
rhs = y(57)+y(58)-y(13)-params(4);
residual(48) = lhs - rhs;
lhs = y(71);
rhs = y(57)+y(64)-y(19)-params(4);
residual(49) = lhs - rhs;
lhs = y(72);
rhs = y(66)-y(21);
residual(50) = lhs - rhs;
lhs = y(73);
rhs = y(61)-y(16);
residual(51) = lhs - rhs;
lhs = y(74);
rhs = y(62)-y(17);
residual(52) = lhs - rhs;
lhs = y(75);
rhs = y(63)-y(18);
residual(53) = lhs - rhs;
lhs = y(76);
rhs = y(67)-y(22);
residual(54) = lhs - rhs;
lhs = y(77);
rhs = y(65)-y(20);
residual(55) = lhs - rhs;

end
