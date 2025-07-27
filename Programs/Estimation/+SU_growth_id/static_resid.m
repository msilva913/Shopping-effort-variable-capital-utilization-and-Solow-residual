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
    T = SU_growth_id.static_resid_tt(T, y, x, params);
end
residual = zeros(49, 1);
    residual(1) = (T(10)) - ((1-params(8))*y(18));
    residual(2) = (T(11)) - (params(8)*y(2)/y(20));
    residual(3) = (T(11)) - (params(8)*y(23)*y(3)/y(21));
    residual(4) = (y(22)) - (y(2)-T(13)-T(14));
    residual(5) = (y(23)*T(15)) - (T(16)*T(15)*T(18));
    residual(6) = (y(17)) - (y(16));
    residual(7) = (y(2)) - (T(19)*T(24));
    residual(8) = (y(3)) - (T(25)*T(29));
    residual(9) = (y(3)*exp(y(24))) - (exp(y(24))*(y(6)+y(7))-T(17)*(y(6)+y(7)));
    residual(10) = ((1-params(8))*y(18)) - ((1-params(8))*params(7)*y(2)/y(9));
    residual(11) = ((1-params(8))*y(16)) - (exp(y(24))*T(1)*y(2)/y(6));
    residual(12) = ((1-params(8))*y(18)/y(23)) - ((1-params(8))*params(7)*y(3)/y(10));
    residual(13) = ((1-params(8))*y(17)/y(23)) - (exp(y(24))*T(1)*y(3)/y(7));
    residual(14) = (y(8)) - (y(9)+y(10));
    residual(15) = (y(5)) - (y(6)+y(7));
    residual(16) = (y(19)) - (y(20)+y(21));
    residual(17) = (y(1)) - (y(2)+params(16)*y(3));
    residual(18) = (y(4)) - (T(30)*T(37));
    residual(19) = (y(25)) - (T(20));
    residual(20) = (y(26)) - (T(26));
    residual(21) = (y(27)) - (y(25)*y(2)/(y(2)+y(3))+y(26)*y(3)/(y(2)+y(3)));
    residual(22) = (y(24)) - (params(3)*(1-params(11))+y(24)*params(11)+x(1));
    residual(23) = (y(11)) - (y(11)*params(12)+x(2));
    residual(24) = (y(12)) - (y(13)*params(13)+x(3));
    residual(25) = (y(13)) - (y(11)+y(12));
    residual(26) = (y(14)) - (y(14)*params(14)-x(4));
    residual(27) = (y(15)) - (y(15)*params(15)-x(5));
    residual(28) = (y(28)) - (log(y(1))-(log(y(1))));
    residual(29) = (y(29)) - (log(y(2))-(log(y(2))));
    residual(30) = (y(30)) - (log(y(3))-(log(y(3))));
    residual(31) = (y(31)) - (log(y(8))-(log(y(8))));
    residual(32) = (y(32)) - (log(y(9))-(log(y(9))));
    residual(33) = (y(33)) - (log(y(10))-(log(y(10))));
    residual(34) = (y(34)) - (y(28)-y(31));
    residual(35) = (y(35)) - (log(y(4))-(log(y(4))));
    residual(36) = (y(36)) - (log(y(19))-(log(y(19))));
    residual(37) = (y(37)) - (log(y(23))-(y(37)));
    residual(38) = (y(38)) - (log(y(27))-(log(y(27))));
    residual(39) = (y(39)) - (y(24)-params(3));
    residual(40) = (y(40)) - (y(24)-params(3));
    residual(41) = (y(41)) - (y(24)-params(3));
    residual(42) = (y(43)) - (y(24)-params(3));
    residual(43) = (y(42)) - (params(7)*(y(24)-params(3)));
residual(44) = y(44);
residual(45) = y(47);
residual(46) = y(45);
residual(47) = y(46);
residual(48) = y(48);
residual(49) = y(49);

end
