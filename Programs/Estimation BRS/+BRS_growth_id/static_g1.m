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
g1 = zeros(46, 46);
g1(1,7)=T(9)*getPowerDeriv(y(7),T(8),1);
g1(1,13)=T(10);
g1(1,17)=(-(1-params(8)));
g1(2,2)=(-(params(8)/y(19)));
g1(2,14)=T(11);
g1(2,18)=T(30);
g1(2,19)=(-((-(params(8)*y(2)))/(y(19)*y(19))));
g1(3,3)=(-(params(8)*y(22)/y(20)));
g1(3,14)=T(11);
g1(3,18)=T(30);
g1(3,20)=(-((-(params(8)*y(22)*y(3)))/(y(20)*y(20))));
g1(3,22)=(-(params(8)*y(3)/y(20)));
g1(4,2)=(-1);
g1(4,7)=T(9)*getPowerDeriv(y(7),1+T(8),1)/(1+T(8));
g1(4,13)=T(14);
g1(4,14)=T(13);
g1(4,18)=exp(y(14))*getPowerDeriv(y(18),T(12),1)/T(12);
g1(4,21)=1;
g1(5,15)=(-(T(16)*T(15)*params(2)*(1-params(8))));
g1(5,21)=y(22)*T(33)-T(16)*T(18)*T(33);
g1(5,22)=T(15)-T(16)*T(15)*params(2)*T(17);
g1(5,23)=(-(T(15)*T(18)*exp(y(23))*getPowerDeriv(exp(y(23)),(-params(1)),1)));
g1(6,15)=(-1);
g1(6,16)=1;
g1(7,2)=1;
g1(7,5)=(-(T(19)*T(22)*getPowerDeriv(y(5),T(1),1)));
g1(7,8)=(-(T(24)*getPowerDeriv(y(8),(1-params(8))*params(7),1)));
g1(7,10)=(-(T(19)*T(24)));
g1(7,19)=(-(T(19)*T(23)*T(21)*exp(y(10))*T(6)*T(31)));
g1(7,23)=(-(T(19)*T(23)*exp(y(10))*T(6)*T(20)*T(34)));
g1(8,3)=1;
g1(8,6)=(-(T(25)*T(27)*getPowerDeriv(y(6),T(1),1)));
g1(8,9)=(-(T(29)*getPowerDeriv(y(9),(1-params(8))*params(7),1)));
g1(8,12)=(-(T(25)*T(29)));
g1(8,20)=(-(T(25)*T(28)*T(21)*exp(y(12))*T(7)*T(32)));
g1(8,23)=(-(T(25)*T(28)*exp(y(12))*T(7)*T(26)*T(34)));
g1(9,3)=exp(y(23));
g1(9,5)=(-(exp(y(23))-T(17)));
g1(9,6)=(-(exp(y(23))-T(17)));
g1(9,23)=y(3)*exp(y(23))-exp(y(23))*(y(5)+y(6));
g1(10,2)=(-((1-params(8))*params(7)/y(8)));
g1(10,8)=(-((-((1-params(8))*params(7)*y(2)))/(y(8)*y(8))));
g1(10,17)=1-params(8);
g1(11,2)=(-(exp(y(23))*T(1)/y(5)));
g1(11,5)=(-(exp(y(23))*(-(T(1)*y(2)))/(y(5)*y(5))));
g1(11,15)=1-params(8);
g1(11,23)=(-(exp(y(23))*T(1)*y(2)/y(5)));
g1(12,3)=(-((1-params(8))*params(7)/y(9)));
g1(12,9)=(-((-((1-params(8))*params(7)*y(3)))/(y(9)*y(9))));
g1(12,17)=(1-params(8))/y(22);
g1(12,22)=(-((1-params(8))*y(17)))/(y(22)*y(22));
g1(13,3)=(-(exp(y(23))*T(1)/y(6)));
g1(13,6)=(-(exp(y(23))*(-(T(1)*y(3)))/(y(6)*y(6))));
g1(13,16)=(1-params(8))/y(22);
g1(13,22)=(-((1-params(8))*y(16)))/(y(22)*y(22));
g1(13,23)=(-(exp(y(23))*T(1)*y(3)/y(6)));
g1(14,7)=1;
g1(14,8)=(-1);
g1(14,9)=(-1);
g1(15,4)=1;
g1(15,5)=(-1);
g1(15,6)=(-1);
g1(16,18)=1;
g1(16,19)=(-1);
g1(16,20)=(-1);
g1(17,1)=1;
g1(17,2)=(-1);
g1(17,3)=(-params(16));
g1(18,19)=(-T(31));
g1(18,24)=1;
g1(19,20)=(-T(32));
g1(19,25)=1;
g1(20,2)=(-(y(24)*y(3)/((y(2)+y(3))*(y(2)+y(3)))+y(25)*(-y(3))/((y(2)+y(3))*(y(2)+y(3)))));
g1(20,3)=(-(y(24)*(-y(2))/((y(2)+y(3))*(y(2)+y(3)))+y(25)*y(2)/((y(2)+y(3))*(y(2)+y(3)))));
g1(20,24)=(-(y(2)/(y(2)+y(3))));
g1(20,25)=(-(y(3)/(y(2)+y(3))));
g1(20,26)=1;
g1(21,23)=1-params(11);
g1(22,10)=1-params(12);
g1(23,11)=1;
g1(23,12)=(-params(13));
g1(24,10)=(-1);
g1(24,11)=(-1);
g1(24,12)=1;
g1(25,13)=1-params(14);
g1(26,14)=1-params(15);
g1(27,27)=1;
g1(28,28)=1;
g1(29,29)=1;
g1(30,30)=1;
g1(31,31)=1;
g1(32,32)=1;
g1(33,27)=(-1);
g1(33,30)=1;
g1(33,33)=1;
g1(34,34)=1;
g1(35,22)=(-(1/y(22)));
g1(35,35)=2;
g1(36,36)=1;
g1(37,23)=(-1);
g1(37,37)=1;
g1(38,23)=(-1);
g1(38,38)=1;
g1(39,23)=(-1);
g1(39,39)=1;
g1(40,23)=(-1);
g1(40,40)=1;
g1(41,41)=1;
g1(42,44)=1;
g1(43,42)=1;
g1(44,43)=1;
g1(45,45)=1;
g1(46,46)=1;
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
