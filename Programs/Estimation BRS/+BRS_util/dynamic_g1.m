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
    T = BRS_util.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(45, 71);
g1(1,23)=T(17)*getPowerDeriv(y(23),T(2),1);
g1(1,29)=T(18);
g1(1,33)=(-(1-params(8)));
g1(2,18)=(-(params(8)/y(35)));
g1(2,30)=T(3);
g1(2,34)=T(31);
g1(2,35)=(-((-(params(8)*y(18)))/(y(35)*y(35))));
g1(3,19)=(-(params(8)*y(38)/y(36)));
g1(3,30)=T(3);
g1(3,34)=T(31);
g1(3,36)=(-((-(params(8)*y(38)*y(19)))/(y(36)*y(36))));
g1(3,38)=(-(params(8)*y(19)/y(36)));
g1(4,18)=(-1);
g1(4,23)=T(17)*getPowerDeriv(y(23),1+T(2),1)/(1+T(2));
g1(4,29)=T(19);
g1(4,30)=T(5);
g1(4,34)=exp(y(30))*getPowerDeriv(y(34),T(4),1)/T(4);
g1(4,37)=1;
g1(5,62)=(-(T(8)*T(7)*params(2)*(1-params(8))));
g1(5,37)=y(38)*getPowerDeriv(y(37),(-params(1)),1);
g1(5,64)=(-(T(8)*T(21)*getPowerDeriv(y(64),(-params(1)),1)));
g1(5,38)=T(6);
g1(5,65)=(-(T(8)*T(7)*params(2)*T(20)));
g1(5,66)=(-(T(7)*T(21)*exp(y(66))*getPowerDeriv(exp(y(66)),(-params(1)),1)));
g1(6,62)=(-1);
g1(6,63)=1;
g1(7,18)=1;
g1(7,1)=(-(T(9)*T(24)*getPowerDeriv(y(1),T(11),1)));
g1(7,24)=(-(T(26)*getPowerDeriv(y(24),(1-params(8))*params(7),1)));
g1(7,26)=(-(T(9)*T(26)));
g1(7,35)=(-(T(9)*T(25)*T(23)*exp(y(26))*T(15)*T(32)));
g1(7,39)=(-(T(9)*T(25)*exp(y(26))*T(15)*T(22)*T(34)));
g1(8,19)=1;
g1(8,2)=(-(T(10)*T(28)*getPowerDeriv(y(2),T(11),1)));
g1(8,25)=(-(T(30)*getPowerDeriv(y(25),(1-params(8))*params(7),1)));
g1(8,28)=(-(T(10)*T(30)));
g1(8,36)=(-(T(10)*T(29)*T(23)*exp(y(28))*T(16)*T(33)));
g1(8,39)=(-(T(10)*T(29)*exp(y(28))*T(16)*T(27)*T(34)));
g1(9,19)=exp(y(39));
g1(9,1)=T(20);
g1(9,21)=(-exp(y(39)));
g1(9,2)=T(20);
g1(9,22)=(-exp(y(39)));
g1(9,39)=y(19)*exp(y(39))-exp(y(39))*(y(21)+y(22));
g1(10,18)=(-((1-params(8))*params(7)/y(24)));
g1(10,24)=(-((-((1-params(8))*params(7)*y(18)))/(y(24)*y(24))));
g1(10,33)=1-params(8);
g1(11,18)=(-(exp(y(39))*T(11)/y(1)));
g1(11,1)=(-(exp(y(39))*(-(y(18)*T(11)))/(y(1)*y(1))));
g1(11,31)=1-params(8);
g1(11,39)=(-(exp(y(39))*y(18)*T(11)/y(1)));
g1(12,19)=(-((1-params(8))*params(7)/y(25)));
g1(12,25)=(-((-((1-params(8))*params(7)*y(19)))/(y(25)*y(25))));
g1(12,33)=(1-params(8))/y(38);
g1(12,38)=(-((1-params(8))*y(33)))/(y(38)*y(38));
g1(13,19)=(-(exp(y(39))*T(11)/y(2)));
g1(13,2)=(-(exp(y(39))*(-(y(19)*T(11)))/(y(2)*y(2))));
g1(13,32)=(1-params(8))/y(38);
g1(13,38)=(-((1-params(8))*y(32)))/(y(38)*y(38));
g1(13,39)=(-(exp(y(39))*y(19)*T(11)/y(2)));
g1(14,23)=1;
g1(14,24)=(-1);
g1(14,25)=(-1);
g1(15,20)=1;
g1(15,21)=(-1);
g1(15,22)=(-1);
g1(16,34)=1;
g1(16,35)=(-1);
g1(16,36)=(-1);
g1(17,17)=1;
g1(17,18)=(-1);
g1(17,19)=(-params(16));
g1(18,35)=(-T(32));
g1(18,40)=1;
g1(19,36)=(-T(33));
g1(19,41)=1;
g1(20,18)=(-(y(40)*y(19)/((y(18)+y(19))*(y(18)+y(19)))+y(41)*(-y(19))/((y(18)+y(19))*(y(18)+y(19)))));
g1(20,19)=(-(y(40)*(-y(18))/((y(18)+y(19))*(y(18)+y(19)))+y(41)*y(18)/((y(18)+y(19))*(y(18)+y(19)))));
g1(20,40)=(-(y(18)/(y(18)+y(19))));
g1(20,41)=(-(y(19)/(y(18)+y(19))));
g1(20,42)=1;
g1(21,7)=(-params(11));
g1(21,39)=1;
g1(21,67)=(-1);
g1(22,3)=(-params(12));
g1(22,26)=1;
g1(22,68)=(-1);
g1(23,27)=1;
g1(23,4)=(-params(13));
g1(23,69)=(-1);
g1(24,26)=(-1);
g1(24,27)=(-1);
g1(24,28)=1;
g1(25,5)=(-params(14));
g1(25,29)=1;
g1(25,70)=1;
g1(26,6)=(-params(15));
g1(26,30)=1;
g1(26,71)=1;
g1(27,17)=(-(1/y(17)));
g1(27,43)=1;
g1(28,18)=(-(1/y(18)));
g1(28,44)=1;
g1(29,19)=(-(1/y(19)));
g1(29,45)=1;
g1(30,23)=(-(1/y(23)));
g1(30,46)=1;
g1(31,24)=(-(1/y(24)));
g1(31,47)=1;
g1(32,25)=(-(1/y(25)));
g1(32,48)=1;
g1(33,43)=(-1);
g1(33,46)=1;
g1(33,49)=1;
g1(34,34)=(-(1/y(34)));
g1(34,50)=1;
g1(35,38)=(-(1/y(38)));
g1(35,51)=1;
g1(36,42)=(-(1/y(42)));
g1(36,52)=1;
g1(37,39)=(-1);
g1(37,9)=1;
g1(37,44)=(-1);
g1(37,53)=1;
g1(38,39)=(-1);
g1(38,10)=1;
g1(38,45)=(-1);
g1(38,54)=1;
g1(39,39)=(-1);
g1(39,8)=1;
g1(39,43)=(-1);
g1(39,55)=1;
g1(40,39)=(-1);
g1(40,14)=1;
g1(40,49)=(-1);
g1(40,56)=1;
g1(41,15)=1;
g1(41,51)=(-1);
g1(41,57)=1;
g1(42,11)=1;
g1(42,46)=(-1);
g1(42,60)=1;
g1(43,12)=1;
g1(43,47)=(-1);
g1(43,58)=1;
g1(44,13)=1;
g1(44,48)=(-1);
g1(44,59)=1;
g1(45,16)=1;
g1(45,52)=(-1);
g1(45,61)=1;

end
