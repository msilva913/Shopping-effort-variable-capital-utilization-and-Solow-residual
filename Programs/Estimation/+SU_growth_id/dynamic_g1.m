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
    T = SU_growth_id.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(49, 77);
g1(1,26)=T(25)*getPowerDeriv(y(26),T(2),1);
g1(1,32)=T(26);
g1(1,36)=(-(1-params(8)));
g1(2,20)=(-(params(8)/y(38)));
g1(2,33)=T(3);
g1(2,37)=T(39);
g1(2,38)=(-((-(params(8)*y(20)))/(y(38)*y(38))));
g1(3,21)=(-(params(8)*y(41)/y(39)));
g1(3,33)=T(3);
g1(3,37)=T(39);
g1(3,39)=(-((-(params(8)*y(41)*y(21)))/(y(39)*y(39))));
g1(3,41)=(-(params(8)*y(21)/y(39)));
g1(4,20)=(-1);
g1(4,26)=T(25)*getPowerDeriv(y(26),1+T(2),1)/(1+T(2));
g1(4,32)=T(27);
g1(4,33)=T(5);
g1(4,37)=exp(y(33))*getPowerDeriv(y(37),T(4),1)/T(4);
g1(4,40)=1;
g1(5,68)=(-(T(8)*T(7)*params(2)*(1-params(8))));
g1(5,40)=y(41)*getPowerDeriv(y(40),(-params(1)),1);
g1(5,70)=(-(T(8)*T(29)*getPowerDeriv(y(70),(-params(1)),1)));
g1(5,41)=T(6);
g1(5,71)=(-(T(8)*T(7)*params(2)*T(28)));
g1(5,72)=(-(T(7)*T(29)*exp(y(72))*getPowerDeriv(exp(y(72)),(-params(1)),1)));
g1(6,68)=(-1);
g1(6,69)=1;
g1(7,20)=1;
g1(7,1)=(-(T(17)*T(32)*getPowerDeriv(y(1),T(19),1)));
g1(7,27)=(-(T(34)*getPowerDeriv(y(27),(1-params(8))*params(7),1)));
g1(7,29)=(-(T(17)*T(34)));
g1(7,38)=(-(T(17)*T(33)*T(31)*exp(y(29))*T(23)*T(40)));
g1(7,42)=(-(T(17)*T(33)*exp(y(29))*T(23)*T(30)*T(42)));
g1(8,21)=1;
g1(8,2)=(-(T(18)*T(36)*getPowerDeriv(y(2),T(19),1)));
g1(8,28)=(-(T(38)*getPowerDeriv(y(28),(1-params(8))*params(7),1)));
g1(8,31)=(-(T(18)*T(38)));
g1(8,39)=(-(T(18)*T(37)*T(31)*exp(y(31))*T(24)*T(41)));
g1(8,42)=(-(T(18)*T(37)*exp(y(31))*T(24)*T(35)*T(42)));
g1(9,21)=exp(y(42));
g1(9,1)=T(28);
g1(9,24)=(-exp(y(42)));
g1(9,2)=T(28);
g1(9,25)=(-exp(y(42)));
g1(9,42)=y(21)*exp(y(42))-exp(y(42))*(y(24)+y(25));
g1(10,20)=(-((1-params(8))*params(7)/y(27)));
g1(10,27)=(-((-((1-params(8))*params(7)*y(20)))/(y(27)*y(27))));
g1(10,36)=1-params(8);
g1(11,20)=(-(exp(y(42))*T(19)/y(1)));
g1(11,1)=(-(exp(y(42))*(-(y(20)*T(19)))/(y(1)*y(1))));
g1(11,34)=1-params(8);
g1(11,42)=(-(exp(y(42))*y(20)*T(19)/y(1)));
g1(12,21)=(-((1-params(8))*params(7)/y(28)));
g1(12,28)=(-((-((1-params(8))*params(7)*y(21)))/(y(28)*y(28))));
g1(12,36)=(1-params(8))/y(41);
g1(12,41)=(-((1-params(8))*y(36)))/(y(41)*y(41));
g1(13,21)=(-(exp(y(42))*T(19)/y(2)));
g1(13,2)=(-(exp(y(42))*(-(y(21)*T(19)))/(y(2)*y(2))));
g1(13,35)=(1-params(8))/y(41);
g1(13,41)=(-((1-params(8))*y(35)))/(y(41)*y(41));
g1(13,42)=(-(exp(y(42))*y(21)*T(19)/y(2)));
g1(14,26)=1;
g1(14,27)=(-1);
g1(14,28)=(-1);
g1(15,23)=1;
g1(15,24)=(-1);
g1(15,25)=(-1);
g1(16,37)=1;
g1(16,38)=(-1);
g1(16,39)=(-1);
g1(17,19)=1;
g1(17,20)=(-1);
g1(17,21)=(-params(16));
g1(18,19)=(-(T(9)*(y(20)*(-y(20))/(y(19)*y(19))/T(12)+y(21)*(-y(21))/(y(19)*y(19))/T(15))));
g1(18,20)=(-(T(9)*(y(20)/y(19)+y(20)*1/y(19))/T(12)));
g1(18,21)=(-(T(9)*(y(21)/y(19)+y(21)*1/y(19))/T(15)));
g1(18,22)=1;
g1(18,1)=(-(T(9)*(-(y(20)*y(20)/y(19)*T(11)*getPowerDeriv(y(1),1-params(7),1)))/(T(12)*T(12))));
g1(18,2)=(-(T(9)*(-(y(21)*y(21)/y(19)*T(14)*getPowerDeriv(y(2),1-params(7),1)))/(T(15)*T(15))));
g1(18,27)=(-(T(9)*(-(y(20)*y(20)/y(19)*T(10)*getPowerDeriv(y(27),params(7),1)))/(T(12)*T(12))));
g1(18,28)=(-(T(9)*(-(y(21)*y(21)/y(19)*T(13)*getPowerDeriv(y(28),params(7),1)))/(T(15)*T(15))));
g1(18,42)=(-(T(16)*exp(y(42))*getPowerDeriv(exp(y(42)),1-params(7),1)));
g1(19,38)=(-T(40));
g1(19,43)=1;
g1(20,39)=(-T(41));
g1(20,44)=1;
g1(21,20)=(-(y(43)*y(21)/((y(20)+y(21))*(y(20)+y(21)))+y(44)*(-y(21))/((y(20)+y(21))*(y(20)+y(21)))));
g1(21,21)=(-(y(43)*(-y(20))/((y(20)+y(21))*(y(20)+y(21)))+y(44)*y(20)/((y(20)+y(21))*(y(20)+y(21)))));
g1(21,43)=(-(y(20)/(y(20)+y(21))));
g1(21,44)=(-(y(21)/(y(20)+y(21))));
g1(21,45)=1;
g1(22,7)=(-params(11));
g1(22,42)=1;
g1(22,73)=(-1);
g1(23,3)=(-params(12));
g1(23,29)=1;
g1(23,74)=(-1);
g1(24,30)=1;
g1(24,4)=(-params(13));
g1(24,75)=(-1);
g1(25,29)=(-1);
g1(25,30)=(-1);
g1(25,31)=1;
g1(26,5)=(-params(14));
g1(26,32)=1;
g1(26,76)=1;
g1(27,6)=(-params(15));
g1(27,33)=1;
g1(27,77)=1;
g1(28,19)=(-(1/y(19)));
g1(28,46)=1;
g1(29,20)=(-(1/y(20)));
g1(29,47)=1;
g1(30,21)=(-(1/y(21)));
g1(30,48)=1;
g1(31,26)=(-(1/y(26)));
g1(31,49)=1;
g1(32,27)=(-(1/y(27)));
g1(32,50)=1;
g1(33,28)=(-(1/y(28)));
g1(33,51)=1;
g1(34,46)=(-1);
g1(34,49)=1;
g1(34,52)=1;
g1(35,22)=(-(1/y(22)));
g1(35,53)=1;
g1(36,37)=(-(1/y(37)));
g1(36,54)=1;
g1(37,41)=(-(1/y(41)));
g1(37,55)=1;
g1(38,45)=(-(1/y(45)));
g1(38,56)=1;
g1(39,42)=(-1);
g1(39,9)=1;
g1(39,47)=(-1);
g1(39,57)=1;
g1(40,42)=(-1);
g1(40,10)=1;
g1(40,48)=(-1);
g1(40,58)=1;
g1(41,42)=(-1);
g1(41,8)=1;
g1(41,46)=(-1);
g1(41,59)=1;
g1(42,42)=(-1);
g1(42,14)=1;
g1(42,52)=(-1);
g1(42,61)=1;
g1(43,42)=(-params(7));
g1(43,15)=1;
g1(43,53)=(-1);
g1(43,60)=1;
g1(44,17)=1;
g1(44,55)=(-1);
g1(44,62)=1;
g1(45,11)=1;
g1(45,49)=(-1);
g1(45,65)=1;
g1(46,12)=1;
g1(46,50)=(-1);
g1(46,63)=1;
g1(47,13)=1;
g1(47,51)=(-1);
g1(47,64)=1;
g1(48,16)=1;
g1(48,54)=(-1);
g1(48,66)=1;
g1(49,18)=1;
g1(49,56)=(-1);
g1(49,67)=1;

end
