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
    T = BRS_growth_alt.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(35, 56);
g1(1,19)=T(19)*getPowerDeriv(y(19),T(3),1);
g1(1,23)=T(20);
g1(1,27)=(-(1-params(8)));
g1(2,14)=(-(params(8)/y(29)));
g1(2,24)=T(4);
g1(2,28)=T(33);
g1(2,29)=(-((-(params(8)*y(14)))/(y(29)*y(29))));
g1(3,15)=(-(params(8)*y(32)/y(30)));
g1(3,24)=T(4);
g1(3,28)=T(33);
g1(3,30)=(-((-(params(8)*y(32)*y(15)))/(y(30)*y(30))));
g1(3,32)=(-(params(8)*y(15)/y(30)));
g1(4,14)=(-1);
g1(4,19)=T(19)*getPowerDeriv(y(19),1+T(3),1)/(1+T(3));
g1(4,23)=T(21);
g1(4,24)=T(6);
g1(4,28)=exp(y(24))*getPowerDeriv(y(28),T(5),1)/T(5);
g1(4,31)=1;
g1(5,48)=(-(T(9)*T(8)*(1-params(8))*T(12)));
g1(5,31)=y(32)*getPowerDeriv(y(31),(-params(1)),1);
g1(5,50)=(-(T(9)*T(23)*getPowerDeriv(y(50),(-params(1)),1)));
g1(5,32)=T(7);
g1(5,51)=(-(T(9)*T(8)*T(12)*T(22)));
g1(5,52)=(-(T(8)*T(23)*exp(y(52))*getPowerDeriv(exp(y(52)),(-params(1)),1)));
g1(6,48)=(-1);
g1(6,49)=1;
g1(7,14)=1;
g1(7,1)=(-(T(10)*T(26)*getPowerDeriv(y(1),T(13),1)));
g1(7,20)=(-(T(28)*getPowerDeriv(y(20),(1-params(8))*params(7),1)));
g1(7,29)=(-(T(10)*T(27)*T(25)*T(17)*T(14)*getPowerDeriv(y(29),params(8),1)));
g1(7,33)=(-(T(10)*T(27)*T(24)*T(34)));
g1(8,15)=1;
g1(8,2)=(-(T(11)*T(30)*getPowerDeriv(y(2),T(13),1)));
g1(8,21)=(-(T(32)*getPowerDeriv(y(21),(1-params(8))*params(7),1)));
g1(8,22)=(-(T(11)*T(32)));
g1(8,30)=(-(T(11)*T(31)*T(25)*exp(y(22))*T(18)*T(15)*getPowerDeriv(y(30),params(8),1)));
g1(8,33)=(-(T(11)*T(31)*T(29)*T(34)));
g1(9,15)=exp(y(33));
g1(9,1)=T(22);
g1(9,17)=(-exp(y(33)));
g1(9,2)=T(22);
g1(9,18)=(-exp(y(33)));
g1(9,33)=y(15)*exp(y(33))-exp(y(33))*(y(17)+y(18));
g1(10,14)=(-((1-params(8))*params(7)/y(20)));
g1(10,20)=(-((-((1-params(8))*params(7)*y(14)))/(y(20)*y(20))));
g1(10,27)=1-params(8);
g1(11,14)=(-(exp(y(33))*T(13)/y(1)));
g1(11,1)=(-(exp(y(33))*(-(y(14)*T(13)))/(y(1)*y(1))));
g1(11,25)=1-params(8);
g1(11,33)=(-(exp(y(33))*y(14)*T(13)/y(1)));
g1(12,15)=(-((1-params(8))*params(7)/y(21)));
g1(12,21)=(-((-((1-params(8))*params(7)*y(15)))/(y(21)*y(21))));
g1(12,27)=(1-params(8))/y(32);
g1(12,32)=(-((1-params(8))*y(27)))/(y(32)*y(32));
g1(13,15)=(-(exp(y(33))*T(13)/y(2)));
g1(13,2)=(-(exp(y(33))*(-(y(15)*T(13)))/(y(2)*y(2))));
g1(13,26)=(1-params(8))/y(32);
g1(13,32)=(-((1-params(8))*y(26)))/(y(32)*y(32));
g1(13,33)=(-(exp(y(33))*y(15)*T(13)/y(2)));
g1(14,19)=1;
g1(14,20)=(-1);
g1(14,21)=(-1);
g1(15,16)=1;
g1(15,17)=(-1);
g1(15,18)=(-1);
g1(16,28)=1;
g1(16,29)=(-1);
g1(16,30)=(-1);
g1(17,13)=1;
g1(17,14)=(-1);
g1(17,15)=(-params(15));
g1(18,6)=(-params(11));
g1(18,34)=1;
g1(18,53)=(-1);
g1(19,33)=1;
g1(19,34)=(-(1/(1-T(13))));
g1(20,3)=(-params(12));
g1(20,22)=1;
g1(20,54)=(-1);
g1(21,4)=(-params(13));
g1(21,23)=1;
g1(21,55)=1;
g1(22,5)=(-params(14));
g1(22,24)=1;
g1(22,56)=1;
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
g1(28,28)=(-(1/y(28)));
g1(28,40)=1;
g1(29,32)=(-(1/y(32)));
g1(29,41)=1;
g1(30,33)=(-1);
g1(30,8)=1;
g1(30,36)=(-1);
g1(30,42)=1;
g1(31,33)=(-1);
g1(31,9)=1;
g1(31,37)=(-1);
g1(31,43)=1;
g1(32,33)=(-1);
g1(32,7)=1;
g1(32,35)=(-1);
g1(32,44)=1;
g1(33,33)=(-1);
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
