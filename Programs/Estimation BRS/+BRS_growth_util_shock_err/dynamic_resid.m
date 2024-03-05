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
    T = BRS_growth_util_shock_err.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(52, 1);
lhs = T(3)*T(20);
rhs = y(36)*T(10);
residual(1) = lhs - rhs;
lhs = T(4);
rhs = T(2)*y(20)/y(44);
residual(2) = lhs - rhs;
lhs = T(4);
rhs = y(21)*T(2)*y(47)/y(45);
residual(3) = lhs - rhs;
lhs = y(46);
rhs = y(20)-T(6)-T(8)*T(20)/T(7);
residual(4) = lhs - rhs;
lhs = y(48);
rhs = y(47)/T(10);
residual(5) = lhs - rhs;
lhs = y(48);
rhs = (y(71)*y(73)+(1-y(75))*y(78))*T(22);
residual(6) = lhs - rhs;
lhs = y(48);
rhs = (y(72)*y(74)+y(78)*(1-y(76)))*T(22);
residual(7) = lhs - rhs;
lhs = y(48)*y(41);
rhs = y(34);
residual(8) = lhs - rhs;
lhs = y(48)*y(42);
rhs = y(35);
residual(9) = lhs - rhs;
lhs = y(39);
rhs = T(24);
residual(10) = lhs - rhs;
lhs = y(40);
rhs = T(25);
residual(11) = lhs - rhs;
lhs = y(41);
rhs = exp(y(33))*(T(1)+T(11)+(y(37)-1)*params(6)*(T(1)+T(11)));
residual(12) = lhs - rhs;
lhs = y(42);
rhs = exp(y(33))*(T(1)+T(11)+(y(38)-1)*params(6)*(T(1)+T(11)));
residual(13) = lhs - rhs;
lhs = y(20);
rhs = T(30)*T(31);
residual(14) = lhs - rhs;
lhs = y(21);
rhs = T(35)*T(36);
residual(15) = lhs - rhs;
lhs = y(21)*exp(y(50));
rhs = exp(y(50))*(y(23)+y(24))-y(1)*(1-y(39))-y(2)*(1-y(40));
residual(16) = lhs - rhs;
lhs = y(36)*T(10);
rhs = y(20)*params(10)*T(10)/y(26);
residual(17) = lhs - rhs;
lhs = y(36)*T(10)/y(47);
rhs = y(21)*params(10)*T(10)/y(27);
residual(18) = lhs - rhs;
lhs = y(34)*T(10);
rhs = exp(y(50))*y(20)*params(9)*(T(1)+T(11))/(y(37)*y(1));
residual(19) = lhs - rhs;
lhs = y(35)*T(10)/y(47);
rhs = exp(y(50))*y(21)*params(9)*(T(1)+T(11))/(y(38)*y(2));
residual(20) = lhs - rhs;
lhs = y(25);
rhs = y(26)+y(27);
residual(21) = lhs - rhs;
lhs = y(22);
rhs = y(23)+y(24);
residual(22) = lhs - rhs;
lhs = y(43);
rhs = y(44)+y(45);
residual(23) = lhs - rhs;
lhs = y(19);
rhs = y(20)+params(20)*y(21);
residual(24) = lhs - rhs;
lhs = y(49);
rhs = y(37)*y(20)/y(19)+y(38)*y(21)/y(19);
residual(25) = lhs - rhs;
lhs = y(50);
rhs = params(4)*(1-params(14))+params(14)*y(8)+x(it_, 1);
residual(26) = lhs - rhs;
lhs = y(28);
rhs = params(15)*y(3)+x(it_, 2);
residual(27) = lhs - rhs;
lhs = y(29);
rhs = params(16)*y(4)+x(it_, 3);
residual(28) = lhs - rhs;
lhs = y(30);
rhs = y(28)+y(29);
residual(29) = lhs - rhs;
lhs = y(31);
rhs = params(17)*y(5)-x(it_, 4);
residual(30) = lhs - rhs;
lhs = y(32);
rhs = params(18)*y(6)-x(it_, 5);
residual(31) = lhs - rhs;
lhs = y(33);
rhs = params(19)*y(7)-x(it_, 6);
residual(32) = lhs - rhs;
lhs = y(51);
rhs = log(y(19))-(log(steady_state(1)));
residual(33) = lhs - rhs;
lhs = y(52);
rhs = log(y(20))-(log(steady_state(2)));
residual(34) = lhs - rhs;
lhs = y(53);
rhs = log(y(21))-(log(steady_state(3)));
residual(35) = lhs - rhs;
lhs = y(54);
rhs = log(y(25))-(log(steady_state(7)));
residual(36) = lhs - rhs;
lhs = y(55);
rhs = log(y(26))-(log(steady_state(8)));
residual(37) = lhs - rhs;
lhs = y(56);
rhs = log(y(27))-(log(steady_state(9)));
residual(38) = lhs - rhs;
lhs = y(57);
rhs = y(51)-y(54);
residual(39) = lhs - rhs;
lhs = y(58);
rhs = log(y(43))-(log(steady_state(25)));
residual(40) = lhs - rhs;
lhs = y(59);
rhs = log(y(47))-(steady_state(41));
residual(41) = lhs - rhs;
lhs = y(60);
rhs = log(y(49))-(log(steady_state(31)));
residual(42) = lhs - rhs;
lhs = y(61);
rhs = y(50)+y(52)-y(10)-params(4);
residual(43) = lhs - rhs;
lhs = y(62);
rhs = y(50)+y(53)-y(11)-params(4);
residual(44) = lhs - rhs;
lhs = y(63);
rhs = y(50)+y(51)-y(9)-params(4);
residual(45) = lhs - rhs;
lhs = y(64);
rhs = y(50)+y(57)-y(15)-params(4);
residual(46) = lhs - rhs;
lhs = y(65);
rhs = y(59)-y(17);
residual(47) = lhs - rhs;
lhs = y(66);
rhs = y(54)-y(12);
residual(48) = lhs - rhs;
lhs = y(67);
rhs = y(55)-y(13);
residual(49) = lhs - rhs;
lhs = y(68);
rhs = y(56)-y(14);
residual(50) = lhs - rhs;
lhs = y(69);
rhs = y(60)-y(18);
residual(51) = lhs - rhs;
lhs = y(70);
rhs = y(58)-y(16);
residual(52) = lhs - rhs;

end
