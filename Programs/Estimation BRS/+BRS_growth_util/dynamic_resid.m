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
    T = BRS_growth_util.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(60, 1);
lhs = T(3)*T(26);
rhs = y(41)*exp(y(38))*T(12);
residual(1) = lhs - rhs;
lhs = T(4);
rhs = y(24)*T(2)*exp(y(38))/y(51);
residual(2) = lhs - rhs;
lhs = T(4)*exp(y(37));
rhs = y(25)*y(54)*T(2)*exp(y(38))/y(52);
residual(3) = lhs - rhs;
lhs = y(53);
rhs = exp(y(38))*y(24)-T(6)-T(8)*T(26)/T(7);
residual(4) = lhs - rhs;
lhs = y(48);
rhs = params(7)/2*(y(56)-exp(params(4)))^2;
residual(5) = lhs - rhs;
lhs = y(49);
rhs = params(14)*(y(56)-exp(params(4)));
residual(6) = lhs - rhs;
lhs = y(56);
rhs = y(25)/y(1)*exp(y(59));
residual(7) = lhs - rhs;
lhs = y(54)/T(12);
rhs = y(55)*(1-y(56)*y(49)-y(48))+T(11)*y(90)*y(92)*T(28);
residual(8) = lhs - rhs;
lhs = y(55);
rhs = (y(84)*y(86)+y(92)*(1-y(88)))*T(28);
residual(9) = lhs - rhs;
lhs = y(55);
rhs = (y(85)*y(87)+y(92)*(1-y(89)))*T(28);
residual(10) = lhs - rhs;
lhs = y(55)*y(46);
rhs = y(39);
residual(11) = lhs - rhs;
lhs = y(55)*y(47);
rhs = y(40);
residual(12) = lhs - rhs;
lhs = y(44);
rhs = T(15)+(y(42)-1)*(T(1)+T(15))+(y(42)-1)^2*T(29);
residual(13) = lhs - rhs;
lhs = y(45);
rhs = T(15)+(y(43)-1)*(T(1)+T(15))+(y(43)-1)^2*T(29);
residual(14) = lhs - rhs;
lhs = y(46);
rhs = T(1)+T(15)+(y(42)-1)*params(6)*(T(1)+T(15));
residual(15) = lhs - rhs;
lhs = y(47);
rhs = T(1)+T(15)+(y(43)-1)*params(6)*(T(1)+T(15));
residual(16) = lhs - rhs;
lhs = y(24);
rhs = T(30)*(T(32)*T(33)*T(34)-T(21));
residual(17) = lhs - rhs;
lhs = y(25);
rhs = T(35)*(T(36)*T(37)*T(38)-T(22));
residual(18) = lhs - rhs;
lhs = exp(y(59))*y(25)*(1-y(48));
rhs = exp(y(59))*(y(27)+y(28))-y(2)*(1-y(44))-y(3)*(1-y(45));
residual(19) = lhs - rhs;
lhs = y(41)*T(12);
rhs = T(17)*(y(24)+T(21)*T(30))/y(30);
residual(20) = lhs - rhs;
lhs = y(41)*T(12)/y(54);
rhs = T(17)*(y(25)+T(22)*T(35))/y(31);
residual(21) = lhs - rhs;
lhs = y(39)*T(12);
rhs = (y(24)+T(21)*T(30))*exp(y(59))*T(16)/(y(42)*y(2));
residual(22) = lhs - rhs;
lhs = y(40)*T(12)/y(54);
rhs = (y(25)+T(22)*T(35))*exp(y(59))*T(16)/(y(43)*y(3));
residual(23) = lhs - rhs;
lhs = y(29);
rhs = y(30)+y(31);
residual(24) = lhs - rhs;
lhs = y(26);
rhs = y(27)+y(28);
residual(25) = lhs - rhs;
lhs = y(50);
rhs = y(51)+y(52);
residual(26) = lhs - rhs;
lhs = y(23);
rhs = y(24)+y(25)*params(22);
residual(27) = lhs - rhs;
lhs = y(58);
rhs = T(40)/T(42)+T(44)/T(46);
residual(28) = lhs - rhs;
lhs = y(59);
rhs = params(4)*(1-params(15))+params(15)*y(10)+x(it_, 1);
residual(29) = lhs - rhs;
lhs = y(32);
rhs = params(16)*y(4)+x(it_, 2);
residual(30) = lhs - rhs;
lhs = y(33);
rhs = params(17)*y(5)+x(it_, 3);
residual(31) = lhs - rhs;
lhs = y(34);
rhs = y(32)+y(33);
residual(32) = lhs - rhs;
lhs = y(35);
rhs = params(18)*y(6)-x(it_, 4);
residual(33) = lhs - rhs;
lhs = y(36);
rhs = params(19)*y(7)-x(it_, 5);
residual(34) = lhs - rhs;
lhs = y(37);
rhs = params(20)*y(8)-x(it_, 6);
residual(35) = lhs - rhs;
lhs = y(38);
rhs = params(21)*y(9)+x(it_, 7);
residual(36) = lhs - rhs;
lhs = y(60);
rhs = log(y(23))-(log(steady_state(1)));
residual(37) = lhs - rhs;
lhs = y(61);
rhs = log(y(24))-(log(steady_state(2)));
residual(38) = lhs - rhs;
lhs = y(62);
rhs = log(y(25))-(log(steady_state(3)));
residual(39) = lhs - rhs;
lhs = y(63);
rhs = log(y(29))-(log(steady_state(7)));
residual(40) = lhs - rhs;
lhs = y(64);
rhs = log(y(30))-(log(steady_state(8)));
residual(41) = lhs - rhs;
lhs = y(65);
rhs = log(y(31))-(log(steady_state(9)));
residual(42) = lhs - rhs;
lhs = y(66);
rhs = log(y(26))-(log(steady_state(4)));
residual(43) = lhs - rhs;
lhs = y(67);
rhs = y(60)-y(63);
residual(44) = lhs - rhs;
lhs = y(68);
rhs = log(y(50))-(log(steady_state(28)));
residual(45) = lhs - rhs;
lhs = y(69);
rhs = log(y(54))-(steady_state(47));
residual(46) = lhs - rhs;
lhs = y(70);
rhs = log(y(58))-(log(steady_state(36)));
residual(47) = lhs - rhs;
lhs = y(57);
rhs = y(60)-(1-params(10))*y(17)-params(10)*y(63);
residual(48) = lhs - rhs;
lhs = y(71);
rhs = y(59)+y(61)-y(12)-params(4);
residual(49) = lhs - rhs;
lhs = y(72);
rhs = y(59)+y(62)-y(13)-params(4);
residual(50) = lhs - rhs;
lhs = y(73);
rhs = y(59)+y(60)-y(11)-params(4);
residual(51) = lhs - rhs;
lhs = y(74);
rhs = y(59)+y(67)-y(18)-params(4);
residual(52) = lhs - rhs;
lhs = y(81);
rhs = y(59)+y(66)-y(17)-params(4);
residual(53) = lhs - rhs;
lhs = y(82);
rhs = y(73)-params(10)*y(76)-(1-params(10))*y(22);
residual(54) = lhs - rhs;
lhs = y(75);
rhs = y(69)-y(20);
residual(55) = lhs - rhs;
lhs = y(76);
rhs = y(63)-y(14);
residual(56) = lhs - rhs;
lhs = y(77);
rhs = y(64)-y(15);
residual(57) = lhs - rhs;
lhs = y(78);
rhs = y(65)-y(16);
residual(58) = lhs - rhs;
lhs = y(79);
rhs = y(70)-y(21);
residual(59) = lhs - rhs;
lhs = y(80);
rhs = y(68)-y(19);
residual(60) = lhs - rhs;

end
