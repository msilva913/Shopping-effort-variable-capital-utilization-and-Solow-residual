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
    T = BRS_extended_fd.static_g1_tt(T, y, x, params);
end
g1 = zeros(43, 43);
g1(1,7)=T(12)*getPowerDeriv(y(7),T(11),1);
g1(1,13)=T(13);
g1(1,17)=(-(1-params(10)));
g1(2,2)=(-(params(10)/y(25)));
g1(2,14)=T(14);
g1(2,24)=T(32);
g1(2,25)=(-((-(params(10)*y(2)))/(y(25)*y(25))));
g1(3,3)=(-(params(10)*y(28)/y(26)));
g1(3,14)=T(14);
g1(3,24)=T(32);
g1(3,26)=(-((-(params(10)*y(28)*y(3)))/(y(26)*y(26))));
g1(3,28)=(-(params(10)*y(3)/y(26)));
g1(4,2)=(-1);
g1(4,7)=T(12)*getPowerDeriv(y(7),1+T(11),1)/(1+T(11));
g1(4,13)=T(17);
g1(4,14)=T(16);
g1(4,24)=exp(y(14))*getPowerDeriv(y(24),T(15),1)/T(15);
g1(4,27)=1;
g1(5,28)=(-(T(18)*1/(1-params(10))));
g1(5,29)=1;
g1(5,30)=(-(y(28)/(1-params(10))*(-params(6))*getPowerDeriv(1-params(6)*(y(30)-T(3)),(-1),1)));
g1(6,15)=(-(T(2)*y(18)));
g1(6,18)=(-(T(2)*y(15)));
g1(6,20)=(-(T(2)*(-y(29))));
g1(6,29)=1-T(2)*(1-y(20)+y(30)*params(6)*(y(30)-T(3))-T(19));
g1(6,30)=T(33);
g1(7,16)=(-(T(2)*y(19)));
g1(7,19)=(-(T(2)*y(16)));
g1(7,21)=(-(T(2)*(-y(29))));
g1(7,29)=1-T(2)*(y(30)*params(6)*(y(30)-T(3))+1-y(21)-T(19));
g1(7,30)=T(33);
g1(8,3)=(-(1/y(4)));
g1(8,4)=(-((-y(3))/(y(4)*y(4))));
g1(8,30)=1;
g1(9,15)=(-1);
g1(9,22)=y(29);
g1(9,29)=y(22);
g1(10,16)=(-1);
g1(10,23)=y(29);
g1(10,29)=y(23);
g1(11,18)=(-(T(1)+T(3)+T(20)*2*(y(18)-1)));
g1(11,20)=1;
g1(12,19)=(-(T(1)+T(3)+T(20)*2*(y(19)-1)));
g1(12,21)=1;
g1(13,18)=(-((T(1)+T(3))*params(5)));
g1(13,22)=1;
g1(14,19)=(-((T(1)+T(3))*params(5)));
g1(14,23)=1;
g1(15,2)=1;
g1(15,5)=(-(T(21)*T(22)*y(18)*T(30)));
g1(15,8)=(-(T(24)*getPowerDeriv(y(8),(1-params(10))*params(9),1)));
g1(15,10)=(-(T(21)*T(24)));
g1(15,18)=(-(T(21)*T(22)*y(5)*T(30)));
g1(15,25)=(-(T(21)*T(23)*exp(y(10))*T(9)*T(7)*getPowerDeriv(y(25),params(10),1)));
g1(16,3)=1;
g1(16,6)=(-(T(25)*T(26)*y(19)*T(31)));
g1(16,9)=(-(T(28)*getPowerDeriv(y(9),(1-params(10))*params(9),1)));
g1(16,12)=(-(T(25)*T(28)));
g1(16,19)=(-(T(25)*T(26)*y(6)*T(31)));
g1(16,26)=(-(T(25)*T(27)*exp(y(12))*T(10)*T(8)*getPowerDeriv(y(26),params(10),1)));
g1(17,3)=1;
g1(17,5)=(-(1-(1-y(20))));
g1(17,6)=(-(1-(1-y(21))));
g1(17,20)=(-y(5));
g1(17,21)=(-y(6));
g1(17,30)=(-(params(6)/2*2*(y(30)-T(3))));
g1(18,2)=(-((1-params(10))*params(9)/y(8)));
g1(18,8)=(-((-((1-params(10))*params(9)*y(2)))/(y(8)*y(8))));
g1(18,17)=1-params(10);
g1(19,5)=(-(y(18)*T(29)/y(8)));
g1(19,8)=(-((-(y(5)*y(18)*T(29)))/(y(8)*y(8))));
g1(19,15)=(-y(17))/(y(15)*y(15));
g1(19,17)=1/y(15);
g1(19,18)=(-(y(5)*T(29)/y(8)));
g1(20,3)=(-((1-params(10))*params(9)/y(9)));
g1(20,9)=(-((-((1-params(10))*params(9)*y(3)))/(y(9)*y(9))));
g1(20,17)=(1-params(10))/y(28);
g1(20,28)=(-((1-params(10))*y(17)))/(y(28)*y(28));
g1(21,6)=(-(y(19)*T(29)/y(9)));
g1(21,9)=(-((-(y(6)*y(19)*T(29)))/(y(9)*y(9))));
g1(21,16)=(-y(17))/(y(16)*y(16));
g1(21,17)=1/y(16);
g1(21,19)=(-(y(6)*T(29)/y(9)));
g1(22,7)=1;
g1(22,8)=(-1);
g1(22,9)=(-1);
g1(23,4)=1;
g1(23,5)=(-1);
g1(23,6)=(-1);
g1(24,24)=1;
g1(24,25)=(-1);
g1(24,26)=(-1);
g1(25,1)=1;
g1(25,2)=(-1);
g1(25,3)=(-params(17));
g1(26,10)=1-params(13);
g1(27,11)=1;
g1(27,12)=(-params(14));
g1(28,10)=(-1);
g1(28,11)=(-1);
g1(28,12)=1;
g1(29,13)=1-params(15);
g1(30,14)=1-params(16);
g1(31,31)=1;
g1(32,32)=1;
g1(33,33)=1;
g1(34,34)=1;
g1(35,31)=(-1);
g1(35,34)=1;
g1(35,35)=1;
g1(36,36)=1;
g1(37,28)=(-(1/y(28)));
g1(37,37)=2;
g1(38,38)=1;
g1(39,39)=1;
g1(40,40)=1;
g1(41,41)=1;
g1(42,42)=1;
g1(43,43)=1;
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
