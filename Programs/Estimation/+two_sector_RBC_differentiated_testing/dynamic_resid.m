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
    T = two_sector_RBC_differentiated_testing.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(37, 1);
lhs = y(13);
rhs = y(11);
residual(1) = lhs - rhs;
lhs = 0;
rhs = y(12);
residual(2) = lhs - rhs;
lhs = y(16);
rhs = y(13)+y(21);
residual(3) = lhs - rhs;
lhs = y(26)+y(27);
rhs = y(16)+(y(11)-y(16))*T(5);
residual(4) = lhs - rhs;
lhs = y(26)+y(28);
rhs = y(17)+(-y(17))*T(5);
residual(5) = lhs - rhs;
lhs = y(25)+y(34)+y(30);
rhs = y(26)+y(27);
residual(6) = lhs - rhs;
lhs = y(24)+y(35)+y(31);
rhs = y(26)+y(28);
residual(7) = lhs - rhs;
lhs = y(37)+1/params(5)*y(29);
rhs = y(26)+y(33);
residual(8) = lhs - rhs;
lhs = y(30);
rhs = (1-params(3))*y(4)+params(3)*y(1)-T(1)*(1-params(10))*y(6);
residual(9) = lhs - rhs;
lhs = y(31);
rhs = (1-params(3))*y(5)+params(3)*y(2)-params(10)*y(7)*T(1);
residual(10) = lhs - rhs;
lhs = y(13)+y(33);
rhs = (-params(6))/(1-params(12))*(y(21)-params(12)*y(3));
residual(11) = lhs - rhs;
lhs = y(14);
rhs = y(52)-y(33)+y(51)*params(2)*T(1)+params(2)*y(48);
residual(12) = lhs - rhs;
lhs = y(15);
rhs = y(52)-y(33)+y(50)*params(2)*T(1)+params(2)*y(49);
residual(13) = lhs - rhs;
lhs = y(25);
rhs = y(14)+y(34)*params(4);
residual(14) = lhs - rhs;
lhs = y(24);
rhs = y(15)+y(35)*params(4);
residual(15) = lhs - rhs;
lhs = y(14);
rhs = params(3)*params(11)*(y(18)-y(30));
residual(16) = lhs - rhs;
lhs = y(15);
rhs = params(3)*params(11)*(y(19)-y(31));
residual(17) = lhs - rhs;
lhs = y(41);
rhs = (-y(11));
residual(18) = lhs - rhs;
lhs = y(16);
rhs = T(4)*(y(11)+y(36)+(y(34)+y(30))*T(3)+y(27)*(1-T(3)))-y(11)*(T(4)-1);
residual(19) = lhs - rhs;
lhs = y(17);
rhs = T(4)*(y(28)*(1-T(3))+y(36)+(y(35)+y(31))*T(3));
residual(20) = lhs - rhs;
lhs = y(22);
rhs = T(4)*(y(27)*(1-T(3))+y(11)+y(36)+y(30)*T(3))-y(11)*(T(4)-1);
residual(21) = lhs - rhs;
lhs = y(23);
rhs = T(4)*(y(28)*(1-T(3))+y(36)+y(31)*T(3));
residual(22) = lhs - rhs;
lhs = y(29);
rhs = params(10)*y(28)+(1-params(10))*y(27);
residual(23) = lhs - rhs;
lhs = y(32);
rhs = params(10)*y(31)+(1-params(10))*y(30);
residual(24) = lhs - rhs;
lhs = y(17);
rhs = params(10)*y(19)+(1-params(10))*y(18);
residual(25) = lhs - rhs;
lhs = y(20);
rhs = params(10)*y(17)+(1-params(10))*y(16);
residual(26) = lhs - rhs;
lhs = y(36);
rhs = params(13)*y(8)+x(it_, 1);
residual(27) = lhs - rhs;
lhs = y(37);
rhs = (params(15)+params(16))*y(9)+params(16)*(-params(15))*y(10)-x(it_, 2);
residual(28) = lhs - rhs;
lhs = y(39);
rhs = y(16)-y(11);
residual(29) = lhs - rhs;
lhs = y(40);
rhs = y(17);
residual(30) = lhs - rhs;
lhs = y(38);
rhs = params(10)*y(17)+(1-params(10))*(y(16)-y(11));
residual(31) = lhs - rhs;
lhs = y(46);
rhs = params(10)*y(23)+(1-params(10))*(y(22)-y(11));
residual(32) = lhs - rhs;
lhs = y(44);
rhs = y(38)-(1-params(9))*y(32)-params(9)*y(29);
residual(33) = lhs - rhs;
lhs = y(45);
rhs = y(46)-(1-params(9))*y(32)-params(9)*y(29);
residual(34) = lhs - rhs;
lhs = y(42);
rhs = y(38)-y(29);
residual(35) = lhs - rhs;
lhs = y(43);
rhs = y(26)+y(29)-y(38);
residual(36) = lhs - rhs;
lhs = y(47);
rhs = y(9);
residual(37) = lhs - rhs;

end
