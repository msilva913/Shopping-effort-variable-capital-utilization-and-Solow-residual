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
    T = BRS_growth_id.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(46, 73);
g1(1,24)=T(17)*getPowerDeriv(y(24),T(2),1);
g1(1,30)=T(18);
g1(1,34)=(-(1-params(8)));
g1(2,19)=(-(params(8)/y(36)));
g1(2,31)=T(3);
g1(2,35)=T(31);
g1(2,36)=(-((-(params(8)*y(19)))/(y(36)*y(36))));
g1(3,20)=(-(params(8)*y(39)/y(37)));
g1(3,31)=T(3);
g1(3,35)=T(31);
g1(3,37)=(-((-(params(8)*y(39)*y(20)))/(y(37)*y(37))));
g1(3,39)=(-(params(8)*y(20)/y(37)));
g1(4,19)=(-1);
g1(4,24)=T(17)*getPowerDeriv(y(24),1+T(2),1)/(1+T(2));
g1(4,30)=T(19);
g1(4,31)=T(5);
g1(4,35)=exp(y(31))*getPowerDeriv(y(35),T(4),1)/T(4);
g1(4,38)=1;
g1(5,64)=(-(T(8)*T(7)*params(2)*(1-params(8))));
g1(5,38)=y(39)*getPowerDeriv(y(38),(-params(1)),1);
g1(5,66)=(-(T(8)*T(21)*getPowerDeriv(y(66),(-params(1)),1)));
g1(5,39)=T(6);
g1(5,67)=(-(T(8)*T(7)*params(2)*T(20)));
g1(5,68)=(-(T(7)*T(21)*exp(y(68))*getPowerDeriv(exp(y(68)),(-params(1)),1)));
g1(6,64)=(-1);
g1(6,65)=1;
g1(7,19)=1;
g1(7,1)=(-(T(9)*T(24)*getPowerDeriv(y(1),T(11),1)));
g1(7,25)=(-(T(26)*getPowerDeriv(y(25),(1-params(8))*params(7),1)));
g1(7,27)=(-(T(9)*T(26)));
g1(7,36)=(-(T(9)*T(25)*T(23)*exp(y(27))*T(15)*T(32)));
g1(7,40)=(-(T(9)*T(25)*exp(y(27))*T(15)*T(22)*T(34)));
g1(8,20)=1;
g1(8,2)=(-(T(10)*T(28)*getPowerDeriv(y(2),T(11),1)));
g1(8,26)=(-(T(30)*getPowerDeriv(y(26),(1-params(8))*params(7),1)));
g1(8,29)=(-(T(10)*T(30)));
g1(8,37)=(-(T(10)*T(29)*T(23)*exp(y(29))*T(16)*T(33)));
g1(8,40)=(-(T(10)*T(29)*exp(y(29))*T(16)*T(27)*T(34)));
g1(9,20)=exp(y(40));
g1(9,1)=T(20);
g1(9,22)=(-exp(y(40)));
g1(9,2)=T(20);
g1(9,23)=(-exp(y(40)));
g1(9,40)=y(20)*exp(y(40))-exp(y(40))*(y(22)+y(23));
g1(10,19)=(-((1-params(8))*params(7)/y(25)));
g1(10,25)=(-((-((1-params(8))*params(7)*y(19)))/(y(25)*y(25))));
g1(10,34)=1-params(8);
g1(11,19)=(-(exp(y(40))*T(11)/y(1)));
g1(11,1)=(-(exp(y(40))*(-(y(19)*T(11)))/(y(1)*y(1))));
g1(11,32)=1-params(8);
g1(11,40)=(-(exp(y(40))*y(19)*T(11)/y(1)));
g1(12,20)=(-((1-params(8))*params(7)/y(26)));
g1(12,26)=(-((-((1-params(8))*params(7)*y(20)))/(y(26)*y(26))));
g1(12,34)=(1-params(8))/y(39);
g1(12,39)=(-((1-params(8))*y(34)))/(y(39)*y(39));
g1(13,20)=(-(exp(y(40))*T(11)/y(2)));
g1(13,2)=(-(exp(y(40))*(-(y(20)*T(11)))/(y(2)*y(2))));
g1(13,33)=(1-params(8))/y(39);
g1(13,39)=(-((1-params(8))*y(33)))/(y(39)*y(39));
g1(13,40)=(-(exp(y(40))*y(20)*T(11)/y(2)));
g1(14,24)=1;
g1(14,25)=(-1);
g1(14,26)=(-1);
g1(15,21)=1;
g1(15,22)=(-1);
g1(15,23)=(-1);
g1(16,35)=1;
g1(16,36)=(-1);
g1(16,37)=(-1);
g1(17,18)=1;
g1(17,19)=(-1);
g1(17,20)=(-params(16));
g1(18,36)=(-T(32));
g1(18,41)=1;
g1(19,37)=(-T(33));
g1(19,42)=1;
g1(20,19)=(-(y(41)*y(20)/((y(19)+y(20))*(y(19)+y(20)))+y(42)*(-y(20))/((y(19)+y(20))*(y(19)+y(20)))));
g1(20,20)=(-(y(41)*(-y(19))/((y(19)+y(20))*(y(19)+y(20)))+y(42)*y(19)/((y(19)+y(20))*(y(19)+y(20)))));
g1(20,41)=(-(y(19)/(y(19)+y(20))));
g1(20,42)=(-(y(20)/(y(19)+y(20))));
g1(20,43)=1;
g1(21,7)=(-params(11));
g1(21,40)=1;
g1(21,69)=(-1);
g1(22,3)=(-params(12));
g1(22,27)=1;
g1(22,70)=(-1);
g1(23,28)=1;
g1(23,4)=(-params(13));
g1(23,71)=(-1);
g1(24,27)=(-1);
g1(24,28)=(-1);
g1(24,29)=1;
g1(25,5)=(-params(14));
g1(25,30)=1;
g1(25,72)=1;
g1(26,6)=(-params(15));
g1(26,31)=1;
g1(26,73)=1;
g1(27,18)=(-(1/y(18)));
g1(27,44)=1;
g1(28,19)=(-(1/y(19)));
g1(28,45)=1;
g1(29,20)=(-(1/y(20)));
g1(29,46)=1;
g1(30,24)=(-(1/y(24)));
g1(30,47)=1;
g1(31,25)=(-(1/y(25)));
g1(31,48)=1;
g1(32,26)=(-(1/y(26)));
g1(32,49)=1;
g1(33,44)=(-1);
g1(33,47)=1;
g1(33,50)=1;
g1(34,35)=(-(1/y(35)));
g1(34,51)=1;
g1(35,39)=(-(1/y(39)));
g1(35,52)=1;
g1(36,43)=(-(1/y(43)));
g1(36,53)=1;
g1(37,40)=(-1);
g1(37,9)=1;
g1(37,45)=(-1);
g1(37,54)=1;
g1(38,40)=(-1);
g1(38,10)=1;
g1(38,46)=(-1);
g1(38,55)=1;
g1(39,40)=(-1);
g1(39,8)=1;
g1(39,44)=(-1);
g1(39,56)=1;
g1(40,40)=(-1);
g1(40,14)=1;
g1(40,50)=(-1);
g1(40,57)=1;
g1(41,16)=1;
g1(41,52)=(-1);
g1(41,58)=1;
g1(42,11)=1;
g1(42,47)=(-1);
g1(42,61)=1;
g1(43,12)=1;
g1(43,48)=(-1);
g1(43,59)=1;
g1(44,13)=1;
g1(44,49)=(-1);
g1(44,60)=1;
g1(45,15)=1;
g1(45,51)=(-1);
g1(45,62)=1;
g1(46,17)=1;
g1(46,53)=(-1);
g1(46,63)=1;

end
