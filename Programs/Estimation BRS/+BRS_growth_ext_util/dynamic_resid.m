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
    T = BRS_growth_ext_util.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(52, 1);
lhs = T(27);
rhs = (1-params(10))*exp(y(33))*y(36);
residual(1) = lhs - rhs;
lhs = T(4);
rhs = params(10)*exp(y(33))*y(22)/y(44);
residual(2) = lhs - rhs;
lhs = T(4);
rhs = params(10)*exp(y(33))*y(48)*y(23)/y(45);
residual(3) = lhs - rhs;
lhs = y(46);
rhs = exp(y(33))*y(22)-T(6)-T(28)-params(13)*y(47);
residual(4) = lhs - rhs;
lhs = y(47);
rhs = exp(y(33))*y(1)-T(8)-T(29);
residual(5) = lhs - rhs;
lhs = y(49);
rhs = y(48)/(1-params(10))*T(14);
residual(6) = lhs - rhs;
lhs = y(49);
rhs = T(32);
residual(7) = lhs - rhs;
lhs = y(49);
rhs = T(33);
residual(8) = lhs - rhs;
lhs = y(50);
rhs = y(23)/y(2)*exp(y(52));
residual(9) = lhs - rhs;
lhs = y(49)*y(41);
rhs = y(34);
residual(10) = lhs - rhs;
lhs = y(49)*y(42);
rhs = y(35);
residual(11) = lhs - rhs;
lhs = y(39);
rhs = T(20)+(y(37)-1)*(T(1)+T(20))+(y(37)-1)^2*T(34);
residual(12) = lhs - rhs;
lhs = y(40);
rhs = T(20)+(y(38)-1)*(T(1)+T(20))+(y(38)-1)^2*T(34);
residual(13) = lhs - rhs;
lhs = y(41);
rhs = T(1)+T(20)+(y(37)-1)*params(5)*(T(1)+T(20));
residual(14) = lhs - rhs;
lhs = y(42);
rhs = T(1)+T(20)+(y(38)-1)*params(5)*(T(1)+T(20));
residual(15) = lhs - rhs;
lhs = y(22);
rhs = T(18)*T(38);
residual(16) = lhs - rhs;
lhs = y(23);
rhs = T(19)*T(41);
residual(17) = lhs - rhs;
lhs = y(23)*exp(y(52));
rhs = exp(y(52))*(y(25)+y(26))-y(3)*(1-y(39))-y(4)*(1-y(40))+T(11)*(y(50)-params(7)/params(8))^2;
residual(18) = lhs - rhs;
lhs = (1-params(10))*y(36);
rhs = (1-params(10))*params(9)*y(22)/y(28);
residual(19) = lhs - rhs;
lhs = (1-params(10))*y(36)/y(48);
rhs = (1-params(10))*params(9)*y(23)/y(29);
residual(20) = lhs - rhs;
lhs = (1-params(10))*y(34);
rhs = exp(y(52))*y(22)*params(8)*(T(1)+T(20))/(y(37)*y(3));
residual(21) = lhs - rhs;
lhs = (1-params(10))*y(35)/y(48);
rhs = exp(y(52))*y(23)*params(8)*(T(1)+T(20))/(y(38)*y(4));
residual(22) = lhs - rhs;
lhs = y(27);
rhs = y(28)+y(29);
residual(23) = lhs - rhs;
lhs = y(24);
rhs = y(25)+y(26);
residual(24) = lhs - rhs;
lhs = y(43);
rhs = y(44)+y(45);
residual(25) = lhs - rhs;
lhs = y(21);
rhs = y(22)+params(19)*y(23);
residual(26) = lhs - rhs;
lhs = y(51);
rhs = T(12)*y(22)/y(21)*T(21)*T(42)+T(13)*y(23)/y(21)*T(22)*T(43);
residual(27) = lhs - rhs;
lhs = y(53);
rhs = x(it_, 1)+params(14)*y(11)+(1-params(14))*params(3)*(1-params(8)*(T(1)+T(20)));
residual(28) = lhs - rhs;
lhs = y(52);
rhs = y(53)/(1-params(8)*(T(1)+T(20)));
residual(29) = lhs - rhs;
lhs = y(30);
rhs = params(15)*y(6)+x(it_, 2);
residual(30) = lhs - rhs;
lhs = y(31);
rhs = params(16)*y(7)-x(it_, 3);
residual(31) = lhs - rhs;
lhs = y(32);
rhs = params(17)*y(8)-x(it_, 4);
residual(32) = lhs - rhs;
lhs = y(33);
rhs = params(18)*y(9)+x(it_, 5);
residual(33) = lhs - rhs;
lhs = y(54);
rhs = log(y(21))-(log(steady_state(1)));
residual(34) = lhs - rhs;
lhs = y(55);
rhs = log(y(22))-(log(steady_state(2)));
residual(35) = lhs - rhs;
lhs = y(56);
rhs = log(y(23))-(log(steady_state(3)));
residual(36) = lhs - rhs;
lhs = y(57);
rhs = log(y(27))-(log(steady_state(7)));
residual(37) = lhs - rhs;
lhs = y(58);
rhs = log(y(28))-(log(steady_state(8)));
residual(38) = lhs - rhs;
lhs = y(59);
rhs = log(y(29))-(log(steady_state(9)));
residual(39) = lhs - rhs;
lhs = y(60);
rhs = y(54)-y(57);
residual(40) = lhs - rhs;
lhs = y(61);
rhs = log(y(43))-(log(steady_state(23)));
residual(41) = lhs - rhs;
lhs = y(62);
rhs = log(y(48))-(steady_state(42));
residual(42) = lhs - rhs;
lhs = y(63);
rhs = log(y(51))-(log(steady_state(31)));
residual(43) = lhs - rhs;
lhs = y(64);
rhs = y(55)-y(13);
residual(44) = lhs - rhs;
lhs = y(65);
rhs = y(56)-y(14);
residual(45) = lhs - rhs;
lhs = y(70);
rhs = y(58)-y(16);
residual(46) = lhs - rhs;
lhs = y(71);
rhs = y(59)-y(17);
residual(47) = lhs - rhs;
lhs = y(66);
rhs = y(54)-y(12);
residual(48) = lhs - rhs;
lhs = y(67);
rhs = y(60)-y(18);
residual(49) = lhs - rhs;
lhs = y(68);
rhs = y(62)-y(19);
residual(50) = lhs - rhs;
lhs = y(69);
rhs = y(57)-y(15);
residual(51) = lhs - rhs;
lhs = y(72);
rhs = y(63)-y(20);
residual(52) = lhs - rhs;

end
