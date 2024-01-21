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
    T = BRS.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(33, 47);
g1(1,13)=T(33);
g1(1,19)=T(20);
g1(1,23)=(-(1-params(8)));
g1(2,8)=(-(params(8)/y(25)));
g1(2,20)=T(4);
g1(2,24)=T(37);
g1(2,25)=(-((-(params(8)*y(8)))/(y(25)*y(25))));
g1(3,9)=(-(params(8)*y(28)/y(26)));
g1(3,20)=T(4);
g1(3,24)=T(37);
g1(3,26)=(-((-(params(8)*y(28)*y(9)))/(y(26)*y(26))));
g1(3,28)=(-(params(8)*y(9)/y(26)));
g1(4,8)=(-1);
g1(4,13)=T(34);
g1(4,19)=T(21);
g1(4,20)=T(6);
g1(4,24)=T(38);
g1(4,27)=1;
g1(5,40)=(-(T(8)*(1-params(8))*T(12)));
g1(5,27)=y(28)*T(41);
g1(5,42)=(-(((1-params(8))*y(40)+y(43)*T(9))*T(12)*T(42)));
g1(5,28)=T(7);
g1(5,43)=(-(T(8)*T(9)*T(12)));
g1(6,40)=(-1);
g1(6,41)=1;
g1(7,8)=1;
g1(7,1)=(-(T(10)*T(30)));
g1(7,14)=(-(T(24)*T(35)));
g1(7,16)=(-(T(10)*T(24)));
g1(7,25)=(-(T(10)*T(23)*T(39)));
g1(8,9)=1;
g1(8,2)=(-(T(11)*T(32)));
g1(8,15)=(-(T(27)*T(36)));
g1(8,18)=(-(T(11)*T(27)));
g1(8,26)=(-(T(11)*T(26)*T(40)));
g1(9,9)=1;
g1(9,1)=T(9);
g1(9,11)=(-1);
g1(9,2)=T(9);
g1(9,12)=(-1);
g1(10,8)=(-((1-params(8))*params(7)/y(14)));
g1(10,14)=(-((-((1-params(8))*params(7)*y(8)))/(y(14)*y(14))));
g1(10,23)=1-params(8);
g1(11,1)=(-(T(28)/y(14)));
g1(11,14)=(-((-(y(1)*T(28)))/(y(14)*y(14))));
g1(11,21)=(-y(23))/(y(21)*y(21));
g1(11,23)=1/y(21);
g1(12,9)=(-((1-params(8))*params(7)/y(15)));
g1(12,15)=(-((-((1-params(8))*params(7)*y(9)))/(y(15)*y(15))));
g1(12,23)=(1-params(8))/y(28);
g1(12,28)=(-((1-params(8))*y(23)))/(y(28)*y(28));
g1(13,2)=(-(T(28)/y(15)));
g1(13,15)=(-((-(y(2)*T(28)))/(y(15)*y(15))));
g1(13,22)=(-y(23))/(y(22)*y(22));
g1(13,23)=1/y(22);
g1(14,13)=1;
g1(14,14)=(-1);
g1(14,15)=(-1);
g1(15,10)=1;
g1(15,11)=(-1);
g1(15,12)=(-1);
g1(16,24)=1;
g1(16,25)=(-1);
g1(16,26)=(-1);
g1(17,7)=1;
g1(17,8)=(-1);
g1(17,9)=(-params(15));
g1(18,3)=(-params(11));
g1(18,16)=1;
g1(18,44)=(-1);
g1(19,17)=1;
g1(19,4)=(-params(12));
g1(19,45)=(-1);
g1(20,16)=(-1);
g1(20,17)=(-1);
g1(20,18)=1;
g1(21,5)=(-params(13));
g1(21,19)=1;
g1(21,46)=1;
g1(22,6)=(-params(14));
g1(22,20)=1;
g1(22,47)=1;
g1(23,7)=(-(1/y(7)));
g1(23,29)=1;
g1(24,8)=(-(1/y(8)));
g1(24,30)=1;
g1(25,9)=(-(1/y(9)));
g1(25,31)=1;
g1(26,13)=(-(1/y(13)));
g1(26,32)=1;
g1(27,29)=(-1);
g1(27,32)=1;
g1(27,33)=1;
g1(28,24)=(-(1/y(24)));
g1(28,34)=1;
g1(29,30)=(-1);
g1(29,35)=1;
g1(30,31)=(-1);
g1(30,36)=1;
g1(31,29)=(-1);
g1(31,37)=1;
g1(32,33)=(-1);
g1(32,38)=1;
g1(33,28)=(-(1/y(28)));
g1(33,39)=1;

end
