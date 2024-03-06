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
    T = two_sector_RBC_vcu.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(25, 1);
lhs = y(6);
rhs = y(4);
residual(1) = lhs - rhs;
lhs = 0;
rhs = y(5);
residual(2) = lhs - rhs;
lhs = y(7);
rhs = y(6)+y(10);
residual(3) = lhs - rhs;
lhs = y(12)+y(13);
rhs = y(7);
residual(4) = lhs - rhs;
lhs = y(12)+y(14);
rhs = y(8);
residual(5) = lhs - rhs;
lhs = y(11)+y(20)+y(16);
rhs = y(12)+y(13);
residual(6) = lhs - rhs;
lhs = y(11)+y(20)+y(17);
rhs = y(12)+y(14);
residual(7) = lhs - rhs;
lhs = 1/params(4)*y(15);
rhs = y(12)+y(19);
residual(8) = lhs - rhs;
lhs = y(18);
rhs = (1-params(2))*y(2)+params(2)*y(8)-y(20)*T(1);
residual(9) = lhs - rhs;
lhs = y(6)+y(19);
rhs = (-params(5))/(1-params(8))*(y(10)-params(8)*y(1));
residual(10) = lhs - rhs;
lhs = 0;
rhs = y(30)-y(19)+y(29)*params(1)*T(1);
residual(11) = lhs - rhs;
lhs = y(20);
rhs = y(11)*params(3);
residual(12) = lhs - rhs;
lhs = y(25);
rhs = (-y(4));
residual(13) = lhs - rhs;
lhs = y(7);
rhs = y(4)+y(21)+(1-params(6)*params(7))*(y(20)+y(16))+y(13)*(1-(1-params(6)*params(7)));
residual(14) = lhs - rhs;
lhs = y(8);
rhs = y(14)*(1-(1-params(6)*params(7)))+y(21)+(1-params(6)*params(7))*(y(20)+y(17));
residual(15) = lhs - rhs;
lhs = y(15);
rhs = y(13)*(1-T(2))+y(14)*T(2);
residual(16) = lhs - rhs;
lhs = y(2);
rhs = y(16)*(1-T(2))+y(17)*T(2);
residual(17) = lhs - rhs;
lhs = y(9);
rhs = y(7)*(1-T(2))+y(8)*T(2);
residual(18) = lhs - rhs;
lhs = y(21);
rhs = params(10)*y(3)+x(it_, 1);
residual(19) = lhs - rhs;
lhs = y(23);
rhs = y(7)-y(4);
residual(20) = lhs - rhs;
lhs = y(24);
rhs = y(8);
residual(21) = lhs - rhs;
lhs = y(22);
rhs = y(8)*T(2)+(y(7)-y(4))*(1-T(2));
residual(22) = lhs - rhs;
lhs = y(28);
rhs = y(22)-y(2)*(1-params(7))-params(7)*y(15);
residual(23) = lhs - rhs;
lhs = y(26);
rhs = y(22)-y(15);
residual(24) = lhs - rhs;
lhs = y(27);
rhs = y(12)+y(15)-y(22);
residual(25) = lhs - rhs;

end
