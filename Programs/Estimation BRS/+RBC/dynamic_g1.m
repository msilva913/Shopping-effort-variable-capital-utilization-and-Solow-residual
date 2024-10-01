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
    T = RBC.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(38, 62);
g1(1,23)=T(15)*getPowerDeriv(y(23),T(1),1);
g1(1,29)=T(16);
g1(1,32)=(-1);
g1(2,17)=(-1);
g1(2,23)=T(15)*getPowerDeriv(y(23),1+T(1),1)/(1+T(1));
g1(2,29)=T(17);
g1(2,33)=1;
g1(3,54)=(-(T(4)*params(2)*T(3)));
g1(3,33)=y(34)*getPowerDeriv(y(33),(-params(1)),1);
g1(3,56)=(-(T(4)*params(2)*(y(54)+y(57)*T(18))*getPowerDeriv(y(56),(-params(1)),1)));
g1(3,34)=T(2);
g1(3,57)=(-(T(4)*T(3)*params(2)*T(18)));
g1(3,58)=(-(T(3)*params(2)*(y(54)+y(57)*T(18))*exp(y(58))*getPowerDeriv(exp(y(58)),(-params(1)),1)));
g1(4,54)=(-1);
g1(4,55)=1;
g1(5,17)=1;
g1(5,1)=(-(T(7)*T(21)*getPowerDeriv(y(1),T(13),1)));
g1(5,24)=(-(T(23)*T(28)));
g1(5,26)=(-(T(7)*T(23)));
g1(5,35)=(-(T(7)*T(22)*T(19)*T(30)));
g1(6,18)=1;
g1(6,2)=(-(T(10)*T(25)*getPowerDeriv(y(2),T(13),1)));
g1(6,25)=(-(T(27)*T(29)));
g1(6,28)=(-(T(10)*T(27)));
g1(6,35)=(-(T(10)*T(26)*T(24)*T(30)));
g1(7,18)=exp(y(35));
g1(7,1)=T(18);
g1(7,21)=(-exp(y(35)));
g1(7,2)=T(18);
g1(7,22)=(-exp(y(35)));
g1(7,35)=exp(y(35))*y(18)-exp(y(35))*(y(21)+y(22));
g1(8,17)=(-(params(7)/y(24)));
g1(8,24)=(-((-(params(7)*y(17)))/(y(24)*y(24))));
g1(8,32)=1;
g1(9,17)=(-(exp(y(35))*T(13)/y(1)));
g1(9,1)=(-(exp(y(35))*(-(y(17)*T(13)))/(y(1)*y(1))));
g1(9,30)=1;
g1(9,35)=(-(exp(y(35))*y(17)*T(13)/y(1)));
g1(10,18)=(-(params(7)/y(25)));
g1(10,25)=(-((-(params(7)*y(18)))/(y(25)*y(25))));
g1(10,32)=1/y(34);
g1(10,34)=(-y(32))/(y(34)*y(34));
g1(11,18)=(-(exp(y(35))*T(13)/y(2)));
g1(11,2)=(-(exp(y(35))*(-(y(18)*T(13)))/(y(2)*y(2))));
g1(11,31)=1/y(34);
g1(11,34)=(-y(31))/(y(34)*y(34));
g1(11,35)=(-(exp(y(35))*y(18)*T(13)/y(2)));
g1(12,23)=1;
g1(12,24)=(-1);
g1(12,25)=(-1);
g1(13,20)=1;
g1(13,21)=(-1);
g1(13,22)=(-1);
g1(14,16)=1;
g1(14,17)=(-1);
g1(14,18)=(-params(12));
g1(15,16)=(-(T(5)*(y(17)*(-y(17))/(y(16)*y(16))/T(8)+y(18)*(-y(18))/(y(16)*y(16))/T(11))));
g1(15,17)=(-(T(5)*(y(17)/y(16)+y(17)*1/y(16))/T(8)));
g1(15,18)=(-(T(5)*(y(18)/y(16)+y(18)*1/y(16))/T(11)));
g1(15,19)=1;
g1(15,1)=(-(T(5)*(-(y(17)*y(17)/y(16)*T(7)*getPowerDeriv(y(1),1-params(7),1)))/(T(8)*T(8))));
g1(15,2)=(-(T(5)*(-(y(18)*y(18)/y(16)*T(10)*getPowerDeriv(y(2),1-params(7),1)))/(T(11)*T(11))));
g1(15,24)=(-(T(5)*(-(y(17)*y(17)/y(16)*T(6)*T(28)))/(T(8)*T(8))));
g1(15,25)=(-(T(5)*(-(y(18)*y(18)/y(16)*T(9)*T(29)))/(T(11)*T(11))));
g1(15,35)=(-(T(12)*exp(y(35))*getPowerDeriv(exp(y(35)),1-params(7),1)));
g1(16,6)=(-params(8));
g1(16,35)=1;
g1(16,59)=(-1);
g1(17,3)=(-params(9));
g1(17,26)=1;
g1(17,60)=(-1);
g1(18,27)=1;
g1(18,4)=(-params(10));
g1(18,61)=(-1);
g1(19,26)=(-1);
g1(19,27)=(-1);
g1(19,28)=1;
g1(20,5)=(-params(11));
g1(20,29)=1;
g1(20,62)=1;
g1(21,16)=(-(1/y(16)));
g1(21,36)=1;
g1(22,17)=(-(1/y(17)));
g1(22,37)=1;
g1(23,18)=(-(1/y(18)));
g1(23,38)=1;
g1(24,23)=(-(1/y(23)));
g1(24,39)=1;
g1(25,24)=(-(1/y(24)));
g1(25,40)=1;
g1(26,25)=(-(1/y(25)));
g1(26,41)=1;
g1(27,36)=(-1);
g1(27,39)=1;
g1(27,42)=1;
g1(28,19)=(-(1/y(19)));
g1(28,43)=1;
g1(29,34)=(-(1/y(34)));
g1(29,44)=1;
g1(30,35)=(-1);
g1(30,8)=1;
g1(30,37)=(-1);
g1(30,45)=1;
g1(31,35)=(-1);
g1(31,9)=1;
g1(31,38)=(-1);
g1(31,46)=1;
g1(32,35)=(-1);
g1(32,7)=1;
g1(32,36)=(-1);
g1(32,47)=1;
g1(33,35)=(-1);
g1(33,13)=1;
g1(33,42)=(-1);
g1(33,48)=1;
g1(34,35)=(-params(7));
g1(34,14)=1;
g1(34,43)=(-1);
g1(34,49)=1;
g1(35,15)=1;
g1(35,44)=(-1);
g1(35,50)=1;
g1(36,10)=1;
g1(36,39)=(-1);
g1(36,53)=1;
g1(37,11)=1;
g1(37,40)=(-1);
g1(37,51)=1;
g1(38,12)=1;
g1(38,41)=(-1);
g1(38,52)=1;

end
