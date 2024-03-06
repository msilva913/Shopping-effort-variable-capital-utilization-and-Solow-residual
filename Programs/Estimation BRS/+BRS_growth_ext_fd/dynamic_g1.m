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
    T = BRS_growth_ext_fd.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(43, 70);
g1(1,20)=T(22)*getPowerDeriv(y(20),T(3),1);
g1(1,24)=T(23);
g1(1,28)=(-(1-params(10)));
g1(2,15)=(-(params(10)/y(36)));
g1(2,25)=T(4);
g1(2,35)=T(39);
g1(2,36)=(-((-(params(10)*y(15)))/(y(36)*y(36))));
g1(3,16)=(-(params(10)*y(39)/y(37)));
g1(3,25)=T(4);
g1(3,35)=T(39);
g1(3,37)=(-((-(params(10)*y(39)*y(16)))/(y(37)*y(37))));
g1(3,39)=(-(params(10)*y(16)/y(37)));
g1(4,15)=(-1);
g1(4,20)=T(22)*getPowerDeriv(y(20),1+T(3),1)/(1+T(3));
g1(4,24)=T(24);
g1(4,25)=T(6);
g1(4,35)=exp(y(25))*getPowerDeriv(y(35),T(5),1)/T(5);
g1(4,38)=1;
g1(5,39)=(-(T(9)*1/(1-params(10))));
g1(5,40)=1;
g1(5,41)=(-(y(39)/(1-params(10))*(-params(6))*getPowerDeriv(1-params(6)*(y(41)-params(7)/params(8)),(-1),1)));
g1(6,57)=(-(y(59)*T(26)));
g1(6,59)=(-(y(57)*T(26)));
g1(6,61)=(-(T(26)*(-y(64))));
g1(6,38)=(-(T(11)*T(7)*T(16)*(-y(63))/(y(38)*y(38))*T(40)));
g1(6,63)=(-(T(11)*T(7)*T(16)*T(40)*1/y(38)));
g1(6,40)=1;
g1(6,64)=(-((1-y(61)+y(65)*params(6)*(y(65)-params(7)/params(8))-T(10))*T(26)));
g1(6,65)=T(41);
g1(6,66)=(-(T(11)*T(43)));
g1(7,58)=(-(y(60)*T(26)));
g1(7,60)=(-(y(58)*T(26)));
g1(7,62)=(-(T(26)*(-y(64))));
g1(7,38)=(-(T(12)*T(7)*T(16)*(-y(63))/(y(38)*y(38))*T(40)));
g1(7,63)=(-(T(12)*T(7)*T(16)*T(40)*1/y(38)));
g1(7,40)=1;
g1(7,64)=(-((1-y(62)+y(65)*params(6)*(y(65)-params(7)/params(8))-T(10))*T(26)));
g1(7,65)=T(41);
g1(7,66)=(-(T(12)*T(43)));
g1(8,16)=(-(exp(y(42))*1/y(1)));
g1(8,1)=(-(exp(y(42))*(-y(16))/(y(1)*y(1))));
g1(8,41)=1;
g1(8,42)=(-(y(16)/y(1)*exp(y(42))));
g1(9,26)=(-1);
g1(9,33)=y(40);
g1(9,40)=y(33);
g1(10,27)=(-1);
g1(10,34)=y(40);
g1(10,40)=y(34);
g1(11,29)=(-(T(1)+T(15)+T(27)*2*(y(29)-1)));
g1(11,31)=1;
g1(12,30)=(-(T(1)+T(15)+T(27)*2*(y(30)-1)));
g1(12,32)=1;
g1(13,29)=(-(params(5)*(T(1)+T(15))));
g1(13,33)=1;
g1(14,30)=(-(params(5)*(T(1)+T(15))));
g1(14,34)=1;
g1(15,15)=1;
g1(15,2)=(-(T(13)*T(30)*y(29)*T(37)));
g1(15,21)=(-(T(32)*getPowerDeriv(y(21),(1-params(10))*params(9),1)));
g1(15,29)=(-(T(13)*T(30)*y(2)*T(37)));
g1(15,36)=(-(T(13)*T(31)*T(29)*T(20)*T(17)*getPowerDeriv(y(36),params(10),1)));
g1(15,42)=(-(T(13)*T(31)*T(28)*T(42)));
g1(16,16)=1;
g1(16,3)=(-(T(14)*T(34)*y(30)*T(38)));
g1(16,22)=(-(T(36)*getPowerDeriv(y(22),(1-params(10))*params(9),1)));
g1(16,23)=(-(T(14)*T(36)));
g1(16,30)=(-(T(14)*T(34)*y(3)*T(38)));
g1(16,37)=(-(T(14)*T(35)*T(29)*exp(y(23))*T(21)*T(18)*getPowerDeriv(y(37),params(10),1)));
g1(16,42)=(-(T(14)*T(35)*T(33)*T(42)));
g1(17,16)=exp(y(42));
g1(17,2)=1-y(31);
g1(17,18)=(-exp(y(42)));
g1(17,3)=1-y(32);
g1(17,19)=(-exp(y(42)));
g1(17,31)=(-y(2));
g1(17,32)=(-y(3));
g1(17,41)=(-(T(8)*2*(y(41)-params(7)/params(8))));
g1(17,42)=y(16)*exp(y(42))-exp(y(42))*(y(18)+y(19));
g1(18,15)=(-((1-params(10))*params(9)/y(21)));
g1(18,21)=(-((-((1-params(10))*params(9)*y(15)))/(y(21)*y(21))));
g1(18,28)=1-params(10);
g1(19,15)=(-(exp(y(42))*params(8)*(T(1)+T(15))/(y(29)*y(2))));
g1(19,2)=(-(exp(y(42))*(-(y(29)*y(15)*params(8)*(T(1)+T(15))))/(y(29)*y(2)*y(29)*y(2))));
g1(19,26)=1-params(10);
g1(19,29)=(-(exp(y(42))*(-(y(2)*y(15)*params(8)*(T(1)+T(15))))/(y(29)*y(2)*y(29)*y(2))));
g1(19,42)=(-(exp(y(42))*y(15)*params(8)*(T(1)+T(15))/(y(29)*y(2))));
g1(20,16)=(-((1-params(10))*params(9)/y(22)));
g1(20,22)=(-((-((1-params(10))*params(9)*y(16)))/(y(22)*y(22))));
g1(20,28)=(1-params(10))/y(39);
g1(20,39)=(-((1-params(10))*y(28)))/(y(39)*y(39));
g1(21,16)=(-(exp(y(42))*params(8)*(T(1)+T(15))/(y(29)*y(3))));
g1(21,3)=(-(exp(y(42))*(-(y(29)*y(16)*params(8)*(T(1)+T(15))))/(y(29)*y(3)*y(29)*y(3))));
g1(21,26)=1-params(10);
g1(21,29)=(-(exp(y(42))*(-(y(3)*y(16)*params(8)*(T(1)+T(15))))/(y(29)*y(3)*y(29)*y(3))));
g1(21,42)=(-(exp(y(42))*y(16)*params(8)*(T(1)+T(15))/(y(29)*y(3))));
g1(22,20)=1;
g1(22,21)=(-1);
g1(22,22)=(-1);
g1(23,17)=1;
g1(23,18)=(-1);
g1(23,19)=(-1);
g1(24,35)=1;
g1(24,36)=(-1);
g1(24,37)=(-1);
g1(25,14)=1;
g1(25,15)=(-1);
g1(25,16)=(-params(17));
g1(26,7)=(-params(13));
g1(26,43)=1;
g1(26,67)=(-1);
g1(27,42)=1;
g1(27,43)=(-(1/(1-params(8)*(T(1)+T(15)))));
g1(28,4)=(-params(14));
g1(28,23)=1;
g1(28,68)=(-1);
g1(29,5)=(-params(15));
g1(29,24)=1;
g1(29,69)=1;
g1(30,6)=(-params(16));
g1(30,25)=1;
g1(30,70)=1;
g1(31,14)=(-(1/y(14)));
g1(31,44)=1;
g1(32,15)=(-(1/y(15)));
g1(32,45)=1;
g1(33,16)=(-(1/y(16)));
g1(33,46)=1;
g1(34,20)=(-(1/y(20)));
g1(34,47)=1;
g1(35,44)=(-1);
g1(35,47)=1;
g1(35,48)=1;
g1(36,35)=(-(1/y(35)));
g1(36,49)=1;
g1(37,39)=(-(1/y(39)));
g1(37,50)=1;
g1(38,42)=(-1);
g1(38,9)=1;
g1(38,45)=(-1);
g1(38,51)=1;
g1(39,42)=(-1);
g1(39,10)=1;
g1(39,46)=(-1);
g1(39,52)=1;
g1(40,42)=(-1);
g1(40,8)=1;
g1(40,44)=(-1);
g1(40,53)=1;
g1(41,42)=(-1);
g1(41,12)=1;
g1(41,48)=(-1);
g1(41,54)=1;
g1(42,13)=1;
g1(42,50)=(-1);
g1(42,55)=1;
g1(43,11)=1;
g1(43,47)=(-1);
g1(43,56)=1;

end
