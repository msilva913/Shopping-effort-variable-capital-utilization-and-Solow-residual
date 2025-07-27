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
    T = SU_sectoral_wo_demand_shocks.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(100, 1);
    residual(1) = (y(49)) - (T(56)^(1/(1+params(19))));
    residual(2) = (T(54)*T(5)*T(58)) - ((1-params(16))*y(60)/(params(7)*exp(y(55))));
    residual(3) = (T(55)*T(6)*T(58)) - ((1-params(16))*y(61)/(params(7)*exp(y(56))));
    residual(4) = (y(87)) - ((1-params(16))*y(83)^(-params(1)));
    residual(5) = (y(33)) - (y(32)*T(34));
    residual(6) = (y(34)) - (y(32)*T(7));
    residual(7) = (T(8)) - (y(33)*params(16)*y(84)/y(80));
    residual(8) = (T(8)) - (y(34)*params(16)*y(85)/y(81));
    residual(9) = (T(8)) - (params(16)*y(86)*y(36)/y(82));
    residual(10) = (y(83)) - (y(32)-params(15)*y(1)-y(79)^T(9)/T(9)-T(59));
    residual(11) = (y(32)) - (T(37)^(1/T(1)));
    residual(12) = (y(73)) - (T(10)*(y(91)-exp(params(3)))^2);
    residual(13) = (y(74)) - (T(10)*(y(92)-exp(params(3)))^2);
    residual(14) = (y(75)) - (T(10)*(y(93)-exp(params(3)))^2);
    residual(15) = (y(76)) - (params(10)*(y(91)-exp(params(3))));
    residual(16) = (y(77)) - (params(10)*(y(92)-exp(params(3))));
    residual(17) = (y(78)) - (params(10)*(y(93)-exp(params(3))));
    residual(18) = (y(91)) - (y(37)/y(2)*T(11));
    residual(19) = (y(92)) - (T(11)*y(38)/y(3));
    residual(20) = (y(93)) - (T(11)*y(39)/y(4));
    residual(21) = (y(67)) - (T(41)+(y(63)-1)*T(42)+(y(63)-1)^2*T(60));
    residual(22) = (y(68)) - (T(41)+(y(64)-1)*T(42)+(y(64)-1)^2*T(60));
    residual(23) = (y(69)) - (T(41)+(y(65)-1)*T(42)+(y(65)-1)^2*params(9)*T(42)/2);
    residual(24) = (y(70)) - (T(42)+(y(63)-1)*params(8)*T(42));
    residual(25) = (y(71)) - (T(42)+(y(64)-1)*params(8)*T(42));
    residual(26) = (y(72)) - (T(42)+(y(65)-1)*params(9)*T(42));
    residual(27) = (y(86)/(1-params(16))) - (y(88)*(1-y(91)*y(76)-y(73))+T(15));
    residual(28) = (y(86)/(1-params(16))) - (y(89)*(1-y(92)*y(77)-y(74))+T(17));
    residual(29) = (y(86)/(1-params(16))) - (y(90)*(1-y(93)*y(78)-y(75))+T(19));
    residual(30) = (y(88)) - (T(13)*(y(131)*y(134)+y(144)*(1-y(137))));
    residual(31) = (y(89)) - (T(13)*(y(132)*y(135)+y(145)*(1-y(138))));
    residual(32) = (y(90)) - (T(13)*(y(133)*y(136)+y(146)*(1-y(139))));
    residual(33) = (y(70)*y(88)) - (y(57));
    residual(34) = (y(71)*y(89)) - (y(58));
    residual(35) = (y(72)*y(90)) - (y(59));
    residual(36) = (y(33)) - (T(66));
    residual(37) = (y(34)) - (T(71));
    residual(38) = (y(36)) - (T(76));
    residual(39) = (T(11)*y(41)) - (T(11)*y(37)*(1-y(73))+y(5)*(1-y(67)));
    residual(40) = (T(11)*y(42)) - (T(11)*y(38)*(1-y(74))+y(6)*(1-y(68)));
    residual(41) = (T(11)*y(43)) - (T(11)*y(39)*(1-y(75))+y(7)*(1-y(69)));
    residual(42) = ((1-params(16))*y(60)/y(84)) - (T(2)*(y(33)+T(47)*T(61))/y(45));
    residual(43) = ((1-params(16))*y(60)/y(85)) - (T(2)*(y(34)+T(48)*T(67))/y(46));
    residual(44) = ((1-params(16))*y(61)/y(86)) - (T(2)*(y(36)+T(49)*T(72))/y(48));
    residual(45) = ((1-params(16))*y(57)/y(84)) - ((y(33)+T(47)*T(61))*T(11)*T(43)/(y(63)*y(5)));
    residual(46) = ((1-params(16))*y(58)/y(85)) - ((y(34)+T(48)*T(67))*T(11)*T(43)/(y(64)*y(6)));
    residual(47) = ((1-params(16))*y(59)/y(86)) - ((y(36)+T(49)*T(72))*T(11)*T(43)/(y(65)*y(7)));
    residual(48) = (y(44)) - (y(48)+y(45)+y(46));
    residual(49) = (y(47)) - (y(45)+y(46));
    residual(50) = (y(40)) - (y(43)+y(41)+y(42));
    residual(51) = (y(36)) - (y(39)+y(37)+y(38));
    residual(52) = (y(79)) - (y(82)+y(80)+y(81));
    residual(53) = (y(66)) - (y(63)*T(20)+y(64)*T(21)+y(65)*T(22));
    residual(54) = (y(62)) - (y(60)*y(47)/y(44)+y(61)*y(48)/y(44));
    residual(55) = (y(31)) - (y(32)+y(36)*params(27));
    residual(56) = (y(35)) - (T(23)*T(33));
    residual(57) = (y(96)) - (T(66)/T(79));
    residual(58) = (y(97)) - (T(71)/T(82));
    residual(59) = (y(98)) - (T(76)/T(85));
    residual(60) = (y(95)) - ((y(33)*y(96)+y(34)*y(97)+y(36)*y(98))/y(31));
    residual(61) = (y(99)) - (params(3)*(1-params(20))+params(20)*y(15)+x(it_, 1));
    residual(62) = (y(50)) - (params(21)*y(8)+x(it_, 2));
    residual(63) = (y(51)) - (params(22)*y(9)+x(it_, 3));
    residual(64) = (y(52)) - (y(50)+y(51));
    residual(65) = (y(53)) - (params(23)*y(10)-x(it_, 4));
    residual(66) = (y(54)) - (params(24)*y(11)+x(it_, 5));
    residual(67) = (y(55)) - (params(25)*y(12)+x(it_, 6));
    residual(68) = (y(56)) - (params(26)*y(13)+x(it_, 7));
    residual(69) = (y(100)) - (log(y(31))-(log(steady_state(1))));
    residual(70) = (y(101)) - (log(y(32))-(log(steady_state(2))));
    residual(71) = (y(102)) - (log(y(36))-(log(steady_state(6))));
    residual(72) = (y(103)) - (log(y(44))-(log(steady_state(14))));
    residual(73) = (y(104)) - (log(y(47))-(log(steady_state(17))));
    residual(74) = (y(105)) - (log(y(48))-(log(steady_state(18))));
    residual(75) = (y(106)) - (log(y(40))-(log(steady_state(10))));
    residual(76) = (y(107)) - (y(100)-y(103));
    residual(77) = (y(108)) - (log(y(79))-(log(steady_state(49))));
    residual(78) = (y(109)) - (log(y(66))-(log(steady_state(36))));
    residual(79) = (y(110)) - (log(y(86))-(log(steady_state(56))));
    residual(80) = (y(111)) - (log(y(95))-(log(steady_state(65))));
    residual(81) = (y(112)) - (log(y(96))-(log(steady_state(66))));
    residual(82) = (y(113)) - (log(y(98))-(log(steady_state(68))));
    residual(83) = (y(114)) - (log(y(62))-(log(steady_state(32))));
    residual(84) = (y(94)) - (log(y(35))-(log(steady_state(5))));
    residual(85) = (y(115)) - (y(99)+y(101)-y(17)-params(3));
    residual(86) = (y(116)) - (y(99)+y(102)-y(18)-params(3));
    residual(87) = (y(117)) - (y(99)+y(100)-y(16)-params(3));
    residual(88) = (y(119)) - (y(99)+y(107)-y(23)-params(3));
    residual(89) = (y(130)) - (y(99)+y(106)-y(22)-params(3));
    residual(90) = (y(127)) - (y(99)+y(114)-y(30)-params(3));
    residual(91) = (y(118)) - (y(94)-y(14)+params(13)*(y(99)-params(3)));
    residual(92) = (y(120)) - (y(110)-y(26));
    residual(93) = (y(121)) - (y(103)-y(19));
    residual(94) = (y(122)) - (y(104)-y(20));
    residual(95) = (y(123)) - (y(105)-y(21));
    residual(96) = (y(124)) - (y(112)-y(28));
    residual(97) = (y(125)) - (y(113)-y(29));
    residual(98) = (y(126)) - (y(111)-y(27));
    residual(99) = (y(128)) - (y(108)-y(24));
    residual(100) = (y(129)) - (y(109)-y(25));

end
