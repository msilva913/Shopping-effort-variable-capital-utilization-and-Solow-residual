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
    T = RBC.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(38, 1);
lhs = T(16);
rhs = y(32);
residual(1) = lhs - rhs;
lhs = y(33);
rhs = y(17)-T(17);
residual(2) = lhs - rhs;
lhs = T(2)*y(34);
rhs = T(4)*T(3)*params(2)*(y(54)+y(57)*T(18));
residual(3) = lhs - rhs;
lhs = y(55);
rhs = y(54);
residual(4) = lhs - rhs;
lhs = y(17);
rhs = T(7)*T(23);
residual(5) = lhs - rhs;
lhs = y(18);
rhs = T(10)*T(27);
residual(6) = lhs - rhs;
lhs = exp(y(35))*y(18);
rhs = exp(y(35))*(y(21)+y(22))-(y(1)+y(2))*T(18);
residual(7) = lhs - rhs;
lhs = y(32);
rhs = params(7)*y(17)/y(24);
residual(8) = lhs - rhs;
lhs = y(30);
rhs = exp(y(35))*y(17)*T(13)/y(1);
residual(9) = lhs - rhs;
lhs = y(32)/y(34);
rhs = params(7)*y(18)/y(25);
residual(10) = lhs - rhs;
lhs = y(31)/y(34);
rhs = exp(y(35))*y(18)*T(13)/y(2);
residual(11) = lhs - rhs;
lhs = y(23);
rhs = y(24)+y(25);
residual(12) = lhs - rhs;
lhs = y(20);
rhs = y(21)+y(22);
residual(13) = lhs - rhs;
lhs = y(16);
rhs = y(17)+params(12)*y(18);
residual(14) = lhs - rhs;
lhs = y(19);
rhs = T(5)*T(12);
residual(15) = lhs - rhs;
lhs = y(35);
rhs = params(3)*(1-params(8))+params(8)*y(6)+x(it_, 1);
residual(16) = lhs - rhs;
lhs = y(26);
rhs = params(9)*y(3)+x(it_, 2);
residual(17) = lhs - rhs;
lhs = y(27);
rhs = params(10)*y(4)+x(it_, 3);
residual(18) = lhs - rhs;
lhs = y(28);
rhs = y(26)+y(27);
residual(19) = lhs - rhs;
lhs = y(29);
rhs = params(11)*y(5)-x(it_, 4);
residual(20) = lhs - rhs;
lhs = y(36);
rhs = log(y(16))-(log(steady_state(1)));
residual(21) = lhs - rhs;
lhs = y(37);
rhs = log(y(17))-(log(steady_state(2)));
residual(22) = lhs - rhs;
lhs = y(38);
rhs = log(y(18))-(log(steady_state(3)));
residual(23) = lhs - rhs;
lhs = y(39);
rhs = log(y(23))-(log(steady_state(8)));
residual(24) = lhs - rhs;
lhs = y(40);
rhs = log(y(24))-(log(steady_state(9)));
residual(25) = lhs - rhs;
lhs = y(41);
rhs = log(y(25))-(log(steady_state(10)));
residual(26) = lhs - rhs;
lhs = y(42);
rhs = y(36)-y(39);
residual(27) = lhs - rhs;
lhs = y(43);
rhs = log(y(19))-(log(steady_state(4)));
residual(28) = lhs - rhs;
lhs = y(44);
rhs = log(y(34))-(log(steady_state(19)));
residual(29) = lhs - rhs;
lhs = y(45);
rhs = y(35)+y(37)-y(8)-params(3);
residual(30) = lhs - rhs;
lhs = y(46);
rhs = y(35)+y(38)-y(9)-params(3);
residual(31) = lhs - rhs;
lhs = y(47);
rhs = y(35)+y(36)-y(7)-params(3);
residual(32) = lhs - rhs;
lhs = y(48);
rhs = y(35)+y(42)-y(13)-params(3);
residual(33) = lhs - rhs;
lhs = y(49);
rhs = y(43)-y(14)+params(7)*(y(35)-params(3));
residual(34) = lhs - rhs;
lhs = y(50);
rhs = y(44)-y(15);
residual(35) = lhs - rhs;
lhs = y(53);
rhs = y(39)-y(10);
residual(36) = lhs - rhs;
lhs = y(51);
rhs = y(40)-y(11);
residual(37) = lhs - rhs;
lhs = y(52);
rhs = y(41)-y(12);
residual(38) = lhs - rhs;

end
