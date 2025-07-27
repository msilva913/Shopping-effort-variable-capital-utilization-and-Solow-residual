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
    T = SU_sectoral_wo_vcu.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(93, 1);
    residual(1) = (y(51)) - (T(53)^(1/(1+params(17))));
    residual(2) = (T(51)*T(5)*T(55)) - ((1-params(14))*y(65)/(params(7)*exp(y(60))));
    residual(3) = (T(52)*T(6)*T(55)) - ((1-params(14))*y(66)/(params(7)*exp(y(61))));
    residual(4) = (y(82)) - ((1-params(14))*y(78)^(-params(1)));
    residual(5) = (y(35)) - (y(34)*T(33));
    residual(6) = (y(36)) - (y(34)*T(7));
    residual(7) = (T(8)) - (y(35)*params(14)*y(79)/y(75));
    residual(8) = (T(8)) - (y(36)*params(14)*y(80)/y(76));
    residual(9) = (T(8)*exp(y(58))) - (params(14)*y(81)*y(38)/y(77));
    residual(10) = (y(78)) - (y(34)-params(13)*y(1)-T(10)-T(56));
    residual(11) = (y(34)) - (T(36)^(1/T(1)));
    residual(12) = (y(68)) - (T(11)*(y(86)-exp(params(3)))^2);
    residual(13) = (y(69)) - (T(11)*(y(87)-exp(params(3)))^2);
    residual(14) = (y(70)) - (T(11)*(y(88)-exp(params(3)))^2);
    residual(15) = (y(71)) - (params(8)*(y(86)-exp(params(3))));
    residual(16) = (y(72)) - (params(8)*(y(87)-exp(params(3))));
    residual(17) = (y(73)) - (params(8)*(y(88)-exp(params(3))));
    residual(18) = (y(86)) - (y(39)/y(2)*T(12));
    residual(19) = (y(87)) - (T(12)*y(40)/y(3));
    residual(20) = (y(88)) - (T(12)*y(41)/y(4));
    residual(21) = (y(81)/(1-params(14))) - (y(83)*(1-y(86)*y(71)-y(68))+T(16));
    residual(22) = (y(81)/(1-params(14))) - (y(84)*(1-y(87)*y(72)-y(69))+T(18));
    residual(23) = (y(81)/(1-params(14))) - (y(85)*(1-y(88)*y(73)-y(70))+T(20));
    residual(24) = (y(83)) - (T(14)*(y(126)+y(133)*T(57)));
    residual(25) = (y(84)) - (T(14)*(y(127)+y(134)*T(57)));
    residual(26) = (y(85)) - (T(14)*(y(128)+y(135)*T(57)));
    residual(27) = (y(35)) - (T(58)*(T(37)*T(62)-T(44)));
    residual(28) = (y(36)) - (T(63)*(T(38)*T(66)-T(45)));
    residual(29) = (y(38)) - (T(67)*(T(39)*T(70)-T(46)));
    residual(30) = (T(12)*y(43)) - (T(12)*y(39)*(1-y(68))+y(5)*T(57));
    residual(31) = (T(12)*y(44)) - (T(12)*y(40)*(1-y(69))+y(6)*T(57));
    residual(32) = (T(12)*y(45)) - (T(12)*y(41)*(1-y(70))+y(7)*T(57));
    residual(33) = ((1-params(14))*y(65)/y(79)) - (T(2)*(y(35)+T(44)*T(58))/y(47));
    residual(34) = ((1-params(14))*y(65)/y(80)) - (T(2)*(y(36)+T(45)*T(63))/y(48));
    residual(35) = ((1-params(14))*y(66)/y(81)) - (T(2)*(y(38)+T(46)*T(67))/y(50));
    residual(36) = ((1-params(14))*y(62)/y(79)) - ((y(35)+T(44)*T(58))*T(12)*T(40)/y(5));
    residual(37) = ((1-params(14))*y(63)/y(80)) - ((y(36)+T(45)*T(63))*T(12)*T(40)/y(6));
    residual(38) = ((1-params(14))*y(64)/y(81)) - ((y(38)+T(46)*T(67))*T(12)*T(40)/y(7));
    residual(39) = (y(46)) - (y(50)+y(47)+y(48));
    residual(40) = (y(49)) - (y(47)+y(48));
    residual(41) = (y(42)) - (y(45)+y(43)+y(44));
    residual(42) = (y(38)) - (y(41)+y(39)+y(40));
    residual(43) = (y(74)) - (y(75)+y(76)+exp(y(58))*y(77));
    residual(44) = (y(67)) - (y(65)*y(49)/y(46)+y(66)*y(50)/y(46));
    residual(45) = (y(33)) - (y(34)+y(38)*params(27));
    residual(46) = (y(37)) - (T(21)*T(32));
    residual(47) = (y(91)) - (T(58));
    residual(48) = (y(93)) - (T(67));
    residual(49) = (y(92)) - (T(63));
    residual(50) = (y(90)) - ((y(35)*y(91)+y(36)*y(92)+y(38)*y(93))/y(33));
    residual(51) = (y(55)) - (exp(y(52))*y(34)/y(33)+exp(y(54))*T(28));
    residual(52) = (y(94)) - (params(3)*(1-params(18))+params(18)*y(17)+x(it_, 1));
    residual(53) = (y(52)) - (params(19)*y(8)+x(it_, 2));
    residual(54) = (y(53)) - (params(20)*y(9)+x(it_, 3));
    residual(55) = (y(54)) - (y(52)+y(53));
    residual(56) = (y(56)) - (params(21)*y(10)-x(it_, 4));
    residual(57) = (y(57)) - (params(22)*y(11)-x(it_, 5));
    residual(58) = (y(58)) - (params(23)*y(12)-x(it_, 6));
    residual(59) = (y(59)) - (params(24)*y(13)+x(it_, 7));
    residual(60) = (y(60)) - (params(25)*y(14)+x(it_, 8));
    residual(61) = (y(61)) - (params(26)*y(15)+x(it_, 9));
    residual(62) = (y(95)) - (log(y(33))-(log(steady_state(1))));
    residual(63) = (y(96)) - (log(y(34))-(log(steady_state(2))));
    residual(64) = (y(97)) - (log(y(38))-(log(steady_state(6))));
    residual(65) = (y(98)) - (log(y(46))-(log(steady_state(14))));
    residual(66) = (y(99)) - (log(y(49))-(log(steady_state(17))));
    residual(67) = (y(100)) - (log(y(50))-(log(steady_state(18))));
    residual(68) = (y(101)) - (log(y(42))-(log(steady_state(10))));
    residual(69) = (y(102)) - (y(95)-y(98));
    residual(70) = (y(103)) - (log(y(74))-(log(steady_state(42))));
    residual(71) = (y(104)) - (log(y(81))-(log(steady_state(49))));
    residual(72) = (y(105)) - (log(y(90))-(log(steady_state(58))));
    residual(73) = (y(106)) - (log(y(91))-(log(steady_state(59))));
    residual(74) = (y(107)) - (log(y(93))-(log(steady_state(61))));
    residual(75) = (y(108)) - (log(y(67))-(log(steady_state(35))));
    residual(76) = (y(89)) - (log(y(37))-(log(steady_state(5))));
    residual(77) = (y(109)) - (log(y(55))-(log(steady_state(23))));
    residual(78) = (y(110)) - (y(94)+y(96)-y(19)-params(3));
    residual(79) = (y(111)) - (y(94)+y(97)-y(20)-params(3));
    residual(80) = (y(112)) - (y(94)+y(95)-y(18)-params(3));
    residual(81) = (y(114)) - (y(94)+y(102)-y(25)-params(3));
    residual(82) = (y(125)) - (y(94)+y(101)-y(24)-params(3));
    residual(83) = (y(123)) - (y(94)+y(108)-y(31)-params(3));
    residual(84) = (y(113)) - (y(89)-y(16)+params(11)*(y(94)-params(3)));
    residual(85) = (y(122)) - (y(94)+y(109)-y(32)-params(3));
    residual(86) = (y(115)) - (y(104)-y(27));
    residual(87) = (y(116)) - (y(98)-y(21));
    residual(88) = (y(117)) - (y(99)-y(22));
    residual(89) = (y(118)) - (y(100)-y(23));
    residual(90) = (y(119)) - (y(106)-y(29));
    residual(91) = (y(120)) - (y(107)-y(30));
    residual(92) = (y(121)) - (y(105)-y(28));
    residual(93) = (y(124)) - (y(103)-y(26));

end
