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
    T = BRS_growth_ext_comovement.static_g1_tt(T, y, x, params);
end
g1 = zeros(48, 48);
g1(1,7)=T(11)*getPowerDeriv(y(7),T(10),1);
g1(1,11)=T(12);
g1(1,13)=(-((1-params(10))*exp(y(13))*y(16)));
g1(1,16)=(-((1-params(10))*exp(y(13))));
g1(2,2)=(-(params(10)*exp(y(13))/y(24)));
g1(2,12)=T(13);
g1(2,13)=(-(params(10)*exp(y(13))*y(2)/y(24)));
g1(2,23)=T(34);
g1(2,24)=(-((-(params(10)*exp(y(13))*y(2)))/(y(24)*y(24))));
g1(3,3)=(-(params(10)*exp(y(13))*y(27)/y(25)));
g1(3,12)=T(13);
g1(3,13)=(-(params(10)*exp(y(13))*y(27)*y(3)/y(25)));
g1(3,23)=T(34);
g1(3,25)=(-((-(params(10)*exp(y(13))*y(27)*y(3)))/(y(25)*y(25))));
g1(3,27)=(-(params(10)*exp(y(13))*y(3)/y(25)));
g1(4,2)=(-exp(y(13)));
g1(4,7)=T(11)*getPowerDeriv(y(7),1+T(10),1)/(1+T(10));
g1(4,11)=T(16);
g1(4,12)=T(15);
g1(4,13)=(-(exp(y(13))*y(2)));
g1(4,23)=exp(y(12))*getPowerDeriv(y(23),T(14),1)/T(14);
g1(4,26)=1;
g1(5,27)=(-(T(17)*1/(1-params(10))));
g1(5,28)=1;
g1(5,29)=(-(y(27)/(1-params(10))*(-params(6))*getPowerDeriv(1-params(6)*(y(29)-params(7)/params(8)),(-1),1)));
g1(6,14)=(-(y(17)*T(19)));
g1(6,17)=(-(y(14)*T(19)));
g1(6,19)=(-(T(19)*(-y(28))));
g1(6,28)=1-(1-y(19)+y(29)*params(6)*(y(29)-params(7)/params(8))-T(18))*T(19);
g1(6,29)=T(36);
g1(6,30)=(-((y(14)*y(17)+y(28)*(1-y(19)+y(29)*params(6)*(y(29)-params(7)/params(8))-T(18)))*T(37)));
g1(7,15)=(-(T(19)*y(18)));
g1(7,18)=(-(T(19)*y(15)));
g1(7,20)=(-(T(19)*(-y(28))));
g1(7,28)=1-T(19)*(y(29)*params(6)*(y(29)-params(7)/params(8))+1-y(20)-T(18));
g1(7,29)=T(36);
g1(7,30)=(-((y(15)*y(18)+y(28)*(y(29)*params(6)*(y(29)-params(7)/params(8))+1-y(20)-T(18)))*T(37)));
g1(8,3)=(-(exp(y(30))*1/y(4)));
g1(8,4)=(-(exp(y(30))*(-y(3))/(y(4)*y(4))));
g1(8,29)=1;
g1(8,30)=(-(exp(y(30))*y(3)/y(4)));
g1(9,14)=(-1);
g1(9,21)=y(28);
g1(9,28)=y(21);
g1(10,15)=(-1);
g1(10,22)=y(28);
g1(10,28)=y(22);
g1(11,17)=(-(T(1)+T(2)+T(20)*2*(y(17)-1)));
g1(11,19)=1;
g1(12,18)=(-(T(1)+T(2)+T(20)*2*(y(18)-1)));
g1(12,20)=1;
g1(13,17)=(-((T(1)+T(2))*params(5)));
g1(13,21)=1;
g1(14,18)=(-((T(1)+T(2))*params(5)));
g1(14,22)=1;
g1(15,2)=1;
g1(15,5)=(-(T(21)*T(24)*y(17)*T(32)));
g1(15,8)=(-(T(26)*getPowerDeriv(y(8),(1-params(10))*params(9),1)));
g1(15,17)=(-(T(21)*T(24)*y(5)*T(32)));
g1(15,24)=(-(T(21)*T(25)*T(23)*T(8)*T(5)*getPowerDeriv(y(24),params(10),1)));
g1(15,30)=(-(T(21)*T(25)*T(22)*T(38)));
g1(16,3)=1;
g1(16,6)=(-(T(27)*T(29)*y(18)*T(33)));
g1(16,9)=(-(T(31)*getPowerDeriv(y(9),(1-params(10))*params(9),1)));
g1(16,10)=(-(T(27)*T(31)));
g1(16,18)=(-(T(27)*T(29)*y(6)*T(33)));
g1(16,25)=(-(T(27)*T(30)*T(23)*exp(y(10))*T(9)*T(6)*getPowerDeriv(y(25),params(10),1)));
g1(16,30)=(-(T(27)*T(30)*T(28)*T(38)));
g1(17,3)=exp(y(30));
g1(17,5)=(-(exp(y(30))-(1-y(19))));
g1(17,6)=(-(exp(y(30))-(1-y(20))));
g1(17,19)=(-y(5));
g1(17,20)=(-y(6));
g1(17,29)=(-T(35));
g1(17,30)=y(3)*exp(y(30))-exp(y(30))*(y(5)+y(6));
g1(18,2)=(-((1-params(10))*params(9)/y(8)));
g1(18,8)=(-((-((1-params(10))*params(9)*y(2)))/(y(8)*y(8))));
g1(18,16)=1-params(10);
g1(19,2)=(-(exp(y(30))*params(8)*(T(1)+T(2))/(y(17)*y(5))));
g1(19,5)=(-(exp(y(30))*(-(y(17)*params(8)*(T(1)+T(2))*y(2)))/(y(17)*y(5)*y(17)*y(5))));
g1(19,14)=1-params(10);
g1(19,17)=(-(exp(y(30))*(-(y(5)*params(8)*(T(1)+T(2))*y(2)))/(y(17)*y(5)*y(17)*y(5))));
g1(19,30)=(-(exp(y(30))*params(8)*(T(1)+T(2))*y(2)/(y(17)*y(5))));
g1(20,3)=(-((1-params(10))*params(9)/y(9)));
g1(20,9)=(-((-((1-params(10))*params(9)*y(3)))/(y(9)*y(9))));
g1(20,16)=(1-params(10))/y(27);
g1(20,27)=(-((1-params(10))*y(16)))/(y(27)*y(27));
g1(21,3)=(-(exp(y(30))*params(8)*(T(1)+T(2))/(y(17)*y(6))));
g1(21,6)=(-(exp(y(30))*(-(y(17)*params(8)*(T(1)+T(2))*y(3)))/(y(17)*y(6)*y(17)*y(6))));
g1(21,14)=1-params(10);
g1(21,17)=(-(exp(y(30))*(-(y(6)*params(8)*(T(1)+T(2))*y(3)))/(y(17)*y(6)*y(17)*y(6))));
g1(21,30)=(-(exp(y(30))*params(8)*(T(1)+T(2))*y(3)/(y(17)*y(6))));
g1(22,7)=1;
g1(22,8)=(-1);
g1(22,9)=(-1);
g1(23,4)=1;
g1(23,5)=(-1);
g1(23,6)=(-1);
g1(24,23)=1;
g1(24,24)=(-1);
g1(24,25)=(-1);
g1(25,1)=1;
g1(25,2)=(-1);
g1(25,3)=(-params(18));
g1(26,31)=1-params(13);
g1(27,30)=1;
g1(27,31)=(-(1/(1-params(8)*(T(1)+T(2)))));
g1(28,10)=1-params(14);
g1(29,11)=1-params(15);
g1(30,12)=1-params(16);
g1(31,13)=1-params(17);
g1(32,32)=1;
g1(33,33)=1;
g1(34,34)=1;
g1(35,35)=1;
g1(36,36)=1;
g1(37,37)=1;
g1(38,32)=(-1);
g1(38,35)=1;
g1(38,38)=1;
g1(39,39)=1;
g1(40,27)=(-(1/y(27)));
g1(40,40)=2;
g1(41,41)=1;
g1(42,42)=1;
g1(43,47)=1;
g1(44,48)=1;
g1(45,43)=1;
g1(46,44)=1;
g1(47,45)=1;
g1(48,46)=1;
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
