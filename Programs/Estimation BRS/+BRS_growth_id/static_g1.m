function g1 = static_g1(T, y, x, params, T_flag)
% function g1 = static_g1(T, y, x, params, T_flag)
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
%   g1
%

if T_flag
    T = BRS_growth_id.static_g1_tt(T, y, x, params);
end
g1 = zeros(49, 49);
g1(1,8)=T(9)*getPowerDeriv(y(8),T(8),1);
g1(1,14)=T(10);
g1(1,18)=(-(1-params(8)));
g1(2,2)=(-(params(8)/y(20)));
g1(2,15)=T(11);
g1(2,19)=T(36);
g1(2,20)=(-((-(params(8)*y(2)))/(y(20)*y(20))));
g1(3,3)=(-(params(8)*y(23)/y(21)));
g1(3,15)=T(11);
g1(3,19)=T(36);
g1(3,21)=(-((-(params(8)*y(23)*y(3)))/(y(21)*y(21))));
g1(3,23)=(-(params(8)*y(3)/y(21)));
g1(4,2)=(-1);
g1(4,8)=T(9)*getPowerDeriv(y(8),1+T(8),1)/(1+T(8));
g1(4,14)=T(14);
g1(4,15)=T(13);
g1(4,19)=exp(y(15))*getPowerDeriv(y(19),T(12),1)/T(12);
g1(4,22)=1;
g1(5,16)=(-(T(16)*T(15)*params(2)*(1-params(8))));
g1(5,22)=y(23)*T(39)-T(16)*T(18)*T(39);
g1(5,23)=T(15)-T(16)*T(15)*params(2)*T(17);
g1(5,24)=(-(T(15)*T(18)*exp(y(24))*getPowerDeriv(exp(y(24)),(-params(1)),1)));
g1(6,16)=(-1);
g1(6,17)=1;
g1(7,2)=1;
g1(7,6)=(-(T(19)*T(22)*getPowerDeriv(y(6),T(1),1)));
g1(7,9)=(-(T(24)*getPowerDeriv(y(9),(1-params(8))*params(7),1)));
g1(7,11)=(-(T(19)*T(24)));
g1(7,20)=(-(T(19)*T(23)*T(21)*exp(y(11))*T(6)*T(37)));
g1(7,24)=(-(T(19)*T(23)*exp(y(11))*T(6)*T(20)*T(40)));
g1(8,3)=1;
g1(8,7)=(-(T(25)*T(27)*getPowerDeriv(y(7),T(1),1)));
g1(8,10)=(-(T(29)*getPowerDeriv(y(10),(1-params(8))*params(7),1)));
g1(8,13)=(-(T(25)*T(29)));
g1(8,21)=(-(T(25)*T(28)*T(21)*exp(y(13))*T(7)*T(38)));
g1(8,24)=(-(T(25)*T(28)*exp(y(13))*T(7)*T(26)*T(40)));
g1(9,3)=exp(y(24));
g1(9,6)=(-(exp(y(24))-T(17)));
g1(9,7)=(-(exp(y(24))-T(17)));
g1(9,24)=y(3)*exp(y(24))-exp(y(24))*(y(6)+y(7));
g1(10,2)=(-((1-params(8))*params(7)/y(9)));
g1(10,9)=(-((-((1-params(8))*params(7)*y(2)))/(y(9)*y(9))));
g1(10,18)=1-params(8);
g1(11,2)=(-(exp(y(24))*T(1)/y(6)));
g1(11,6)=(-(exp(y(24))*(-(T(1)*y(2)))/(y(6)*y(6))));
g1(11,16)=1-params(8);
g1(11,24)=(-(exp(y(24))*T(1)*y(2)/y(6)));
g1(12,3)=(-((1-params(8))*params(7)/y(10)));
g1(12,10)=(-((-((1-params(8))*params(7)*y(3)))/(y(10)*y(10))));
g1(12,18)=(1-params(8))/y(23);
g1(12,23)=(-((1-params(8))*y(18)))/(y(23)*y(23));
g1(13,3)=(-(exp(y(24))*T(1)/y(7)));
g1(13,7)=(-(exp(y(24))*(-(T(1)*y(3)))/(y(7)*y(7))));
g1(13,17)=(1-params(8))/y(23);
g1(13,23)=(-((1-params(8))*y(17)))/(y(23)*y(23));
g1(13,24)=(-(exp(y(24))*T(1)*y(3)/y(7)));
g1(14,8)=1;
g1(14,9)=(-1);
g1(14,10)=(-1);
g1(15,5)=1;
g1(15,6)=(-1);
g1(15,7)=(-1);
g1(16,19)=1;
g1(16,20)=(-1);
g1(16,21)=(-1);
g1(17,1)=1;
g1(17,2)=(-1);
g1(17,3)=(-params(16));
g1(18,1)=(-(y(2)*(-y(2))/(y(1)*y(1))/T(32)+y(3)*(-y(3))/(y(1)*y(1))/T(35)));
g1(18,2)=(-((y(2)/y(1)+y(2)*1/y(1))/T(32)));
g1(18,3)=(-((y(3)/y(1)+y(3)*1/y(1))/T(35)));
g1(18,4)=1;
g1(18,6)=(-((-(y(2)*y(2)/y(1)*T(31)*getPowerDeriv(y(6),1-params(7),1)))/(T(32)*T(32))));
g1(18,7)=(-((-(y(3)*y(3)/y(1)*T(34)*getPowerDeriv(y(7),1-params(7),1)))/(T(35)*T(35))));
g1(18,9)=(-((-(y(2)*y(2)/y(1)*T(30)*getPowerDeriv(y(9),params(7),1)))/(T(32)*T(32))));
g1(18,10)=(-((-(y(3)*y(3)/y(1)*T(33)*getPowerDeriv(y(10),params(7),1)))/(T(35)*T(35))));
g1(19,20)=(-T(37));
g1(19,25)=1;
g1(20,21)=(-T(38));
g1(20,26)=1;
g1(21,2)=(-(y(25)*y(3)/((y(2)+y(3))*(y(2)+y(3)))+y(26)*(-y(3))/((y(2)+y(3))*(y(2)+y(3)))));
g1(21,3)=(-(y(25)*(-y(2))/((y(2)+y(3))*(y(2)+y(3)))+y(26)*y(2)/((y(2)+y(3))*(y(2)+y(3)))));
g1(21,25)=(-(y(2)/(y(2)+y(3))));
g1(21,26)=(-(y(3)/(y(2)+y(3))));
g1(21,27)=1;
g1(22,24)=1-params(11);
g1(23,11)=1-params(12);
g1(24,12)=1;
g1(24,13)=(-params(13));
g1(25,11)=(-1);
g1(25,12)=(-1);
g1(25,13)=1;
g1(26,14)=1-params(14);
g1(27,15)=1-params(15);
g1(28,28)=1;
g1(29,29)=1;
g1(30,30)=1;
g1(31,31)=1;
g1(32,32)=1;
g1(33,33)=1;
g1(34,28)=(-1);
g1(34,31)=1;
g1(34,34)=1;
g1(35,35)=1;
g1(36,36)=1;
g1(37,23)=(-(1/y(23)));
g1(37,37)=2;
g1(38,38)=1;
g1(39,24)=(-1);
g1(39,39)=1;
g1(40,24)=(-1);
g1(40,40)=1;
g1(41,24)=(-1);
g1(41,41)=1;
g1(42,24)=(-1);
g1(42,43)=1;
g1(43,24)=(-1);
g1(43,42)=1;
g1(44,44)=1;
g1(45,47)=1;
g1(46,45)=1;
g1(47,46)=1;
g1(48,48)=1;
g1(49,49)=1;
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
