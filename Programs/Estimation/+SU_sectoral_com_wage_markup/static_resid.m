function residual = static_resid(T, y, x, params, T_flag)
% function residual = static_resid(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = SU_sectoral_com_wage_markup.static_resid_tt(T, y, x, params);
end
residual = zeros(104, 1);
    residual(1) = (y(19)) - (T(20)^(1/(1+params(19))));
    residual(2) = (T(18)*T(21)*T(23)) - ((1-params(16))*y(32)/(params(7)*exp(y(28))));
    residual(3) = (T(19)*T(23)*T(24)) - ((1-params(16))*y(33)/(params(7)*exp(y(28))));
    residual(4) = (y(59)) - ((1-params(16))*y(55)^(-params(1)));
    residual(5) = (y(3)) - (y(2)*T(25));
    residual(6) = (y(4)) - (y(2)*T(26));
    residual(7) = (T(27)) - (y(3)*params(16)*y(56)/y(52));
    residual(8) = (T(27)) - (y(4)*params(16)*y(57)/y(53));
    residual(9) = (T(27)*exp(y(26))) - (params(16)*y(58)*y(6)/y(54));
    residual(10) = (y(55)) - (y(2)-y(2)*params(15)-T(29)-T(30));
    residual(11) = (y(2)) - (T(33)^(1/T(3)));
    residual(12) = (y(45)) - (T(34)*(y(63)-exp(params(3)))^2);
    residual(13) = (y(46)) - (T(34)*(y(64)-exp(params(3)))^2);
    residual(14) = (y(47)) - (T(34)*(y(65)-exp(params(3)))^2);
    residual(15) = (y(48)) - (params(10)*(y(63)-exp(params(3))));
    residual(16) = (y(49)) - (params(10)*(y(64)-exp(params(3))));
    residual(17) = (y(50)) - (params(10)*(y(65)-exp(params(3))));
    residual(18) = (y(63)) - (T(35));
    residual(19) = (y(64)) - (T(35));
    residual(20) = (y(65)) - (T(35));
    residual(21) = (y(39)) - (T(1)+T(2)*(y(35)-1)+(y(35)-1)^2*T(36));
    residual(22) = (y(40)) - (T(1)+T(2)*(y(36)-1)+T(36)*(y(36)-1)^2);
    residual(23) = (y(41)) - (T(1)+T(2)*(y(37)-1)+(y(37)-1)^2*T(2)*params(9)/2);
    residual(24) = (y(42)) - (T(2)+(y(35)-1)*T(2)*params(8));
    residual(25) = (y(43)) - (T(2)+T(2)*params(8)*(y(36)-1));
    residual(26) = (y(44)) - (T(2)+(y(37)-1)*T(2)*params(9));
    residual(27) = (y(58)/(1-params(16))) - (y(60)*(1-y(63)*y(48)-y(45))+T(39));
    residual(28) = (y(58)/(1-params(16))) - (y(61)*(1-y(64)*y(49)-y(46))+T(41));
    residual(29) = (y(58)/(1-params(16))) - (y(62)*(1-y(65)*y(50)-y(47))+T(43));
    residual(30) = (y(60)) - (T(37)*(y(35)*y(29)+y(60)*(1-y(39))));
    residual(31) = (y(61)) - (T(37)*(y(36)*y(30)+y(61)*(1-y(40))));
    residual(32) = (y(62)) - (T(37)*(y(37)*y(31)+y(62)*(1-y(41))));
    residual(33) = (y(42)*y(60)) - (y(29));
    residual(34) = (y(43)*y(61)) - (y(30));
    residual(35) = (y(44)*y(62)) - (y(31));
    residual(36) = (y(3)) - (T(50));
    residual(37) = (y(4)) - (T(56));
    residual(38) = (y(6)) - (T(62));
    residual(39) = (T(35)*y(11)) - (T(35)*y(7)*(1-y(45))+(1-y(39))*y(11));
    residual(40) = (T(35)*y(12)) - (T(35)*y(8)*(1-y(46))+(1-y(40))*y(12));
    residual(41) = (T(35)*y(13)) - (T(35)*y(9)*(1-y(47))+(1-y(41))*y(13));
    residual(42) = ((1-params(16))*y(32)/y(56)) - (T(5)*(y(3)+T(10)*T(44))/y(15));
    residual(43) = ((1-params(16))*y(32)/y(57)) - (T(5)*(y(4)+T(11)*T(51))/y(16));
    residual(44) = ((1-params(16))*y(33)/y(58)) - (T(5)*(y(6)+T(12)*T(57))/y(18));
    residual(45) = ((1-params(16))*y(29)/y(56)) - ((y(3)+T(10)*T(44))*T(4)*T(35)/(y(35)*y(11)));
    residual(46) = ((1-params(16))*y(30)/y(57)) - ((y(4)+T(11)*T(51))*T(4)*T(35)/(y(36)*y(12)));
    residual(47) = ((1-params(16))*y(31)/y(58)) - ((y(6)+T(12)*T(57))*T(4)*T(35)/(y(37)*y(13)));
    residual(48) = (y(14)) - (y(18)+y(15)+y(16));
    residual(49) = (y(17)) - (y(15)+y(16));
    residual(50) = (y(10)) - (y(13)+y(11)+y(12));
    residual(51) = (y(6)) - (y(9)+y(7)+y(8));
    residual(52) = (y(51)) - (y(52)+y(53)+exp(y(26))*y(54));
    residual(53) = (y(38)) - (y(35)*T(63)+y(36)*T(64)+y(37)*T(65));
    residual(54) = (y(34)) - (y(32)*y(17)/y(14)+y(33)*y(18)/y(14));
    residual(55) = (y(1)) - (y(2)+y(6)*params(28));
    residual(56) = (y(5)) - (T(66)*T(76));
    residual(57) = (y(68)) - (T(50)/T(79));
    residual(58) = (y(69)) - (T(56)/T(82));
    residual(59) = (y(70)) - (T(62)/T(85));
    residual(60) = (y(67)) - ((y(3)*y(68)+y(4)*y(69)+y(6)*y(70))/y(1));
    residual(61) = (y(23)) - (exp(y(20))*y(2)/y(1)+exp(y(22))*T(65));
    residual(62) = (y(71)) - (params(3)*(1-params(20))+y(71)*params(20)+x(1));
    residual(63) = (y(20)) - (y(20)*params(21)+x(2));
    residual(64) = (y(21)) - (y(22)*params(22)+x(3));
    residual(65) = (y(22)) - (y(20)+y(21));
    residual(66) = (y(24)) - (y(24)*params(23)-x(4));
    residual(67) = (y(25)) - (y(25)*params(24)-x(5));
    residual(68) = (y(26)) - (y(26)*params(25)-x(6));
    residual(69) = (y(27)) - (y(27)*params(26)+x(7));
    residual(70) = (y(28)) - (y(28)*params(27)+x(8));
    residual(71) = (y(72)) - (log(y(1))-(log(y(1))));
    residual(72) = (y(73)) - (log(y(2))-(log(y(2))));
    residual(73) = (y(74)) - (log(y(6))-(log(y(6))));
    residual(74) = (y(75)) - (log(y(14))-(log(y(14))));
    residual(75) = (y(76)) - (log(y(17))-(log(y(17))));
    residual(76) = (y(77)) - (log(y(18))-(log(y(18))));
    residual(77) = (y(78)) - (log(y(10))-(log(y(10))));
    residual(78) = (y(79)) - (y(72)-y(75));
    residual(79) = (y(80)) - (log(y(51))-(log(y(51))));
    residual(80) = (y(81)) - (log(y(38))-(log(y(38))));
    residual(81) = (y(82)) - (log(y(58))-(log(y(58))));
    residual(82) = (y(83)) - (log(y(67))-(log(y(67))));
    residual(83) = (y(84)) - (log(y(68))-(log(y(68))));
    residual(84) = (y(85)) - (log(y(70))-(log(y(70))));
    residual(85) = (y(86)) - (log(y(34))-(log(y(34))));
    residual(86) = (y(66)) - (log(y(5))-(log(y(5))));
    residual(87) = (y(87)) - (log(y(23))-(log(y(23))));
    residual(88) = (y(88)) - (y(71)-params(3));
    residual(89) = (y(89)) - (y(71)-params(3));
    residual(90) = (y(90)) - (y(71)-params(3));
    residual(91) = (y(92)) - (y(71)-params(3));
    residual(92) = (y(104)) - (y(71)-params(3));
    residual(93) = (y(101)) - (y(71)-params(3));
    residual(94) = (y(91)) - (params(13)*(y(71)-params(3)));
    residual(95) = (y(100)) - (y(71)-params(3));
residual(96) = y(93);
residual(97) = y(94);
residual(98) = y(95);
residual(99) = y(96);
residual(100) = y(97);
residual(101) = y(98);
residual(102) = y(99);
residual(103) = y(102);
residual(104) = y(103);

end
