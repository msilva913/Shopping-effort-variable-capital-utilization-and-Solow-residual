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
    T = RBC.static_g1_tt(T, y, x, params);
end
g1 = zeros(38, 38);
g1(1,8)=T(4)*getPowerDeriv(y(8),T(3),1);
g1(1,14)=T(5);
g1(1,17)=(-1);
g1(2,2)=(-1);
g1(2,8)=T(4)*getPowerDeriv(y(8),1+T(3),1)/(1+T(3));
g1(2,14)=T(6);
g1(2,18)=1;
g1(3,15)=(-(T(8)*params(2)*T(7)));
g1(3,18)=y(19)*T(29)-T(8)*params(2)*(y(15)+y(19)*T(9))*T(29);
g1(3,19)=T(7)-T(8)*T(7)*params(2)*T(9);
g1(3,20)=(-(T(7)*params(2)*(y(15)+y(19)*T(9))*exp(y(20))*getPowerDeriv(exp(y(20)),(-params(1)),1)));
g1(4,15)=(-1);
g1(4,16)=1;
g1(5,2)=1;
g1(5,6)=(-(T(10)*T(13)*getPowerDeriv(y(6),T(1),1)));
g1(5,9)=(-(T(15)*T(27)));
g1(5,11)=(-(T(10)*T(15)));
g1(5,20)=(-(T(10)*T(14)*T(11)*T(30)));
g1(6,3)=1;
g1(6,7)=(-(T(16)*T(18)*getPowerDeriv(y(7),T(1),1)));
g1(6,10)=(-(T(20)*T(28)));
g1(6,13)=(-(T(16)*T(20)));
g1(6,20)=(-(T(16)*T(19)*T(17)*T(30)));
g1(7,3)=exp(y(20));
g1(7,6)=(-(exp(y(20))-T(9)));
g1(7,7)=(-(exp(y(20))-T(9)));
g1(7,20)=exp(y(20))*y(3)-exp(y(20))*(y(6)+y(7));
g1(8,2)=(-(params(7)/y(9)));
g1(8,9)=(-((-(params(7)*y(2)))/(y(9)*y(9))));
g1(8,17)=1;
g1(9,2)=(-(exp(y(20))*T(1)/y(6)));
g1(9,6)=(-(exp(y(20))*(-(T(1)*y(2)))/(y(6)*y(6))));
g1(9,15)=1;
g1(9,20)=(-(exp(y(20))*T(1)*y(2)/y(6)));
g1(10,3)=(-(params(7)/y(10)));
g1(10,10)=(-((-(params(7)*y(3)))/(y(10)*y(10))));
g1(10,17)=1/y(19);
g1(10,19)=(-y(17))/(y(19)*y(19));
g1(11,3)=(-(exp(y(20))*T(1)/y(7)));
g1(11,7)=(-(exp(y(20))*(-(T(1)*y(3)))/(y(7)*y(7))));
g1(11,16)=1/y(19);
g1(11,19)=(-y(16))/(y(19)*y(19));
g1(11,20)=(-(exp(y(20))*T(1)*y(3)/y(7)));
g1(12,8)=1;
g1(12,9)=(-1);
g1(12,10)=(-1);
g1(13,5)=1;
g1(13,6)=(-1);
g1(13,7)=(-1);
g1(14,1)=1;
g1(14,2)=(-1);
g1(14,3)=(-params(12));
g1(15,1)=(-(T(21)*(y(2)*(-y(2))/(y(1)*y(1))/T(23)+y(3)*(-y(3))/(y(1)*y(1))/T(25))));
g1(15,2)=(-(T(21)*(y(2)/y(1)+y(2)*1/y(1))/T(23)));
g1(15,3)=(-(T(21)*(y(3)/y(1)+y(3)*1/y(1))/T(25)));
g1(15,4)=1;
g1(15,6)=(-(T(21)*(-(y(2)*y(2)/y(1)*T(10)*getPowerDeriv(y(6),1-params(7),1)))/(T(23)*T(23))));
g1(15,7)=(-(T(21)*(-(y(3)*y(3)/y(1)*T(16)*getPowerDeriv(y(7),1-params(7),1)))/(T(25)*T(25))));
g1(15,9)=(-(T(21)*(-(y(2)*y(2)/y(1)*T(22)*T(27)))/(T(23)*T(23))));
g1(15,10)=(-(T(21)*(-(y(3)*y(3)/y(1)*T(24)*T(28)))/(T(25)*T(25))));
g1(15,20)=(-(T(26)*exp(y(20))*getPowerDeriv(exp(y(20)),1-params(7),1)));
g1(16,20)=1-params(8);
g1(17,11)=1-params(9);
g1(18,12)=1;
g1(18,13)=(-params(10));
g1(19,11)=(-1);
g1(19,12)=(-1);
g1(19,13)=1;
g1(20,14)=1-params(11);
g1(21,21)=1;
g1(22,22)=1;
g1(23,23)=1;
g1(24,24)=1;
g1(25,25)=1;
g1(26,26)=1;
g1(27,21)=(-1);
g1(27,24)=1;
g1(27,27)=1;
g1(28,28)=1;
g1(29,29)=1;
g1(30,20)=(-1);
g1(30,30)=1;
g1(31,20)=(-1);
g1(31,31)=1;
g1(32,20)=(-1);
g1(32,32)=1;
g1(33,20)=(-1);
g1(33,33)=1;
g1(34,20)=(-params(7));
g1(34,34)=1;
g1(35,35)=1;
g1(36,38)=1;
g1(37,36)=1;
g1(38,37)=1;
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
