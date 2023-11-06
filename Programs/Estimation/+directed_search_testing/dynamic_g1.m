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
g1 = zeros(45, 73);
g1(1,13)=(-1);
g1(1,15)=1;
g1(1,16)=(-(T(7)*(1-T(5))));
g1(2,14)=(-1);
g1(2,17)=(-(T(7)*(1-T(5))));
g1(3,15)=(-1);
g1(3,20)=1;
g1(3,23)=(-1);
g1(4,16)=(-(T(4)*T(7)+T(9)));
g1(4,21)=1;
g1(5,17)=(-(T(4)*T(7)+T(9)));
g1(5,22)=1;
g1(6,20)=(-1);
g1(6,21)=1;
g1(6,29)=1;
g1(6,30)=1;
g1(7,22)=1;
g1(7,26)=(-1);
g1(7,29)=1;
g1(7,31)=1;
g1(8,26)=(-1);
g1(8,29)=1;
g1(8,32)=1;
g1(9,15)=1;
g1(9,23)=params(6);
g1(9,29)=(-1);
g1(9,33)=1/params(5);
g1(9,48)=1;
g1(10,1)=(-params(3));
g1(10,3)=(-(1-params(3)));
g1(10,34)=1;
g1(10,5)=T(1);
g1(11,2)=(-params(3));
g1(11,4)=(-(1-params(3)));
g1(11,35)=1;
g1(11,6)=T(1);
g1(12,16)=T(7)*(1/params(11)+T(5)-1);
g1(12,23)=(-1);
g1(12,46)=1;
g1(13,17)=1;
g1(13,32)=(-1);
g1(13,45)=(-1);
g1(14,15)=(-1);
g1(14,23)=(-params(6));
g1(14,37)=(-1);
g1(15,18)=1;
g1(15,58)=(-params(2));
g1(15,60)=(-(params(2)*T(1)));
g1(15,61)=params(2)*T(1);
g1(15,64)=params(2)*T(1);
g1(15,37)=1;
g1(15,66)=(-1);
g1(15,67)=params(2)*T(1);
g1(16,19)=1;
g1(16,59)=(-params(2));
g1(16,62)=params(2)*T(1);
g1(16,63)=(-(params(2)*T(1)));
g1(16,65)=params(2)*T(1);
g1(16,37)=1;
g1(16,66)=(-1);
g1(16,68)=params(2)*T(1);
g1(17,18)=1;
g1(17,20)=(-1);
g1(17,21)=1;
g1(17,34)=1;
g1(17,39)=1+params(4);
g1(18,19)=1;
g1(18,22)=1;
g1(18,26)=(-1);
g1(18,35)=1;
g1(18,40)=1+params(4);
g1(19,18)=1;
g1(19,27)=(-(params(3)*params(12)));
g1(19,34)=params(3)*params(12);
g1(20,19)=1;
g1(20,28)=(-(params(3)*params(12)));
g1(20,35)=params(3)*params(12);
g1(21,13)=1;
g1(21,14)=(-1);
g1(21,52)=1;
g1(22,13)=(-1);
g1(22,16)=(-(T(7)*(1-T(4))));
g1(22,20)=1;
g1(22,30)=(-T(3));
g1(22,34)=(-T(2));
g1(22,39)=(-T(2));
g1(22,42)=(-1);
g1(23,14)=(-1);
g1(23,17)=(-(T(7)*(1-T(4))));
g1(23,26)=1;
g1(23,31)=(-T(3));
g1(23,35)=(-T(2));
g1(23,40)=(-T(2));
g1(23,43)=(-1);
g1(24,13)=(-1);
g1(24,24)=1;
g1(24,30)=(-T(3));
g1(24,34)=(-T(2));
g1(24,42)=(-1);
g1(25,14)=(-1);
g1(25,25)=1;
g1(25,31)=(-T(3));
g1(25,35)=(-T(2));
g1(25,43)=(-1);
g1(26,30)=(-((1-params(10))*(1-T(8))));
g1(26,31)=(-(params(10)*(1-T(8))));
g1(26,32)=(-T(8));
g1(26,33)=1;
g1(27,34)=(-(1-params(10)));
g1(27,35)=(-params(10));
g1(27,36)=1;
g1(28,26)=1;
g1(28,27)=(-(1-params(10)));
g1(28,28)=(-params(10));
g1(29,16)=(-((1-params(10))*T(7)));
g1(29,17)=(-(params(10)*T(7)));
g1(29,39)=(-((1-params(10))*T(2)));
g1(29,40)=(-(params(10)*T(2)));
g1(29,41)=1;
g1(30,20)=1-params(10)-params(9);
g1(30,38)=(-(1-params(9)-params(10)));
g1(31,7)=(-params(14));
g1(31,42)=1;
g1(31,70)=(-1);
g1(32,8)=(-params(15));
g1(32,44)=1;
g1(32,69)=(-1);
g1(33,42)=(-1);
g1(33,43)=1;
g1(33,44)=(-1);
g1(34,10)=(-params(16));
g1(34,47)=1;
g1(34,71)=(-1);
g1(35,46)=1;
g1(35,47)=1;
g1(36,9)=(-params(17));
g1(36,45)=1;
g1(36,72)=(-1);
g1(37,11)=(-(params(18)+params(19)));
g1(37,48)=1;
g1(37,73)=1;
g1(37,12)=(-(params(19)*(-params(18))));
g1(38,13)=1;
g1(38,20)=(-1);
g1(38,50)=1;
g1(39,14)=1;
g1(39,26)=(-1);
g1(39,51)=1;
g1(40,13)=1-params(10);
g1(40,14)=params(10);
g1(40,20)=(-(1-params(10)));
g1(40,26)=(-params(10));
g1(40,49)=1;
g1(41,13)=1-params(10);
g1(41,14)=params(10);
g1(41,24)=(-(1-params(10)));
g1(41,25)=(-params(10));
g1(41,56)=1;
g1(42,33)=params(9);
g1(42,36)=1-params(9);
g1(42,49)=(-1);
g1(42,54)=1;
g1(43,33)=params(9);
g1(43,36)=1-params(9);
g1(43,55)=1;
g1(43,56)=(-1);
g1(44,33)=1;
g1(44,49)=(-1);
g1(44,53)=1;
g1(45,11)=(-1);
g1(45,57)=1;

end
