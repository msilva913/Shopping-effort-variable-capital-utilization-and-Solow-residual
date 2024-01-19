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
    T = BRS.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(32, 1);
lhs = T(19);
rhs = (1-params(8))*y(23);
residual(1) = lhs - rhs;
lhs = T(3);
rhs = params(8)*y(8)/y(25);
residual(2) = lhs - rhs;
lhs = T(3);
rhs = params(8)*y(28)*y(9)/y(26);
residual(3) = lhs - rhs;
lhs = y(27);
rhs = y(8)-T(5)-T(20);
residual(4) = lhs - rhs;
lhs = y(28)*T(6);
rhs = T(7)*((1-params(8))*y(39)+y(42)*T(8))*T(11);
residual(5) = lhs - rhs;
lhs = y(40);
rhs = y(39);
residual(6) = lhs - rhs;
lhs = y(8);
rhs = T(9)*T(23);
residual(7) = lhs - rhs;
lhs = y(9);
rhs = T(10)*T(26);
residual(8) = lhs - rhs;
lhs = y(9);
rhs = y(11)+y(12)-(y(1)+y(2))*T(8);
residual(9) = lhs - rhs;
lhs = (1-params(8))*y(23);
rhs = (1-params(8))*params(7)*y(8)/y(14);
residual(10) = lhs - rhs;
lhs = y(23)/y(21);
rhs = y(1)*T(27)/y(14);
residual(11) = lhs - rhs;
lhs = (1-params(8))*y(23)/y(28);
rhs = (1-params(8))*params(7)*y(9)/y(15);
residual(12) = lhs - rhs;
lhs = y(23)/y(22);
rhs = y(2)*T(27)/y(15);
residual(13) = lhs - rhs;
lhs = y(13);
rhs = y(14)+y(15);
residual(14) = lhs - rhs;
lhs = y(10);
rhs = y(11)+y(12);
residual(15) = lhs - rhs;
lhs = y(24);
rhs = y(25)+y(26);
residual(16) = lhs - rhs;
lhs = y(7);
rhs = y(8)+params(15)*y(9);
residual(17) = lhs - rhs;
lhs = y(16);
rhs = params(11)*y(3)+x(it_, 1);
residual(18) = lhs - rhs;
lhs = y(17);
rhs = params(12)*y(4)+x(it_, 2);
residual(19) = lhs - rhs;
lhs = y(18);
rhs = y(16)+y(17);
residual(20) = lhs - rhs;
lhs = y(19);
rhs = params(13)*y(5)-x(it_, 3);
residual(21) = lhs - rhs;
lhs = y(20);
rhs = params(14)*y(6)-x(it_, 4);
residual(22) = lhs - rhs;
lhs = y(29);
rhs = log(y(7));
residual(23) = lhs - rhs;
lhs = y(30);
rhs = log(y(8));
residual(24) = lhs - rhs;
lhs = y(31);
rhs = log(y(9));
residual(25) = lhs - rhs;
lhs = y(32);
rhs = log(y(13));
residual(26) = lhs - rhs;
lhs = y(33);
rhs = y(29)-y(32);
residual(27) = lhs - rhs;
lhs = y(34);
rhs = log(y(24));
residual(28) = lhs - rhs;
lhs = y(35);
rhs = y(31);
residual(29) = lhs - rhs;
lhs = y(36);
rhs = y(29);
residual(30) = lhs - rhs;
lhs = y(37);
rhs = y(33);
residual(31) = lhs - rhs;
lhs = y(38);
rhs = log(y(28));
residual(32) = lhs - rhs;

end
