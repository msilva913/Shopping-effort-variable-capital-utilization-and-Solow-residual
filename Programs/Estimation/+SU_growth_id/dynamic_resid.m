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
    T = SU_growth_id.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(49, 1);
    residual(1) = (T(26)) - ((1-params(8))*y(36));
    residual(2) = (T(3)) - (params(8)*y(20)/y(38));
    residual(3) = (T(3)) - (params(8)*y(41)*y(21)/y(39));
    residual(4) = (y(40)) - (y(20)-T(5)-T(27));
    residual(5) = (y(41)*T(6)) - (T(8)*T(7)*T(29));
    residual(6) = (y(69)) - (y(68));
    residual(7) = (y(20)) - (T(17)*T(34));
    residual(8) = (y(21)) - (T(18)*T(38));
    residual(9) = (y(21)*exp(y(42))) - (exp(y(42))*(y(24)+y(25))-(y(1)+y(2))*T(28));
    residual(10) = ((1-params(8))*y(36)) - ((1-params(8))*params(7)*y(20)/y(27));
    residual(11) = ((1-params(8))*y(34)) - (exp(y(42))*y(20)*T(19)/y(1));
    residual(12) = ((1-params(8))*y(36)/y(41)) - ((1-params(8))*params(7)*y(21)/y(28));
    residual(13) = ((1-params(8))*y(35)/y(41)) - (exp(y(42))*y(21)*T(19)/y(2));
    residual(14) = (y(26)) - (y(27)+y(28));
    residual(15) = (y(23)) - (y(24)+y(25));
    residual(16) = (y(37)) - (y(38)+y(39));
    residual(17) = (y(19)) - (y(20)+params(16)*y(21));
    residual(18) = (y(22)) - (T(9)*T(16));
    residual(19) = (y(43)) - (T(30));
    residual(20) = (y(44)) - (T(35));
    residual(21) = (y(45)) - (y(43)*y(20)/(y(20)+y(21))+y(44)*y(21)/(y(20)+y(21)));
    residual(22) = (y(42)) - (params(3)*(1-params(11))+params(11)*y(7)+x(it_, 1));
    residual(23) = (y(29)) - (params(12)*y(3)+x(it_, 2));
    residual(24) = (y(30)) - (params(13)*y(4)+x(it_, 3));
    residual(25) = (y(31)) - (y(29)+y(30));
    residual(26) = (y(32)) - (params(14)*y(5)-x(it_, 4));
    residual(27) = (y(33)) - (params(15)*y(6)-x(it_, 5));
    residual(28) = (y(46)) - (log(y(19))-(log(steady_state(1))));
    residual(29) = (y(47)) - (log(y(20))-(log(steady_state(2))));
    residual(30) = (y(48)) - (log(y(21))-(log(steady_state(3))));
    residual(31) = (y(49)) - (log(y(26))-(log(steady_state(8))));
    residual(32) = (y(50)) - (log(y(27))-(log(steady_state(9))));
    residual(33) = (y(51)) - (log(y(28))-(log(steady_state(10))));
    residual(34) = (y(52)) - (y(46)-y(49));
    residual(35) = (y(53)) - (log(y(22))-(log(steady_state(4))));
    residual(36) = (y(54)) - (log(y(37))-(log(steady_state(19))));
    residual(37) = (y(55)) - (log(y(41))-(steady_state(37)));
    residual(38) = (y(56)) - (log(y(45))-(log(steady_state(27))));
    residual(39) = (y(57)) - (y(42)+y(47)-y(9)-params(3));
    residual(40) = (y(58)) - (y(42)+y(48)-y(10)-params(3));
    residual(41) = (y(59)) - (y(42)+y(46)-y(8)-params(3));
    residual(42) = (y(61)) - (y(42)+y(52)-y(14)-params(3));
    residual(43) = (y(60)) - (y(53)-y(15)+params(7)*(y(42)-params(3)));
    residual(44) = (y(62)) - (y(55)-y(17));
    residual(45) = (y(65)) - (y(49)-y(11));
    residual(46) = (y(63)) - (y(50)-y(12));
    residual(47) = (y(64)) - (y(51)-y(13));
    residual(48) = (y(66)) - (y(54)-y(16));
    residual(49) = (y(67)) - (y(56)-y(18));

end
