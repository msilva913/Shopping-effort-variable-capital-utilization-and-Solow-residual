function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
% function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   g1
%

if T_flag
    T = BRS_fd.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(35, 55);
g1(1,19)=T(18)*getPowerDeriv(y(19),T(2),1);
g1(1,25)=T(19);
g1(1,29)=(-(1-params(8)));
g1(2,14)=(-(params(8)/y(31)));
g1(2,26)=T(3);
g1(2,30)=T(28);
g1(2,31)=(-((-(params(8)*y(14)))/(y(31)*y(31))));
g1(3,15)=(-(params(8)*y(34)/y(32)));
g1(3,26)=T(3);
g1(3,30)=T(28);
g1(3,32)=(-((-(params(8)*y(34)*y(15)))/(y(32)*y(32))));
g1(3,34)=(-(params(8)*y(15)/y(32)));
g1(4,14)=(-1);
g1(4,19)=T(18)*getPowerDeriv(y(19),1+T(2),1)/(1+T(2));
g1(4,25)=T(20);
g1(4,26)=T(5);
g1(4,30)=exp(y(26))*getPowerDeriv(y(30),T(4),1)/T(4);
g1(4,33)=1;
g1(5,48)=(-(T(7)*(1-params(8))*T(11)));
g1(5,33)=y(34)*getPowerDeriv(y(33),(-params(1)),1);
g1(5,50)=(-(((1-params(8))*y(48)+y(51)*T(8))*T(11)*getPowerDeriv(y(50),(-params(1)),1)));
g1(5,34)=T(6);
g1(5,51)=(-(T(7)*T(8)*T(11)));
g1(6,48)=(-1);
g1(6,49)=1;
g1(7,14)=1;
g1(7,1)=(-(T(9)*T(21)*getPowerDeriv(y(1),T(13),1)));
g1(7,20)=(-(T(23)*getPowerDeriv(y(20),(1-params(8))*params(7),1)));
g1(7,22)=(-(T(9)*T(23)));
g1(7,31)=(-(T(9)*T(22)*exp(y(22))*T(16)*T(14)*getPowerDeriv(y(31),params(8),1)));
g1(8,15)=1;
g1(8,2)=(-(T(10)*T(24)*getPowerDeriv(y(2),T(13),1)));
g1(8,21)=(-(T(26)*getPowerDeriv(y(21),(1-params(8))*params(7),1)));
g1(8,24)=(-(T(10)*T(26)));
g1(8,32)=(-(T(10)*T(25)*exp(y(24))*T(17)*T(15)*getPowerDeriv(y(32),params(8),1)));
g1(9,15)=1;
g1(9,1)=T(8);
g1(9,17)=(-1);
g1(9,2)=T(8);
g1(9,18)=(-1);
g1(10,14)=(-((1-params(8))*params(7)/y(20)));
g1(10,20)=(-((-((1-params(8))*params(7)*y(14)))/(y(20)*y(20))));
g1(10,29)=1-params(8);
g1(11,1)=(-(T(27)/y(20)));
g1(11,20)=(-((-(y(1)*T(27)))/(y(20)*y(20))));
g1(11,27)=(-y(29))/(y(27)*y(27));
g1(11,29)=1/y(27);
g1(12,15)=(-((1-params(8))*params(7)/y(21)));
g1(12,21)=(-((-((1-params(8))*params(7)*y(15)))/(y(21)*y(21))));
g1(12,29)=(1-params(8))/y(34);
g1(12,34)=(-((1-params(8))*y(29)))/(y(34)*y(34));
g1(13,2)=(-(T(27)/y(21)));
g1(13,21)=(-((-(y(2)*T(27)))/(y(21)*y(21))));
g1(13,28)=(-y(29))/(y(28)*y(28));
g1(13,29)=1/y(28);
g1(14,19)=1;
g1(14,20)=(-1);
g1(14,21)=(-1);
g1(15,16)=1;
g1(15,17)=(-1);
g1(15,18)=(-1);
g1(16,30)=1;
g1(16,31)=(-1);
g1(16,32)=(-1);
g1(17,13)=1;
g1(17,14)=(-1);
g1(17,15)=(-params(15));
g1(18,3)=(-params(11));
g1(18,22)=1;
g1(18,52)=(-1);
g1(19,23)=1;
g1(19,4)=(-params(12));
g1(19,53)=(-1);
g1(20,22)=(-1);
g1(20,23)=(-1);
g1(20,24)=1;
g1(21,5)=(-params(13));
g1(21,25)=1;
g1(21,54)=1;
g1(22,6)=(-params(14));
g1(22,26)=1;
g1(22,55)=1;
g1(23,13)=(-(1/y(13)));
g1(23,35)=1;
g1(24,14)=(-(1/y(14)));
g1(24,36)=1;
g1(25,15)=(-(1/y(15)));
g1(25,37)=1;
g1(26,19)=(-(1/y(19)));
g1(26,38)=1;
g1(27,35)=(-1);
g1(27,38)=1;
g1(27,39)=1;
g1(28,30)=(-(1/y(30)));
g1(28,40)=1;
g1(29,34)=(-(1/y(34)));
g1(29,41)=1;
g1(30,8)=1;
g1(30,36)=(-1);
g1(30,42)=1;
g1(31,9)=1;
g1(31,37)=(-1);
g1(31,43)=1;
g1(32,7)=1;
g1(32,35)=(-1);
g1(32,44)=1;
g1(33,11)=1;
g1(33,39)=(-1);
g1(33,45)=1;
g1(34,12)=1;
g1(34,41)=(-1);
g1(34,46)=1;
g1(35,10)=1;
g1(35,38)=(-1);
g1(35,47)=1;

end
