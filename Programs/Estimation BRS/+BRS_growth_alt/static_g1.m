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
    T = BRS_growth_alt.static_g1_tt(T, y, x, params);
end
g1 = zeros(35, 35);
g1(1,7)=T(11)*getPowerDeriv(y(7),T(10),1);
g1(1,11)=T(12);
g1(1,15)=(-(1-params(8)));
g1(2,2)=(-(params(8)/y(17)));
g1(2,12)=T(13);
g1(2,16)=T(32);
g1(2,17)=(-((-(params(8)*y(2)))/(y(17)*y(17))));
g1(3,3)=(-(params(8)*y(20)/y(18)));
g1(3,12)=T(13);
g1(3,16)=T(32);
g1(3,18)=(-((-(params(8)*y(20)*y(3)))/(y(18)*y(18))));
g1(3,20)=(-(params(8)*y(3)/y(18)));
g1(4,2)=(-1);
g1(4,7)=T(11)*getPowerDeriv(y(7),1+T(10),1)/(1+T(10));
g1(4,11)=T(16);
g1(4,12)=T(15);
g1(4,16)=exp(y(12))*getPowerDeriv(y(16),T(14),1)/T(14);
g1(4,19)=1;
g1(5,13)=(-(T(18)*T(17)*T(2)*(1-params(8))));
g1(5,19)=y(20)*T(33)-T(18)*T(20)*T(33);
g1(5,20)=T(17)-T(18)*T(17)*T(2)*T(19);
g1(5,21)=(-(T(17)*T(20)*exp(y(21))*getPowerDeriv(exp(y(21)),(-params(1)),1)));
g1(6,13)=(-1);
g1(6,14)=1;
g1(7,2)=1;
g1(7,5)=(-(T(21)*T(24)*getPowerDeriv(y(5),T(3),1)));
g1(7,8)=(-(T(26)*getPowerDeriv(y(8),(1-params(8))*params(7),1)));
g1(7,17)=(-(T(21)*T(25)*T(23)*T(8)*T(5)*getPowerDeriv(y(17),params(8),1)));
g1(7,21)=(-(T(21)*T(25)*T(22)*T(34)));
g1(8,3)=1;
g1(8,6)=(-(T(27)*T(29)*getPowerDeriv(y(6),T(3),1)));
g1(8,9)=(-(T(31)*getPowerDeriv(y(9),(1-params(8))*params(7),1)));
g1(8,10)=(-(T(27)*T(31)));
g1(8,18)=(-(T(27)*T(30)*T(23)*exp(y(10))*T(9)*T(6)*getPowerDeriv(y(18),params(8),1)));
g1(8,21)=(-(T(27)*T(30)*T(28)*T(34)));
g1(9,3)=exp(y(21));
g1(9,5)=(-(exp(y(21))-T(19)));
g1(9,6)=(-(exp(y(21))-T(19)));
g1(9,21)=y(3)*exp(y(21))-exp(y(21))*(y(5)+y(6));
g1(10,2)=(-((1-params(8))*params(7)/y(8)));
g1(10,8)=(-((-((1-params(8))*params(7)*y(2)))/(y(8)*y(8))));
g1(10,15)=1-params(8);
g1(11,2)=(-(exp(y(21))*T(3)/y(5)));
g1(11,5)=(-(exp(y(21))*(-(T(3)*y(2)))/(y(5)*y(5))));
g1(11,13)=1-params(8);
g1(11,21)=(-(exp(y(21))*T(3)*y(2)/y(5)));
g1(12,3)=(-((1-params(8))*params(7)/y(9)));
g1(12,9)=(-((-((1-params(8))*params(7)*y(3)))/(y(9)*y(9))));
g1(12,15)=(1-params(8))/y(20);
g1(12,20)=(-((1-params(8))*y(15)))/(y(20)*y(20));
g1(13,3)=(-(exp(y(21))*T(3)/y(6)));
g1(13,6)=(-(exp(y(21))*(-(T(3)*y(3)))/(y(6)*y(6))));
g1(13,14)=(1-params(8))/y(20);
g1(13,20)=(-((1-params(8))*y(14)))/(y(20)*y(20));
g1(13,21)=(-(exp(y(21))*T(3)*y(3)/y(6)));
g1(14,7)=1;
g1(14,8)=(-1);
g1(14,9)=(-1);
g1(15,4)=1;
g1(15,5)=(-1);
g1(15,6)=(-1);
g1(16,16)=1;
g1(16,17)=(-1);
g1(16,18)=(-1);
g1(17,1)=1;
g1(17,2)=(-1);
g1(17,3)=(-params(15));
g1(18,22)=1-params(11);
g1(19,21)=1;
g1(19,22)=(-(1/(1-T(3))));
g1(20,10)=1-params(12);
g1(21,11)=1-params(13);
g1(22,12)=1-params(14);
g1(23,23)=1;
g1(24,24)=1;
g1(25,25)=1;
g1(26,26)=1;
g1(27,23)=(-1);
g1(27,26)=1;
g1(27,27)=1;
g1(28,28)=1;
g1(29,20)=(-(1/y(20)));
g1(29,29)=2;
g1(30,21)=(-1);
g1(30,30)=1;
g1(31,21)=(-1);
g1(31,31)=1;
g1(32,21)=(-1);
g1(32,32)=1;
g1(33,21)=(-1);
g1(33,33)=1;
g1(34,34)=1;
g1(35,35)=1;
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
