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
    T = SU_sectoral_wo_vcu.static_resid_tt(T, y, x, params);
end
residual = zeros(93, 1);
    residual(1) = (y(19)) - (T(18)^(1/(1+params(17))));
    residual(2) = (T(16)*T(19)*T(21)) - ((1-params(14))*y(33)/(params(7)*exp(y(28))));
    residual(3) = (T(17)*T(21)*T(22)) - ((1-params(14))*y(34)/(params(7)*exp(y(29))));
    residual(4) = (y(50)) - ((1-params(14))*y(46)^(-params(1)));
    residual(5) = (y(3)) - (y(2)*T(23));
    residual(6) = (y(4)) - (y(2)*T(24));
    residual(7) = (T(25)) - (y(3)*params(14)*y(47)/y(43));
    residual(8) = (T(25)) - (y(4)*params(14)*y(48)/y(44));
    residual(9) = (T(25)*exp(y(26))) - (params(14)*y(49)*y(6)/y(45));
    residual(10) = (y(46)) - (y(2)-y(2)*params(13)-T(27)-T(28));
    residual(11) = (y(2)) - (T(31)^(1/T(1)));
    residual(12) = (y(36)) - (T(32)*(y(54)-exp(params(3)))^2);
    residual(13) = (y(37)) - (T(32)*(y(55)-exp(params(3)))^2);
    residual(14) = (y(38)) - (T(32)*(y(56)-exp(params(3)))^2);
    residual(15) = (y(39)) - (params(8)*(y(54)-exp(params(3))));
    residual(16) = (y(40)) - (params(8)*(y(55)-exp(params(3))));
    residual(17) = (y(41)) - (params(8)*(y(56)-exp(params(3))));
    residual(18) = (y(54)) - (T(33));
    residual(19) = (y(55)) - (T(33));
    residual(20) = (y(56)) - (T(33));
    residual(21) = (y(49)/(1-params(14))) - (y(51)*(1-y(54)*y(39)-y(36))+T(36));
    residual(22) = (y(49)/(1-params(14))) - (y(52)*(1-y(55)*y(40)-y(37))+T(38));
    residual(23) = (y(49)/(1-params(14))) - (y(53)*(1-y(56)*y(41)-y(38))+T(40));
    residual(24) = (y(51)) - (T(34)*(y(30)+y(51)*T(41)));
    residual(25) = (y(52)) - (T(34)*(y(31)+y(52)*T(41)));
    residual(26) = (y(53)) - (T(34)*(y(32)+y(53)*T(41)));
    residual(27) = (y(3)) - (T(42)*(T(43)*T(47)-T(8)));
    residual(28) = (y(4)) - (T(48)*(T(49)*T(52)-T(9)));
    residual(29) = (y(6)) - (T(53)*(T(54)*T(57)-T(10)));
    residual(30) = (T(33)*y(11)) - (T(33)*y(7)*(1-y(36))+T(41)*y(11));
    residual(31) = (T(33)*y(12)) - (T(33)*y(8)*(1-y(37))+T(41)*y(12));
    residual(32) = (T(33)*y(13)) - (T(33)*y(9)*(1-y(38))+T(41)*y(13));
    residual(33) = ((1-params(14))*y(33)/y(47)) - (T(3)*(y(3)+T(8)*T(42))/y(15));
    residual(34) = ((1-params(14))*y(33)/y(48)) - (T(3)*(y(4)+T(9)*T(48))/y(16));
    residual(35) = ((1-params(14))*y(34)/y(49)) - (T(3)*(y(6)+T(10)*T(53))/y(18));
    residual(36) = ((1-params(14))*y(30)/y(47)) - ((y(3)+T(8)*T(42))*T(2)*T(33)/y(11));
    residual(37) = ((1-params(14))*y(31)/y(48)) - ((y(4)+T(9)*T(48))*T(2)*T(33)/y(12));
    residual(38) = ((1-params(14))*y(32)/y(49)) - ((y(6)+T(10)*T(53))*T(2)*T(33)/y(13));
    residual(39) = (y(14)) - (y(18)+y(15)+y(16));
    residual(40) = (y(17)) - (y(15)+y(16));
    residual(41) = (y(10)) - (y(13)+y(11)+y(12));
    residual(42) = (y(6)) - (y(9)+y(7)+y(8));
    residual(43) = (y(42)) - (y(43)+y(44)+exp(y(26))*y(45));
    residual(44) = (y(35)) - (y(33)*y(17)/y(14)+y(34)*y(18)/y(14));
    residual(45) = (y(1)) - (y(2)+y(6)*params(27));
    residual(46) = (y(5)) - (T(58)*T(69));
    residual(47) = (y(59)) - (T(42));
    residual(48) = (y(61)) - (T(53));
    residual(49) = (y(60)) - (T(48));
    residual(50) = (y(58)) - ((y(3)*y(59)+y(4)*y(60)+y(6)*y(61))/y(1));
    residual(51) = (y(23)) - (exp(y(20))*y(2)/y(1)+exp(y(22))*T(65));
    residual(52) = (y(62)) - (params(3)*(1-params(18))+y(62)*params(18)+x(1));
    residual(53) = (y(20)) - (y(20)*params(19)+x(2));
    residual(54) = (y(21)) - (y(22)*params(20)+x(3));
    residual(55) = (y(22)) - (y(20)+y(21));
    residual(56) = (y(24)) - (y(24)*params(21)-x(4));
    residual(57) = (y(25)) - (y(25)*params(22)-x(5));
    residual(58) = (y(26)) - (y(26)*params(23)-x(6));
    residual(59) = (y(27)) - (y(27)*params(24)+x(7));
    residual(60) = (y(28)) - (y(28)*params(25)+x(8));
    residual(61) = (y(29)) - (y(29)*params(26)+x(9));
    residual(62) = (y(63)) - (log(y(1))-(log(y(1))));
    residual(63) = (y(64)) - (log(y(2))-(log(y(2))));
    residual(64) = (y(65)) - (log(y(6))-(log(y(6))));
    residual(65) = (y(66)) - (log(y(14))-(log(y(14))));
    residual(66) = (y(67)) - (log(y(17))-(log(y(17))));
    residual(67) = (y(68)) - (log(y(18))-(log(y(18))));
    residual(68) = (y(69)) - (log(y(10))-(log(y(10))));
    residual(69) = (y(70)) - (y(63)-y(66));
    residual(70) = (y(71)) - (log(y(42))-(log(y(42))));
    residual(71) = (y(72)) - (log(y(49))-(log(y(49))));
    residual(72) = (y(73)) - (log(y(58))-(log(y(58))));
    residual(73) = (y(74)) - (log(y(59))-(log(y(59))));
    residual(74) = (y(75)) - (log(y(61))-(log(y(61))));
    residual(75) = (y(76)) - (log(y(35))-(log(y(35))));
    residual(76) = (y(57)) - (log(y(5))-(log(y(5))));
    residual(77) = (y(77)) - (log(y(23))-(log(y(23))));
    residual(78) = (y(78)) - (y(62)-params(3));
    residual(79) = (y(79)) - (y(62)-params(3));
    residual(80) = (y(80)) - (y(62)-params(3));
    residual(81) = (y(82)) - (y(62)-params(3));
    residual(82) = (y(93)) - (y(62)-params(3));
    residual(83) = (y(91)) - (y(62)-params(3));
    residual(84) = (y(81)) - (params(11)*(y(62)-params(3)));
    residual(85) = (y(90)) - (y(62)-params(3));
residual(86) = y(83);
residual(87) = y(84);
residual(88) = y(85);
residual(89) = y(86);
residual(90) = y(87);
residual(91) = y(88);
residual(92) = y(89);
residual(93) = y(92);

end
