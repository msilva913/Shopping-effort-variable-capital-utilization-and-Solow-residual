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
    T = two_sector_RBC_diff_R.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(23, 1);
lhs = 0;
rhs = y(7);
residual(1) = lhs - rhs;
lhs = y(13)+y(14);
rhs = y(6)+y(10);
residual(2) = lhs - rhs;
lhs = y(13)+y(15);
rhs = y(8);
residual(3) = lhs - rhs;
lhs = y(11)+y(2);
rhs = y(6)+y(10);
residual(4) = lhs - rhs;
lhs = y(12)+y(3);
rhs = y(8);
residual(5) = lhs - rhs;
lhs = 1/params(3)*y(16);
rhs = y(13)+y(20);
residual(6) = lhs - rhs;
lhs = y(19);
rhs = (1-params(2))*y(4)+params(2)*y(8);
residual(7) = lhs - rhs;
lhs = y(6)+y(20);
rhs = (-params(4))/(1-params(8))*(y(10)-params(8)*y(1));
residual(8) = lhs - rhs;
lhs = 0;
rhs = y(31)-y(20)+y(29)*params(1)*(1/params(1)-1+params(2));
residual(9) = lhs - rhs;
residual(10) = y(29)-y(30);
lhs = y(25);
rhs = (-y(6));
residual(11) = lhs - rhs;
lhs = y(10);
rhs = y(21)+(1-params(5)*params(6))*y(2)+y(14)*(1-(1-params(5)*params(6)));
residual(12) = lhs - rhs;
lhs = y(8);
rhs = y(21)+(1-params(5)*params(6))*y(3)+y(15)*(1-(1-params(5)*params(6)));
residual(13) = lhs - rhs;
lhs = y(16);
rhs = y(14)*(1-T(1))+y(15)*T(1);
residual(14) = lhs - rhs;
lhs = y(19);
rhs = y(17)*(1-T(1))+y(18)*T(1);
residual(15) = lhs - rhs;
lhs = y(9);
rhs = (y(6)+y(10))*(1-T(1))+y(8)*T(1);
residual(16) = lhs - rhs;
lhs = y(21);
rhs = params(9)*y(5)+x(it_, 1);
residual(17) = lhs - rhs;
lhs = y(23);
rhs = y(10);
residual(18) = lhs - rhs;
lhs = y(24);
rhs = y(8);
residual(19) = lhs - rhs;
lhs = y(22);
rhs = y(8)*T(1)+y(10)*(1-T(1));
residual(20) = lhs - rhs;
lhs = y(28);
rhs = y(22)-y(19)*(1-params(6))-params(6)*y(16);
residual(21) = lhs - rhs;
lhs = y(26);
rhs = y(22)-y(16);
residual(22) = lhs - rhs;
lhs = y(27);
rhs = y(13)+y(16)-y(22);
residual(23) = lhs - rhs;

end
