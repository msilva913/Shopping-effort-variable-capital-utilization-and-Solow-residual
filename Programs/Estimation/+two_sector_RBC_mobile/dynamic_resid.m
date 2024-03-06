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
    T = two_sector_RBC_mobile.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(34, 1);
lhs = y(11);
rhs = y(9);
residual(1) = lhs - rhs;
lhs = 0;
rhs = y(10);
residual(2) = lhs - rhs;
lhs = y(13);
rhs = y(11)+y(16);
residual(3) = lhs - rhs;
lhs = y(19)+y(20);
rhs = y(13);
residual(4) = lhs - rhs;
lhs = y(19)+y(21);
rhs = y(14);
residual(5) = lhs - rhs;
lhs = y(18)+y(27)+y(2);
rhs = y(19)+y(20);
residual(6) = lhs - rhs;
lhs = y(17)+y(28)+y(3);
rhs = y(19)+y(21);
residual(7) = lhs - rhs;
lhs = y(32)+1/params(4)*y(22);
rhs = y(19)+y(26);
residual(8) = lhs - rhs;
lhs = y(25);
rhs = (1-params(2))*y(4)+params(2)*y(14)-T(1)*(y(27)*(1-T(2))+y(28)*T(2));
residual(9) = lhs - rhs;
lhs = y(11)+y(26);
rhs = (-params(5))/(1-params(9))*(y(16)-params(9)*y(1));
residual(10) = lhs - rhs;
lhs = y(12);
rhs = y(46)-y(26)+y(45)*params(1)*T(1)+params(1)*y(43);
residual(11) = lhs - rhs;
lhs = y(12);
rhs = params(1)*y(43)+y(46)-y(26)+y(44)*params(1)*T(1);
residual(12) = lhs - rhs;
lhs = y(18);
rhs = y(12)+y(27)*params(3);
residual(13) = lhs - rhs;
lhs = y(17);
rhs = y(12)+y(28)*params(3);
residual(14) = lhs - rhs;
lhs = y(12);
rhs = params(2)*params(8)*(y(14)-y(4));
residual(15) = lhs - rhs;
lhs = y(38);
rhs = (-y(9));
residual(16) = lhs - rhs;
lhs = y(13);
rhs = y(9)+y(29)+(1-params(6)*params(7))*(y(27)+y(2))+y(20)*(1-(1-params(6)*params(7)));
residual(17) = lhs - rhs;
lhs = y(14);
rhs = y(21)*(1-(1-params(6)*params(7)))+y(30)+(1-params(6)*params(7))*(y(28)+y(3));
residual(18) = lhs - rhs;
lhs = y(22);
rhs = y(20)*(1-T(2))+y(21)*T(2);
residual(19) = lhs - rhs;
lhs = y(25);
rhs = y(23)*(1-T(2))+y(24)*T(2);
residual(20) = lhs - rhs;
lhs = y(15);
rhs = y(13)*(1-T(2))+y(14)*T(2);
residual(21) = lhs - rhs;
lhs = y(29);
rhs = params(10)*y(5)+x(it_, 2);
residual(22) = lhs - rhs;
lhs = y(31);
rhs = params(11)*y(6)+x(it_, 1);
residual(23) = lhs - rhs;
lhs = y(30);
rhs = y(29)+y(31);
residual(24) = lhs - rhs;
lhs = y(32);
rhs = (params(12)+params(13))*y(7)+params(13)*(-params(12))*y(8)-x(it_, 3);
residual(25) = lhs - rhs;
lhs = y(34);
rhs = y(13)-y(9);
residual(26) = lhs - rhs;
lhs = y(35);
rhs = y(14);
residual(27) = lhs - rhs;
lhs = y(33);
rhs = y(14)*T(2)+(y(13)-y(9))*(1-T(2));
residual(28) = lhs - rhs;
lhs = y(41);
rhs = y(33)-y(4)*(1-params(7))-params(7)*y(22);
residual(29) = lhs - rhs;
lhs = y(39);
rhs = y(33)-y(22);
residual(30) = lhs - rhs;
lhs = y(40);
rhs = y(19)+y(22)-y(33);
residual(31) = lhs - rhs;
lhs = y(36);
rhs = y(20);
residual(32) = lhs - rhs;
lhs = y(37);
rhs = y(21);
residual(33) = lhs - rhs;
lhs = y(42);
rhs = y(7);
residual(34) = lhs - rhs;

end
