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
    T = BRS_gen.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(63, 1);
lhs = y(34);
rhs = T(30)^(1/(1+params(17)));
residual(1) = lhs - rhs;
lhs = T(28)*T(5)*T(32);
rhs = y(44)*exp(y(41))*(1-T(2))/y(58);
residual(2) = lhs - rhs;
lhs = T(29)*T(6)*T(32);
rhs = y(45)*exp(y(41))*(1-T(2))/y(58);
residual(3) = lhs - rhs;
lhs = T(7);
rhs = y(26)*T(2)*exp(y(41))/y(55);
residual(4) = lhs - rhs;
lhs = T(7)*exp(y(40));
rhs = y(27)*y(59)*T(2)*exp(y(41))/y(56);
residual(5) = lhs - rhs;
lhs = y(57);
rhs = T(9)-T(34);
residual(6) = lhs - rhs;
lhs = y(58);
rhs = T(10)*T(11);
residual(7) = lhs - rhs;
lhs = y(52);
rhs = params(8)/2*(y(61)-exp(params(4)))^2;
residual(8) = lhs - rhs;
lhs = y(53);
rhs = params(8)*(y(61)-exp(params(4)));
residual(9) = lhs - rhs;
lhs = y(61);
rhs = y(27)/y(2)*exp(y(64));
residual(10) = lhs - rhs;
lhs = y(59)/(1-T(2));
rhs = y(60)*(1-y(61)*y(53)-y(52))+T(14)*y(95)*y(97)*T(36);
residual(11) = lhs - rhs;
lhs = y(60);
rhs = (y(89)*y(91)+y(97)*(1-y(93)))*T(36);
residual(12) = lhs - rhs;
lhs = y(60);
rhs = (y(90)*y(92)+y(97)*(1-y(94)))*T(36);
residual(13) = lhs - rhs;
lhs = y(60)*y(50);
rhs = y(42);
residual(14) = lhs - rhs;
lhs = y(60)*y(51);
rhs = y(43);
residual(15) = lhs - rhs;
lhs = y(48);
rhs = T(17)+(y(46)-1)*(T(1)+T(17))+(y(46)-1)^2*T(37);
residual(16) = lhs - rhs;
lhs = y(49);
rhs = T(17)+(y(47)-1)*(T(1)+T(17))+(y(47)-1)^2*T(37);
residual(17) = lhs - rhs;
lhs = y(50);
rhs = T(1)+T(17)+(y(46)-1)*params(7)*(T(1)+T(17));
residual(18) = lhs - rhs;
lhs = y(51);
rhs = T(1)+T(17)+(y(47)-1)*params(7)*(T(1)+T(17));
residual(19) = lhs - rhs;
lhs = y(26);
rhs = T(38)*(T(40)*T(41)*T(42)-T(23));
residual(20) = lhs - rhs;
lhs = y(27);
rhs = T(43)*(T(44)*T(45)*T(46)-T(24));
residual(21) = lhs - rhs;
lhs = exp(y(64))*y(27)*(1-y(52));
rhs = exp(y(64))*(y(29)+y(30))-y(3)*(1-y(48))-y(4)*(1-y(49));
residual(22) = lhs - rhs;
lhs = y(44)*(1-T(2));
rhs = T(19)*(y(26)+T(23)*T(38))/y(32);
residual(23) = lhs - rhs;
lhs = y(45)*(1-T(2))/y(59);
rhs = T(19)*(y(27)+T(24)*T(43))/y(33);
residual(24) = lhs - rhs;
lhs = y(42)*(1-T(2));
rhs = (y(26)+T(23)*T(38))*exp(y(64))*T(18)/(y(46)*y(3));
residual(25) = lhs - rhs;
lhs = y(43)*(1-T(2))/y(59);
rhs = (y(27)+T(24)*T(43))*exp(y(64))*T(18)/(y(47)*y(4));
residual(26) = lhs - rhs;
lhs = y(31);
rhs = y(32)+y(33);
residual(27) = lhs - rhs;
lhs = y(28);
rhs = y(29)+y(30);
residual(28) = lhs - rhs;
lhs = y(54);
rhs = y(55)+exp(y(40))*y(56);
residual(29) = lhs - rhs;
lhs = y(25);
rhs = y(26)+y(27)*params(25);
residual(30) = lhs - rhs;
lhs = y(63);
rhs = T(48)/T(50)+T(52)/T(54);
residual(31) = lhs - rhs;
lhs = y(64);
rhs = params(4)*(1-params(18))+params(18)*y(12)+x(it_, 1);
residual(32) = lhs - rhs;
lhs = y(35);
rhs = params(19)*y(5)+x(it_, 2);
residual(33) = lhs - rhs;
lhs = y(36);
rhs = params(20)*y(6)+x(it_, 3);
residual(34) = lhs - rhs;
lhs = y(37);
rhs = y(35)+y(36);
residual(35) = lhs - rhs;
lhs = y(38);
rhs = params(21)*y(7)-x(it_, 4);
residual(36) = lhs - rhs;
lhs = y(39);
rhs = params(22)*y(8)-x(it_, 5);
residual(37) = lhs - rhs;
lhs = y(40);
rhs = params(23)*y(9)-x(it_, 6);
residual(38) = lhs - rhs;
lhs = y(41);
rhs = params(24)*y(10)+x(it_, 7);
residual(39) = lhs - rhs;
lhs = y(65);
rhs = log(y(25))-(log(steady_state(1)));
residual(40) = lhs - rhs;
lhs = y(66);
rhs = log(y(26))-(log(steady_state(2)));
residual(41) = lhs - rhs;
lhs = y(67);
rhs = log(y(27))-(log(steady_state(3)));
residual(42) = lhs - rhs;
lhs = y(68);
rhs = log(y(31))-(log(steady_state(7)));
residual(43) = lhs - rhs;
lhs = y(69);
rhs = log(y(32))-(log(steady_state(8)));
residual(44) = lhs - rhs;
lhs = y(70);
rhs = log(y(33))-(log(steady_state(9)));
residual(45) = lhs - rhs;
lhs = y(71);
rhs = log(y(28))-(log(steady_state(4)));
residual(46) = lhs - rhs;
lhs = y(72);
rhs = y(65)-y(68);
residual(47) = lhs - rhs;
lhs = y(73);
rhs = log(y(54))-(log(steady_state(30)));
residual(48) = lhs - rhs;
lhs = y(74);
rhs = log(y(59))-(steady_state(50));
residual(49) = lhs - rhs;
lhs = y(75);
rhs = log(y(63))-(log(steady_state(39)));
residual(50) = lhs - rhs;
lhs = y(62);
rhs = y(65)-(1-params(11))*y(19)-params(11)*y(68);
residual(51) = lhs - rhs;
lhs = y(76);
rhs = y(64)+y(66)-y(14)-params(4);
residual(52) = lhs - rhs;
lhs = y(77);
rhs = y(64)+y(67)-y(15)-params(4);
residual(53) = lhs - rhs;
lhs = y(78);
rhs = y(64)+y(65)-y(13)-params(4);
residual(54) = lhs - rhs;
lhs = y(79);
rhs = y(64)+y(72)-y(20)-params(4);
residual(55) = lhs - rhs;
lhs = y(86);
rhs = y(64)+y(71)-y(19)-params(4);
residual(56) = lhs - rhs;
lhs = y(87);
rhs = y(78)-params(11)*y(81)-(1-params(11))*y(24);
residual(57) = lhs - rhs;
lhs = y(80);
rhs = y(74)-y(22);
residual(58) = lhs - rhs;
lhs = y(81);
rhs = y(68)-y(16);
residual(59) = lhs - rhs;
lhs = y(82);
rhs = y(69)-y(17);
residual(60) = lhs - rhs;
lhs = y(83);
rhs = y(70)-y(18);
residual(61) = lhs - rhs;
lhs = y(84);
rhs = y(75)-y(23);
residual(62) = lhs - rhs;
lhs = y(85);
rhs = y(73)-y(21);
residual(63) = lhs - rhs;

end
