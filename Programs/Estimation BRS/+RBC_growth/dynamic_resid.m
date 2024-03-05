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
    T = RBC_growth.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(55, 1);
lhs = y(30);
rhs = T(20)^(1/(1+params(13)));
residual(1) = lhs - rhs;
lhs = T(18)*T(4)*T(22);
rhs = exp(y(35))*y(38);
residual(2) = lhs - rhs;
lhs = T(19)*T(5)*T(22);
rhs = exp(y(35))*y(39);
residual(3) = lhs - rhs;
lhs = y(48);
rhs = exp(y(35))*(y(22)-params(12)*y(1))-T(23);
residual(4) = lhs - rhs;
lhs = y(46);
rhs = params(7)/2*(y(51)-exp(params(4)))^2;
residual(5) = lhs - rhs;
lhs = y(47);
rhs = params(7)*(y(51)-exp(params(4)));
residual(6) = lhs - rhs;
lhs = y(51);
rhs = y(23)/y(2)*exp(y(54));
residual(7) = lhs - rhs;
lhs = y(49);
rhs = y(50)*(1-y(51)*y(47)-y(46))+T(8)*y(83)*y(85)*T(25);
residual(8) = lhs - rhs;
lhs = y(50);
rhs = (y(77)*y(79)+y(85)*(1-y(81)))*T(25);
residual(9) = lhs - rhs;
lhs = y(50);
rhs = (y(78)*y(80)+y(85)*(1-y(82)))*T(25);
residual(10) = lhs - rhs;
lhs = y(50)*y(44);
rhs = y(36);
residual(11) = lhs - rhs;
lhs = y(50)*y(45);
rhs = y(37);
residual(12) = lhs - rhs;
lhs = y(42);
rhs = T(13)+(y(40)-1)*(T(1)+T(13))+(y(40)-1)^2*T(26);
residual(13) = lhs - rhs;
lhs = y(43);
rhs = T(13)+(y(41)-1)*(T(1)+T(13))+(y(41)-1)^2*T(26);
residual(14) = lhs - rhs;
lhs = y(44);
rhs = T(1)+T(13)+(y(40)-1)*params(6)*(T(1)+T(13));
residual(15) = lhs - rhs;
lhs = y(45);
rhs = T(1)+T(13)+(y(41)-1)*params(6)*(T(1)+T(13));
residual(16) = lhs - rhs;
lhs = y(22);
rhs = T(11)*T(28)*T(29)-params(11)*(1-params(8));
residual(17) = lhs - rhs;
lhs = y(23);
rhs = T(12)*T(30)*T(31)-params(8)*params(11);
residual(18) = lhs - rhs;
lhs = exp(y(54))*y(23)*(1-y(46));
rhs = exp(y(54))*(y(25)+y(26))-y(3)*(1-y(42))-y(4)*(1-y(43));
residual(19) = lhs - rhs;
lhs = y(38);
rhs = T(2)*(y(22)+params(11)*(1-params(8)))/y(28);
residual(20) = lhs - rhs;
lhs = y(39)/y(49);
rhs = T(2)*(y(23)+params(8)*params(11))/y(29);
residual(21) = lhs - rhs;
lhs = y(36);
rhs = (y(22)+params(11)*(1-params(8)))*exp(y(54))*T(14)/(y(40)*y(3));
residual(22) = lhs - rhs;
lhs = y(37)/y(49);
rhs = (y(23)+params(8)*params(11))*exp(y(54))*T(14)/(y(41)*y(4));
residual(23) = lhs - rhs;
lhs = y(27);
rhs = y(28)+y(29);
residual(24) = lhs - rhs;
lhs = y(24);
rhs = y(25)+y(26);
residual(25) = lhs - rhs;
lhs = y(21);
rhs = y(22)+y(23)*params(19);
residual(26) = lhs - rhs;
lhs = y(53);
rhs = T(32)/T(34)+T(35)/T(37);
residual(27) = lhs - rhs;
lhs = y(54);
rhs = params(4)*(1-params(14))+params(14)*y(9)+x(it_, 1);
residual(28) = lhs - rhs;
lhs = y(31);
rhs = params(15)*y(5)+x(it_, 2);
residual(29) = lhs - rhs;
lhs = y(32);
rhs = params(16)*y(6)+x(it_, 3);
residual(30) = lhs - rhs;
lhs = y(33);
rhs = y(31)+y(32);
residual(31) = lhs - rhs;
lhs = y(34);
rhs = params(17)*y(7)-x(it_, 4);
residual(32) = lhs - rhs;
lhs = y(35);
rhs = params(18)*y(8)+x(it_, 5);
residual(33) = lhs - rhs;
lhs = y(55);
rhs = log(y(21))-(log(steady_state(1)));
residual(34) = lhs - rhs;
lhs = y(56);
rhs = log(y(22))-(log(steady_state(2)));
residual(35) = lhs - rhs;
lhs = y(57);
rhs = log(y(23))-(log(steady_state(3)));
residual(36) = lhs - rhs;
lhs = y(58);
rhs = log(y(27))-(log(steady_state(7)));
residual(37) = lhs - rhs;
lhs = y(59);
rhs = log(y(28))-(log(steady_state(8)));
residual(38) = lhs - rhs;
lhs = y(60);
rhs = log(y(29))-(log(steady_state(9)));
residual(39) = lhs - rhs;
lhs = y(61);
rhs = log(y(24))-(log(steady_state(4)));
residual(40) = lhs - rhs;
lhs = y(62);
rhs = y(55)-y(58);
residual(41) = lhs - rhs;
lhs = y(63);
rhs = log(y(49))-(steady_state(43));
residual(42) = lhs - rhs;
lhs = y(64);
rhs = log(y(53))-(log(steady_state(33)));
residual(43) = lhs - rhs;
lhs = y(52);
rhs = y(55)-(1-params(10))*y(16)-params(10)*y(58);
residual(44) = lhs - rhs;
lhs = y(65);
rhs = y(54)+y(56)-y(11)-params(4);
residual(45) = lhs - rhs;
lhs = y(66);
rhs = y(54)+y(57)-y(12)-params(4);
residual(46) = lhs - rhs;
lhs = y(67);
rhs = y(54)+y(55)-y(10)-params(4);
residual(47) = lhs - rhs;
lhs = y(68);
rhs = y(54)+y(62)-y(17)-params(4);
residual(48) = lhs - rhs;
lhs = y(74);
rhs = y(54)+y(61)-y(16)-params(4);
residual(49) = lhs - rhs;
lhs = y(75);
rhs = y(67)-params(10)*y(70)-(1-params(10))*y(20);
residual(50) = lhs - rhs;
lhs = y(69);
rhs = y(63)-y(18);
residual(51) = lhs - rhs;
lhs = y(70);
rhs = y(58)-y(13);
residual(52) = lhs - rhs;
lhs = y(71);
rhs = y(59)-y(14);
residual(53) = lhs - rhs;
lhs = y(72);
rhs = y(60)-y(15);
residual(54) = lhs - rhs;
lhs = y(73);
rhs = y(64)-y(19);
residual(55) = lhs - rhs;

end
