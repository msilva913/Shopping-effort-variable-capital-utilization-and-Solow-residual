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
    T = SU_sectoral_com_wage_markup.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(104, 1);
    residual(1) = (y(51)) - (T(57)^(1/(1+params(19))));
    residual(2) = (T(55)*T(5)*T(59)) - ((1-params(16))*y(64)/(params(7)*exp(y(60))));
    residual(3) = (T(56)*T(6)*T(59)) - ((1-params(16))*y(65)/(params(7)*exp(y(60))));
    residual(4) = (y(91)) - ((1-params(16))*y(87)^(-params(1)));
    residual(5) = (y(35)) - (y(34)*T(35));
    residual(6) = (y(36)) - (y(34)*T(7));
    residual(7) = (T(8)) - (y(35)*params(16)*y(88)/y(84));
    residual(8) = (T(8)) - (y(36)*params(16)*y(89)/y(85));
    residual(9) = (T(8)*exp(y(58))) - (params(16)*y(90)*y(38)/y(86));
    residual(10) = (y(87)) - (y(34)-params(15)*y(1)-T(10)-T(60));
    residual(11) = (y(34)) - (T(38)^(1/T(1)));
    residual(12) = (y(77)) - (T(11)*(y(95)-exp(params(3)))^2);
    residual(13) = (y(78)) - (T(11)*(y(96)-exp(params(3)))^2);
    residual(14) = (y(79)) - (T(11)*(y(97)-exp(params(3)))^2);
    residual(15) = (y(80)) - (params(10)*(y(95)-exp(params(3))));
    residual(16) = (y(81)) - (params(10)*(y(96)-exp(params(3))));
    residual(17) = (y(82)) - (params(10)*(y(97)-exp(params(3))));
    residual(18) = (y(95)) - (y(39)/y(2)*T(12));
    residual(19) = (y(96)) - (T(12)*y(40)/y(3));
    residual(20) = (y(97)) - (T(12)*y(41)/y(4));
    residual(21) = (y(71)) - (T(42)+(y(67)-1)*T(43)+(y(67)-1)^2*T(61));
    residual(22) = (y(72)) - (T(42)+(y(68)-1)*T(43)+(y(68)-1)^2*T(61));
    residual(23) = (y(73)) - (T(42)+(y(69)-1)*T(43)+(y(69)-1)^2*params(9)*T(43)/2);
    residual(24) = (y(74)) - (T(43)+(y(67)-1)*params(8)*T(43));
    residual(25) = (y(75)) - (T(43)+(y(68)-1)*params(8)*T(43));
    residual(26) = (y(76)) - (T(43)+(y(69)-1)*params(9)*T(43));
    residual(27) = (y(90)/(1-params(16))) - (y(92)*(1-y(95)*y(80)-y(77))+T(16));
    residual(28) = (y(90)/(1-params(16))) - (y(93)*(1-y(96)*y(81)-y(78))+T(18));
    residual(29) = (y(90)/(1-params(16))) - (y(94)*(1-y(97)*y(82)-y(79))+T(20));
    residual(30) = (y(92)) - (T(14)*(y(137)*y(140)+y(150)*(1-y(143))));
    residual(31) = (y(93)) - (T(14)*(y(138)*y(141)+y(151)*(1-y(144))));
    residual(32) = (y(94)) - (T(14)*(y(139)*y(142)+y(152)*(1-y(145))));
    residual(33) = (y(74)*y(92)) - (y(61));
    residual(34) = (y(75)*y(93)) - (y(62));
    residual(35) = (y(76)*y(94)) - (y(63));
    residual(36) = (y(35)) - (T(67));
    residual(37) = (y(36)) - (T(72));
    residual(38) = (y(38)) - (T(77));
    residual(39) = (T(12)*y(43)) - (T(12)*y(39)*(1-y(77))+y(5)*(1-y(71)));
    residual(40) = (T(12)*y(44)) - (T(12)*y(40)*(1-y(78))+y(6)*(1-y(72)));
    residual(41) = (T(12)*y(45)) - (T(12)*y(41)*(1-y(79))+y(7)*(1-y(73)));
    residual(42) = ((1-params(16))*y(64)/y(88)) - (T(2)*(y(35)+T(48)*T(62))/y(47));
    residual(43) = ((1-params(16))*y(64)/y(89)) - (T(2)*(y(36)+T(49)*T(68))/y(48));
    residual(44) = ((1-params(16))*y(65)/y(90)) - (T(2)*(y(38)+T(50)*T(73))/y(50));
    residual(45) = ((1-params(16))*y(61)/y(88)) - ((y(35)+T(48)*T(62))*T(12)*T(44)/(y(67)*y(5)));
    residual(46) = ((1-params(16))*y(62)/y(89)) - ((y(36)+T(49)*T(68))*T(12)*T(44)/(y(68)*y(6)));
    residual(47) = ((1-params(16))*y(63)/y(90)) - ((y(38)+T(50)*T(73))*T(12)*T(44)/(y(69)*y(7)));
    residual(48) = (y(46)) - (y(50)+y(47)+y(48));
    residual(49) = (y(49)) - (y(47)+y(48));
    residual(50) = (y(42)) - (y(45)+y(43)+y(44));
    residual(51) = (y(38)) - (y(41)+y(39)+y(40));
    residual(52) = (y(83)) - (y(84)+y(85)+exp(y(58))*y(86));
    residual(53) = (y(70)) - (y(67)*T(21)+y(68)*T(22)+y(69)*T(23));
    residual(54) = (y(66)) - (y(64)*y(49)/y(46)+y(65)*y(50)/y(46));
    residual(55) = (y(33)) - (y(34)+y(38)*params(28));
    residual(56) = (y(37)) - (T(24)*T(34));
    residual(57) = (y(100)) - (T(67)/T(80));
    residual(58) = (y(101)) - (T(72)/T(83));
    residual(59) = (y(102)) - (T(77)/T(86));
    residual(60) = (y(99)) - ((y(35)*y(100)+y(36)*y(101)+y(38)*y(102))/y(33));
    residual(61) = (y(55)) - (exp(y(52))*y(34)/y(33)+exp(y(54))*T(23));
    residual(62) = (y(103)) - (params(3)*(1-params(20))+params(20)*y(16)+x(it_, 1));
    residual(63) = (y(52)) - (params(21)*y(8)+x(it_, 2));
    residual(64) = (y(53)) - (params(22)*y(9)+x(it_, 3));
    residual(65) = (y(54)) - (y(52)+y(53));
    residual(66) = (y(56)) - (params(23)*y(10)-x(it_, 4));
    residual(67) = (y(57)) - (params(24)*y(11)-x(it_, 5));
    residual(68) = (y(58)) - (params(25)*y(12)-x(it_, 6));
    residual(69) = (y(59)) - (params(26)*y(13)+x(it_, 7));
    residual(70) = (y(60)) - (params(27)*y(14)+x(it_, 8));
    residual(71) = (y(104)) - (log(y(33))-(log(steady_state(1))));
    residual(72) = (y(105)) - (log(y(34))-(log(steady_state(2))));
    residual(73) = (y(106)) - (log(y(38))-(log(steady_state(6))));
    residual(74) = (y(107)) - (log(y(46))-(log(steady_state(14))));
    residual(75) = (y(108)) - (log(y(49))-(log(steady_state(17))));
    residual(76) = (y(109)) - (log(y(50))-(log(steady_state(18))));
    residual(77) = (y(110)) - (log(y(42))-(log(steady_state(10))));
    residual(78) = (y(111)) - (y(104)-y(107));
    residual(79) = (y(112)) - (log(y(83))-(log(steady_state(51))));
    residual(80) = (y(113)) - (log(y(70))-(log(steady_state(38))));
    residual(81) = (y(114)) - (log(y(90))-(log(steady_state(58))));
    residual(82) = (y(115)) - (log(y(99))-(log(steady_state(67))));
    residual(83) = (y(116)) - (log(y(100))-(log(steady_state(68))));
    residual(84) = (y(117)) - (log(y(102))-(log(steady_state(70))));
    residual(85) = (y(118)) - (log(y(66))-(log(steady_state(34))));
    residual(86) = (y(98)) - (log(y(37))-(log(steady_state(5))));
    residual(87) = (y(119)) - (log(y(55))-(log(steady_state(23))));
    residual(88) = (y(120)) - (y(103)+y(105)-y(18)-params(3));
    residual(89) = (y(121)) - (y(103)+y(106)-y(19)-params(3));
    residual(90) = (y(122)) - (y(103)+y(104)-y(17)-params(3));
    residual(91) = (y(124)) - (y(103)+y(111)-y(24)-params(3));
    residual(92) = (y(136)) - (y(103)+y(110)-y(23)-params(3));
    residual(93) = (y(133)) - (y(103)+y(118)-y(31)-params(3));
    residual(94) = (y(123)) - (y(98)-y(15)+params(13)*(y(103)-params(3)));
    residual(95) = (y(132)) - (y(103)+y(119)-y(32)-params(3));
    residual(96) = (y(125)) - (y(114)-y(27));
    residual(97) = (y(126)) - (y(107)-y(20));
    residual(98) = (y(127)) - (y(108)-y(21));
    residual(99) = (y(128)) - (y(109)-y(22));
    residual(100) = (y(129)) - (y(116)-y(29));
    residual(101) = (y(130)) - (y(117)-y(30));
    residual(102) = (y(131)) - (y(115)-y(28));
    residual(103) = (y(134)) - (y(112)-y(25));
    residual(104) = (y(135)) - (y(113)-y(26));

end
