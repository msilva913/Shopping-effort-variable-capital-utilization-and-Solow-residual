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
    T = BRS_pred_labor.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(61, 1);
lhs = T(27);
rhs = y(90)*exp(y(87))*T(12);
residual(1) = lhs - rhs;
lhs = T(27);
rhs = y(91)*exp(y(87))*T(12);
residual(2) = lhs - rhs;
lhs = T(4);
rhs = y(26)*T(2)*exp(y(40))/y(54);
residual(3) = lhs - rhs;
lhs = T(4)*exp(y(39));
rhs = y(27)*y(57)*T(2)*exp(y(40))/y(55);
residual(4) = lhs - rhs;
lhs = y(56);
rhs = exp(y(40))*y(26)-T(6)-T(8)*exp(y(37))*T(26)/T(7);
residual(5) = lhs - rhs;
lhs = y(51);
rhs = params(7)/2*(y(59)-exp(params(4)))^2;
residual(6) = lhs - rhs;
lhs = y(52);
rhs = params(14)*(y(59)-exp(params(4)));
residual(7) = lhs - rhs;
lhs = y(59);
rhs = y(27)/y(1)*exp(y(62));
residual(8) = lhs - rhs;
lhs = y(57)/T(12);
rhs = y(58)*(1-y(59)*y(52)-y(51))+T(11)*y(96)*y(98)*T(29);
residual(9) = lhs - rhs;
lhs = y(58);
rhs = (y(88)*y(92)+y(98)*(1-y(94)))*T(29);
residual(10) = lhs - rhs;
lhs = y(58);
rhs = (y(89)*y(93)+y(98)*(1-y(95)))*T(29);
residual(11) = lhs - rhs;
lhs = y(58)*y(49);
rhs = y(41);
residual(12) = lhs - rhs;
lhs = y(58)*y(50);
rhs = y(42);
residual(13) = lhs - rhs;
lhs = y(47);
rhs = T(15)+(y(45)-1)*(T(1)+T(15))+(y(45)-1)^2*T(30);
residual(14) = lhs - rhs;
lhs = y(48);
rhs = T(15)+(y(46)-1)*(T(1)+T(15))+(y(46)-1)^2*T(30);
residual(15) = lhs - rhs;
lhs = y(49);
rhs = T(1)+T(15)+(y(45)-1)*params(6)*(T(1)+T(15));
residual(16) = lhs - rhs;
lhs = y(50);
rhs = T(1)+T(15)+(y(46)-1)*params(6)*(T(1)+T(15));
residual(17) = lhs - rhs;
lhs = y(26);
rhs = T(31)*(T(33)*T(34)*T(35)-T(21));
residual(18) = lhs - rhs;
lhs = y(27);
rhs = T(36)*(T(37)*T(38)*T(39)-T(22));
residual(19) = lhs - rhs;
lhs = exp(y(62))*y(27)*(1-y(51));
rhs = exp(y(62))*(y(29)+y(30))-y(2)*(1-y(47))-y(3)*(1-y(48));
residual(20) = lhs - rhs;
lhs = y(43)*T(12);
rhs = T(17)*(y(26)+T(21)*T(31))/y(4);
residual(21) = lhs - rhs;
lhs = y(44)*T(12)/y(57);
rhs = T(17)*(y(27)+T(22)*T(36))/y(5);
residual(22) = lhs - rhs;
lhs = y(41)*T(12);
rhs = (y(26)+T(21)*T(31))*exp(y(62))*T(16)/(y(45)*y(2));
residual(23) = lhs - rhs;
lhs = y(42)*T(12)/y(57);
rhs = (y(27)+T(22)*T(36))*exp(y(62))*T(16)/(y(46)*y(3));
residual(24) = lhs - rhs;
lhs = y(31);
rhs = y(32)+y(33);
residual(25) = lhs - rhs;
lhs = y(28);
rhs = y(29)+y(30);
residual(26) = lhs - rhs;
lhs = y(53);
rhs = y(54)+y(55);
residual(27) = lhs - rhs;
lhs = y(25);
rhs = y(26)+y(27)*params(22);
residual(28) = lhs - rhs;
lhs = y(61);
rhs = T(41)/T(43)+T(45)/T(47);
residual(29) = lhs - rhs;
lhs = y(62);
rhs = params(4)*(1-params(15))+params(15)*y(12)+x(it_, 1);
residual(30) = lhs - rhs;
lhs = y(34);
rhs = params(16)*y(6)+x(it_, 2);
residual(31) = lhs - rhs;
lhs = y(35);
rhs = params(17)*y(7)+x(it_, 3);
residual(32) = lhs - rhs;
lhs = y(36);
rhs = y(34)+y(35);
residual(33) = lhs - rhs;
lhs = y(37);
rhs = params(18)*y(8)-x(it_, 4);
residual(34) = lhs - rhs;
lhs = y(38);
rhs = params(19)*y(9)-x(it_, 5);
residual(35) = lhs - rhs;
lhs = y(39);
rhs = params(20)*y(10)-x(it_, 6);
residual(36) = lhs - rhs;
lhs = y(40);
rhs = params(21)*y(11)+x(it_, 7);
residual(37) = lhs - rhs;
lhs = y(63);
rhs = log(y(25))-(log(steady_state(1)));
residual(38) = lhs - rhs;
lhs = y(64);
rhs = log(y(26))-(log(steady_state(2)));
residual(39) = lhs - rhs;
lhs = y(65);
rhs = log(y(27))-(log(steady_state(3)));
residual(40) = lhs - rhs;
lhs = y(66);
rhs = log(y(31))-(log(steady_state(7)));
residual(41) = lhs - rhs;
lhs = y(67);
rhs = log(y(32))-(log(steady_state(8)));
residual(42) = lhs - rhs;
lhs = y(68);
rhs = log(y(33))-(log(steady_state(9)));
residual(43) = lhs - rhs;
lhs = y(69);
rhs = log(y(28))-(log(steady_state(4)));
residual(44) = lhs - rhs;
lhs = y(70);
rhs = y(63)-y(66);
residual(45) = lhs - rhs;
lhs = y(71);
rhs = log(y(53))-(log(steady_state(29)));
residual(46) = lhs - rhs;
lhs = y(72);
rhs = log(y(57))-(steady_state(48));
residual(47) = lhs - rhs;
lhs = y(73);
rhs = log(y(61))-(log(steady_state(37)));
residual(48) = lhs - rhs;
lhs = y(60);
rhs = y(63)-(1-params(10))*y(19)-params(10)*y(66);
residual(49) = lhs - rhs;
lhs = y(74);
rhs = y(62)+y(64)-y(14)-params(4);
residual(50) = lhs - rhs;
lhs = y(75);
rhs = y(62)+y(65)-y(15)-params(4);
residual(51) = lhs - rhs;
lhs = y(76);
rhs = y(62)+y(63)-y(13)-params(4);
residual(52) = lhs - rhs;
lhs = y(77);
rhs = y(62)+y(70)-y(20)-params(4);
residual(53) = lhs - rhs;
lhs = y(84);
rhs = y(62)+y(69)-y(19)-params(4);
residual(54) = lhs - rhs;
lhs = y(85);
rhs = y(76)-params(10)*y(79)-(1-params(10))*y(24);
residual(55) = lhs - rhs;
lhs = y(78);
rhs = y(72)-y(22);
residual(56) = lhs - rhs;
lhs = y(79);
rhs = y(66)-y(16);
residual(57) = lhs - rhs;
lhs = y(80);
rhs = y(67)-y(17);
residual(58) = lhs - rhs;
lhs = y(81);
rhs = y(68)-y(18);
residual(59) = lhs - rhs;
lhs = y(82);
rhs = y(73)-y(23);
residual(60) = lhs - rhs;
lhs = y(83);
rhs = y(71)-y(21);
residual(61) = lhs - rhs;

end
