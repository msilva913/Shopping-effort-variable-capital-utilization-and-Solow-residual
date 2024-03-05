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
    T = BRS_est_shopping.static_g1_tt(T, y, x, params);
end
g1 = zeros(33, 33);
g1(1,7)=T(11)*getPowerDeriv(y(7),T(10),1);
g1(1,13)=T(12);
g1(1,17)=(-(1-params(8)));
g1(2,2)=(-(params(8)/y(19)));
g1(2,14)=T(13);
g1(2,18)=T(27);
g1(2,19)=(-((-(params(8)*y(2)))/(y(19)*y(19))));
g1(3,3)=(-(params(8)*y(22)/y(20)));
g1(3,14)=T(13);
g1(3,18)=T(27);
g1(3,20)=(-((-(params(8)*y(22)*y(3)))/(y(20)*y(20))));
g1(3,22)=(-(params(8)*y(3)/y(20)));
g1(4,2)=(-1);
g1(4,7)=T(11)*getPowerDeriv(y(7),1+T(10),1)/(1+T(10));
g1(4,13)=T(16);
g1(4,14)=T(15);
g1(4,18)=exp(y(14))*getPowerDeriv(y(18),T(14),1)/T(14);
g1(4,21)=1;
g1(5,15)=(-(T(17)*T(1)*(1-params(8))));
g1(5,21)=y(22)*T(28)-T(1)*((1-params(8))*y(15)+T(2)*y(22))*T(28);
g1(5,22)=T(17)-T(17)*T(1)*T(2);
g1(6,15)=(-1);
g1(6,16)=1;
g1(7,2)=1;
g1(7,5)=(-(T(18)*T(19)*getPowerDeriv(y(5),T(4),1)));
g1(7,8)=(-(T(21)*getPowerDeriv(y(8),(1-params(8))*params(7),1)));
g1(7,10)=(-(T(18)*T(21)));
g1(7,19)=(-(T(18)*T(20)*exp(y(10))*T(8)*T(6)*getPowerDeriv(y(19),params(8),1)));
g1(8,3)=1;
g1(8,6)=(-(T(22)*T(23)*getPowerDeriv(y(6),T(4),1)));
g1(8,9)=(-(T(25)*getPowerDeriv(y(9),(1-params(8))*params(7),1)));
g1(8,12)=(-(T(22)*T(25)));
g1(8,20)=(-(T(22)*T(24)*exp(y(12))*T(9)*T(7)*getPowerDeriv(y(20),params(8),1)));
g1(9,3)=1;
g1(9,5)=(-(1-T(2)));
g1(9,6)=(-(1-T(2)));
g1(10,2)=(-((1-params(8))*params(7)/y(8)));
g1(10,8)=(-((-((1-params(8))*params(7)*y(2)))/(y(8)*y(8))));
g1(10,17)=1-params(8);
g1(11,5)=(-(T(26)/y(8)));
g1(11,8)=(-((-(y(5)*T(26)))/(y(8)*y(8))));
g1(11,15)=(-y(17))/(y(15)*y(15));
g1(11,17)=1/y(15);
g1(12,3)=(-((1-params(8))*params(7)/y(9)));
g1(12,9)=(-((-((1-params(8))*params(7)*y(3)))/(y(9)*y(9))));
g1(12,17)=(1-params(8))/y(22);
g1(12,22)=(-((1-params(8))*y(17)))/(y(22)*y(22));
g1(13,6)=(-(T(26)/y(9)));
g1(13,9)=(-((-(y(6)*T(26)))/(y(9)*y(9))));
g1(13,16)=(-y(17))/(y(16)*y(16));
g1(13,17)=1/y(16);
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
g1(17,3)=(-params(15));
g1(18,10)=1-params(11);
g1(19,11)=1;
g1(19,12)=(-params(12));
g1(20,10)=(-1);
g1(20,11)=(-1);
g1(20,12)=1;
g1(21,13)=1-params(13);
g1(22,14)=1-params(14);
g1(23,1)=(-(1/y(1)));
g1(23,23)=1;
g1(24,2)=(-(1/y(2)));
g1(24,24)=1;
g1(25,3)=(-(1/y(3)));
g1(25,25)=1;
g1(26,7)=(-(1/y(7)));
g1(26,26)=1;
g1(27,23)=(-1);
g1(27,26)=1;
g1(27,27)=1;
g1(28,18)=(-(1/y(18)));
g1(28,28)=1;
g1(29,29)=1;
g1(30,30)=1;
g1(31,31)=1;
g1(32,32)=1;
g1(33,22)=(-(1/y(22)));
g1(33,33)=1;
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
