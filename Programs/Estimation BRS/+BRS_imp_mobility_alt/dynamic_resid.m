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
    T = BRS_imp_mobility_alt.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(53, 1);
lhs = y(30);
rhs = T(31)^(1/(1+params(14)));
residual(1) = lhs - rhs;
lhs = T(3)*T(32);
rhs = y(37)*exp(y(34))*T(14);
residual(2) = lhs - rhs;
lhs = T(4);
rhs = y(22)*T(2)*exp(y(34))/y(45);
residual(3) = lhs - rhs;
lhs = T(4);
rhs = y(23)*y(49)*T(2)*exp(y(34))/y(46);
residual(4) = lhs - rhs;
lhs = y(47);
rhs = exp(y(34))*y(22)-T(6)-T(8)*T(32)/T(7)-params(13)*y(48);
residual(5) = lhs - rhs;
lhs = y(48);
rhs = exp(y(34))*y(1)-T(9)-T(10)*T(32)/T(7);
residual(6) = lhs - rhs;
lhs = y(50);
rhs = y(49)/T(14)*T(15);
residual(7) = lhs - rhs;
lhs = y(50);
rhs = T(35);
residual(8) = lhs - rhs;
lhs = y(50);
rhs = T(36);
residual(9) = lhs - rhs;
lhs = y(51);
rhs = y(23)/y(2)*exp(y(53));
residual(10) = lhs - rhs;
lhs = y(50)*y(42);
rhs = y(35);
residual(11) = lhs - rhs;
lhs = y(50)*y(43);
rhs = y(36);
residual(12) = lhs - rhs;
lhs = y(40);
rhs = T(21)+(y(38)-1)*(T(1)+T(21))+(y(38)-1)^2*T(37);
residual(13) = lhs - rhs;
lhs = y(41);
rhs = T(21)+(y(39)-1)*(T(1)+T(21))+(y(39)-1)^2*T(37);
residual(14) = lhs - rhs;
lhs = y(42);
rhs = T(1)+T(21)+(y(38)-1)*params(5)*(T(1)+T(21));
residual(15) = lhs - rhs;
lhs = y(43);
rhs = T(1)+T(21)+(y(39)-1)*params(5)*(T(1)+T(21));
residual(16) = lhs - rhs;
lhs = y(22);
rhs = T(41)*T(42);
residual(17) = lhs - rhs;
lhs = y(23);
rhs = T(45)*T(46);
residual(18) = lhs - rhs;
lhs = y(23)*exp(y(53));
rhs = exp(y(53))*(y(25)+y(26))-y(3)*(1-y(40))-y(4)*(1-y(41))+T(13)*(y(51)-params(7)/params(8))^2;
residual(19) = lhs - rhs;
lhs = y(37)*T(14);
rhs = y(22)*params(9)*T(14)/y(28);
residual(20) = lhs - rhs;
lhs = y(37)*T(14)/y(49);
rhs = y(23)*params(9)*T(14)/y(29);
residual(21) = lhs - rhs;
lhs = y(35)*T(14);
rhs = exp(y(53))*y(22)*params(8)*(T(1)+T(21))/(y(38)*y(3));
residual(22) = lhs - rhs;
lhs = y(36)*T(14)/y(49);
rhs = exp(y(53))*y(23)*params(8)*(T(1)+T(21))/(y(39)*y(4));
residual(23) = lhs - rhs;
lhs = y(27);
rhs = y(28)+y(29);
residual(24) = lhs - rhs;
lhs = y(24);
rhs = y(25)+y(26);
residual(25) = lhs - rhs;
lhs = y(44);
rhs = y(45)+y(46);
residual(26) = lhs - rhs;
lhs = y(21);
rhs = y(22)+params(20)*y(23);
residual(27) = lhs - rhs;
lhs = y(52);
rhs = T(19)*y(22)/y(21)*T(23)*T(47)+T(20)*y(23)/y(21)*T(24)*T(48);
residual(28) = lhs - rhs;
lhs = y(54);
rhs = x(it_, 1)+params(15)*y(11)+(1-params(15))*params(3)*(1-params(8)*(T(1)+T(21)));
residual(29) = lhs - rhs;
lhs = y(53);
rhs = y(54)/(1-params(8)*(T(1)+T(21)));
residual(30) = lhs - rhs;
lhs = y(31);
rhs = params(16)*y(6)+x(it_, 2);
residual(31) = lhs - rhs;
lhs = y(32);
rhs = params(17)*y(7)-x(it_, 3);
residual(32) = lhs - rhs;
lhs = y(33);
rhs = params(18)*y(8)-x(it_, 4);
residual(33) = lhs - rhs;
lhs = y(34);
rhs = params(19)*y(9)+x(it_, 5);
residual(34) = lhs - rhs;
lhs = y(55);
rhs = log(y(21))-(log(steady_state(1)));
residual(35) = lhs - rhs;
lhs = y(56);
rhs = log(y(22))-(log(steady_state(2)));
residual(36) = lhs - rhs;
lhs = y(57);
rhs = log(y(23))-(log(steady_state(3)));
residual(37) = lhs - rhs;
lhs = y(58);
rhs = log(y(27))-(log(steady_state(7)));
residual(38) = lhs - rhs;
lhs = y(59);
rhs = log(y(28))-(log(steady_state(8)));
residual(39) = lhs - rhs;
lhs = y(60);
rhs = log(y(29))-(log(steady_state(9)));
residual(40) = lhs - rhs;
lhs = y(61);
rhs = y(55)-y(58);
residual(41) = lhs - rhs;
lhs = y(62);
rhs = log(y(44))-(log(steady_state(24)));
residual(42) = lhs - rhs;
lhs = y(63);
rhs = log(y(49))-(steady_state(43));
residual(43) = lhs - rhs;
lhs = y(64);
rhs = log(y(52))-(log(steady_state(32)));
residual(44) = lhs - rhs;
lhs = y(65);
rhs = y(53)+y(56)-y(13)-params(3);
residual(45) = lhs - rhs;
lhs = y(66);
rhs = y(53)+y(57)-y(14)-params(3);
residual(46) = lhs - rhs;
lhs = y(67);
rhs = y(53)+y(55)-y(12)-params(3);
residual(47) = lhs - rhs;
lhs = y(68);
rhs = y(53)+y(61)-y(18)-params(3);
residual(48) = lhs - rhs;
lhs = y(69);
rhs = y(63)-y(19);
residual(49) = lhs - rhs;
lhs = y(70);
rhs = y(58)-y(15);
residual(50) = lhs - rhs;
lhs = y(71);
rhs = y(59)-y(16);
residual(51) = lhs - rhs;
lhs = y(72);
rhs = y(60)-y(17);
residual(52) = lhs - rhs;
lhs = y(73);
rhs = y(64)-y(20);
residual(53) = lhs - rhs;

end
