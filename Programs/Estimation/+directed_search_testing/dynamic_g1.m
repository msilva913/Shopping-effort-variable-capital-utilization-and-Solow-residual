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
    T = directed_search_testing.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(45, 68);
g1(1,15)=(-1);
g1(1,17)=1;
g1(1,18)=(-(T(10)*T(14)));
g1(2,16)=(-1);
g1(2,19)=(-(T(10)*T(14)));
g1(3,17)=(-1);
g1(3,22)=1;
g1(3,29)=(-1);
g1(4,18)=(-(T(5)*T(10)+T(15)));
g1(4,27)=1;
g1(5,19)=(-(T(5)*T(10)+T(15)));
g1(5,28)=1;
g1(6,15)=(-T(16));
g1(6,18)=(-(T(10)*T(16)));
g1(6,22)=(-(1-T(16)));
g1(6,27)=1;
g1(6,34)=1;
g1(6,35)=1;
g1(7,16)=(-T(16));
g1(7,19)=(-(T(10)*T(16)));
g1(7,23)=(-(1-T(16)));
g1(7,28)=1;
g1(7,34)=1;
g1(7,36)=1;
g1(8,33)=1;
g1(8,34)=(-1);
g1(8,35)=(-1);
g1(8,38)=1;
g1(8,42)=1;
g1(9,32)=1;
g1(9,34)=(-1);
g1(9,36)=(-1);
g1(9,39)=1;
g1(9,43)=1;
g1(10,34)=(-1);
g1(10,37)=1/params(5);
g1(10,41)=(-1);
g1(10,48)=1;
g1(11,2)=(-params(3));
g1(11,6)=(-(1-params(3)));
g1(11,38)=1;
g1(11,8)=(1-params(10))*T(1);
g1(12,3)=(-params(3));
g1(12,7)=(-(1-params(3)));
g1(12,39)=1;
g1(12,9)=params(10)*T(1);
g1(13,18)=1;
g1(13,29)=(-1);
g1(13,47)=1;
g1(14,17)=1;
g1(14,19)=1;
g1(14,23)=(-1);
g1(14,47)=1;
g1(15,17)=1;
g1(15,1)=(-(T(17)*(-(params(14)*T(12)))));
g1(15,22)=(-(T(12)*T(17)));
g1(15,4)=(-(T(17)*(-(params(14)*(-T(12))))));
g1(15,26)=(-(T(17)*(-T(12))));
g1(15,5)=(-(T(17)*(-(params(14)*T(13)))));
g1(15,29)=(-(T(13)*T(17)));
g1(15,41)=1;
g1(16,20)=1;
g1(16,60)=(-params(2));
g1(16,63)=(-(params(2)*T(1)));
g1(16,41)=1;
g1(16,64)=(-1);
g1(17,21)=1;
g1(17,61)=(-params(2));
g1(17,62)=(-(params(2)*T(1)));
g1(17,41)=1;
g1(17,64)=(-1);
g1(18,20)=(-1);
g1(18,33)=1;
g1(18,42)=(-params(4));
g1(19,21)=(-1);
g1(19,32)=1;
g1(19,43)=(-params(4));
g1(20,20)=1;
g1(20,24)=(-(params(3)*params(12)));
g1(20,38)=params(3)*params(12);
g1(21,21)=1;
g1(21,25)=(-(params(3)*params(12)));
g1(21,39)=params(3)*params(12);
g1(22,15)=1;
g1(22,16)=(-1);
g1(22,52)=1;
g1(23,15)=(-(T(6)-(T(6)-1)));
g1(23,18)=(-(T(6)*T(10)*(1-T(5))-(T(6)-1)*T(10)));
g1(23,22)=1;
g1(23,35)=(-(params(9)*params(8)));
g1(23,38)=(-(T(3)*T(6)));
g1(23,42)=(-(T(3)*T(6)));
g1(23,44)=(-T(6));
g1(24,16)=(-(T(6)-(T(6)-1)));
g1(24,19)=(-(T(6)*T(10)*(1-T(5))-(T(6)-1)*T(10)));
g1(24,23)=1;
g1(24,36)=(-(params(9)*params(8)));
g1(24,39)=(-(T(3)*T(6)));
g1(24,43)=(-(T(3)*T(6)));
g1(24,45)=(-T(6));
g1(25,15)=(-(T(6)-(T(6)-1)));
g1(25,30)=1;
g1(25,35)=(-(params(9)*params(8)));
g1(25,38)=(-(T(3)*T(6)));
g1(25,44)=(-T(6));
g1(26,16)=(-(T(6)-(T(6)-1)));
g1(26,31)=1;
g1(26,36)=(-(params(9)*params(8)));
g1(26,39)=(-(T(3)*T(6)));
g1(26,45)=(-T(6));
g1(27,35)=(-(1-params(10)));
g1(27,36)=(-params(10));
g1(27,37)=1;
g1(28,38)=(-(1-params(10)));
g1(28,39)=(-params(10));
g1(28,40)=1;
g1(29,23)=1;
g1(29,24)=(-(1-params(10)));
g1(29,25)=(-params(10));
g1(30,22)=(-(1-params(10)));
g1(30,23)=(-params(10));
g1(30,26)=1;
g1(31,10)=(-params(15));
g1(31,44)=1;
g1(31,66)=(-1);
g1(32,11)=(-params(16));
g1(32,46)=1;
g1(32,65)=(-1);
g1(33,44)=(-1);
g1(33,45)=1;
g1(33,46)=(-1);
g1(34,12)=(-params(17));
g1(34,47)=1;
g1(34,67)=1;
g1(35,13)=(-(params(19)+params(20)));
g1(35,48)=1;
g1(35,68)=1;
g1(35,14)=(-(params(20)*(-params(19))));
g1(36,15)=1;
g1(36,22)=(-1);
g1(36,50)=1;
g1(37,16)=1;
g1(37,23)=(-1);
g1(37,51)=1;
g1(38,15)=1-params(10);
g1(38,16)=params(10);
g1(38,22)=(-(1-params(10)));
g1(38,23)=(-params(10));
g1(38,49)=1;
g1(39,16)=1;
g1(39,34)=(-1);
g1(39,56)=1;
g1(40,15)=1-params(10);
g1(40,16)=params(10);
g1(40,30)=(-(1-params(10)));
g1(40,31)=(-params(10));
g1(40,58)=1;
g1(41,37)=params(9);
g1(41,40)=1-params(9);
g1(41,49)=(-1);
g1(41,55)=1;
g1(42,37)=params(9);
g1(42,40)=1-params(9);
g1(42,57)=1;
g1(42,58)=(-1);
g1(43,37)=1;
g1(43,49)=(-1);
g1(43,53)=1;
g1(44,37)=(-1);
g1(44,49)=1;
g1(44,54)=1;
g1(44,56)=(-1);
g1(45,13)=(-1);
g1(45,59)=1;

end
