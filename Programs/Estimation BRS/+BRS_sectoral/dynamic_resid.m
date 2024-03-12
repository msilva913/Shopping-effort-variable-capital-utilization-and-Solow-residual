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
    T = BRS_sectoral.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(69, 1);
lhs = y(37);
rhs = T(31)^(1/(1+params(19)));
residual(1) = lhs - rhs;
lhs = T(29)*T(5)*T(33);
rhs = y(47)*exp(y(44))*(1-T(2))/y(63);
residual(2) = lhs - rhs;
lhs = T(30)*T(6)*T(33);
rhs = y(48)*exp(y(44))*(1-T(2))/y(63);
residual(3) = lhs - rhs;
lhs = T(7);
rhs = y(27)*T(2)*exp(y(44))/y(60);
residual(4) = lhs - rhs;
lhs = T(7)*exp(y(43));
rhs = y(28)*y(64)*T(2)*exp(y(44))/y(61);
residual(5) = lhs - rhs;
lhs = y(62);
rhs = T(9)-T(35);
residual(6) = lhs - rhs;
lhs = y(63);
rhs = T(10)*T(11);
residual(7) = lhs - rhs;
lhs = y(55);
rhs = params(9)/2*(y(67)-exp(params(4)))^2;
residual(8) = lhs - rhs;
lhs = y(56);
rhs = params(10)/2*(y(68)-exp(params(4)))^2;
residual(9) = lhs - rhs;
lhs = y(57);
rhs = params(9)*(y(67)-exp(params(4)));
residual(10) = lhs - rhs;
lhs = y(58);
rhs = params(10)*(y(68)-exp(params(4)));
residual(11) = lhs - rhs;
lhs = y(67);
rhs = y(29)/y(2)*exp(y(71));
residual(12) = lhs - rhs;
lhs = y(68);
rhs = exp(y(71))*y(30)/y(3);
residual(13) = lhs - rhs;
lhs = y(64)/(1-T(2));
rhs = y(65)*(1-y(67)*y(57)-y(55))+T(14)*y(102)*y(105)*T(37);
residual(14) = lhs - rhs;
lhs = y(64)/(1-T(2));
rhs = y(66)*(1-y(68)*y(58)-y(56))+T(15)*y(103)*y(106)*T(37);
residual(15) = lhs - rhs;
lhs = y(65);
rhs = (y(96)*y(98)+y(105)*(1-y(100)))*T(37);
residual(16) = lhs - rhs;
lhs = y(66);
rhs = (y(97)*y(99)+y(106)*(1-y(101)))*T(37);
residual(17) = lhs - rhs;
lhs = y(65)*y(53);
rhs = y(45);
residual(18) = lhs - rhs;
lhs = y(66)*y(54);
rhs = y(46);
residual(19) = lhs - rhs;
lhs = y(51);
rhs = T(18)+(y(49)-1)*(T(1)+T(18))+(y(49)-1)^2*params(7)*(T(1)+T(18))/2;
residual(20) = lhs - rhs;
lhs = y(52);
rhs = T(18)+(y(50)-1)*(T(1)+T(18))+(y(50)-1)^2*params(8)*(T(1)+T(18))/2;
residual(21) = lhs - rhs;
lhs = y(53);
rhs = T(1)+T(18)+(y(49)-1)*params(7)*(T(1)+T(18));
residual(22) = lhs - rhs;
lhs = y(54);
rhs = T(1)+T(18)+(y(50)-1)*params(8)*(T(1)+T(18));
residual(23) = lhs - rhs;
lhs = y(27);
rhs = T(38)*(T(40)*T(41)*T(42)-T(24));
residual(24) = lhs - rhs;
lhs = y(28);
rhs = T(43)*(T(44)*T(45)*T(46)-T(25));
residual(25) = lhs - rhs;
lhs = exp(y(71))*y(32);
rhs = exp(y(71))*y(29)*(1-y(55))+y(4)*(1-y(51));
residual(26) = lhs - rhs;
lhs = exp(y(71))*y(33);
rhs = exp(y(71))*y(30)*(1-y(56))+y(5)*(1-y(52));
residual(27) = lhs - rhs;
lhs = y(47)*(1-T(2));
rhs = T(20)*(y(27)+T(24)*T(38))/y(35);
residual(28) = lhs - rhs;
lhs = y(48)*(1-T(2))/y(64);
rhs = T(20)*(y(28)+T(25)*T(43))/y(36);
residual(29) = lhs - rhs;
lhs = y(45)*(1-T(2));
rhs = (y(27)+T(24)*T(38))*exp(y(71))*T(19)/(y(49)*y(4));
residual(30) = lhs - rhs;
lhs = y(46)*(1-T(2))/y(64);
rhs = (y(28)+T(25)*T(43))*exp(y(71))*T(19)/(y(50)*y(5));
residual(31) = lhs - rhs;
lhs = y(34);
rhs = y(35)+y(36);
residual(32) = lhs - rhs;
lhs = y(31);
rhs = y(32)+y(33);
residual(33) = lhs - rhs;
lhs = y(28);
rhs = y(29)+y(30);
residual(34) = lhs - rhs;
lhs = y(59);
rhs = y(60)+exp(y(43))*y(61);
residual(35) = lhs - rhs;
lhs = y(26);
rhs = y(27)+y(28)*params(27);
residual(36) = lhs - rhs;
lhs = y(70);
rhs = T(48)/T(50)+T(52)/T(54);
residual(37) = lhs - rhs;
lhs = y(71);
rhs = params(4)*(1-params(20))+params(20)*y(13)+x(it_, 1);
residual(38) = lhs - rhs;
lhs = y(38);
rhs = params(21)*y(6)+x(it_, 2);
residual(39) = lhs - rhs;
lhs = y(39);
rhs = params(22)*y(7)+x(it_, 3);
residual(40) = lhs - rhs;
lhs = y(40);
rhs = y(38)+y(39);
residual(41) = lhs - rhs;
lhs = y(41);
rhs = params(23)*y(8)-x(it_, 4);
residual(42) = lhs - rhs;
lhs = y(42);
rhs = params(24)*y(9)-x(it_, 5);
residual(43) = lhs - rhs;
lhs = y(43);
rhs = params(25)*y(10)-x(it_, 6);
residual(44) = lhs - rhs;
lhs = y(44);
rhs = params(26)*y(11)+x(it_, 7);
residual(45) = lhs - rhs;
lhs = y(72);
rhs = log(y(26))-(log(steady_state(1)));
residual(46) = lhs - rhs;
lhs = y(73);
rhs = log(y(27))-(log(steady_state(2)));
residual(47) = lhs - rhs;
lhs = y(74);
rhs = log(y(28))-(log(steady_state(3)));
residual(48) = lhs - rhs;
lhs = y(75);
rhs = log(y(34))-(log(steady_state(9)));
residual(49) = lhs - rhs;
lhs = y(76);
rhs = log(y(35))-(log(steady_state(10)));
residual(50) = lhs - rhs;
lhs = y(77);
rhs = log(y(36))-(log(steady_state(11)));
residual(51) = lhs - rhs;
lhs = y(78);
rhs = log(y(31))-(log(steady_state(6)));
residual(52) = lhs - rhs;
lhs = y(79);
rhs = y(72)-y(75);
residual(53) = lhs - rhs;
lhs = y(80);
rhs = log(y(59))-(log(steady_state(34)));
residual(54) = lhs - rhs;
lhs = y(81);
rhs = log(y(64))-(steady_state(56));
residual(55) = lhs - rhs;
lhs = y(82);
rhs = log(y(70))-(log(steady_state(45)));
residual(56) = lhs - rhs;
lhs = y(69);
rhs = y(72)-(1-params(13))*y(20)-params(13)*y(75);
residual(57) = lhs - rhs;
lhs = y(83);
rhs = y(71)+y(73)-y(15)-params(4);
residual(58) = lhs - rhs;
lhs = y(84);
rhs = y(71)+y(74)-y(16)-params(4);
residual(59) = lhs - rhs;
lhs = y(85);
rhs = y(71)+y(72)-y(14)-params(4);
residual(60) = lhs - rhs;
lhs = y(86);
rhs = y(71)+y(79)-y(21)-params(4);
residual(61) = lhs - rhs;
lhs = y(93);
rhs = y(71)+y(78)-y(20)-params(4);
residual(62) = lhs - rhs;
lhs = y(94);
rhs = y(85)-params(13)*y(88)-(1-params(13))*y(25);
residual(63) = lhs - rhs;
lhs = y(87);
rhs = y(81)-y(23);
residual(64) = lhs - rhs;
lhs = y(88);
rhs = y(75)-y(17);
residual(65) = lhs - rhs;
lhs = y(89);
rhs = y(76)-y(18);
residual(66) = lhs - rhs;
lhs = y(90);
rhs = y(77)-y(19);
residual(67) = lhs - rhs;
lhs = y(91);
rhs = y(82)-y(24);
residual(68) = lhs - rhs;
lhs = y(92);
rhs = y(80)-y(22);
residual(69) = lhs - rhs;

end
