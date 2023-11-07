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
g1 = zeros(45, 71);
g1(1,12)=(-1);
g1(1,14)=1;
g1(1,15)=(-(T(7)*(1-T(5))));
g1(2,13)=(-1);
g1(2,16)=(-(T(7)*(1-T(5))));
g1(3,14)=(-1);
g1(3,19)=1;
g1(3,22)=(-1);
g1(4,15)=(-(T(4)*T(7)+T(9)));
g1(4,20)=1;
g1(5,16)=(-(T(4)*T(7)+T(9)));
g1(5,21)=1;
g1(6,19)=(-1);
g1(6,20)=1;
g1(6,28)=1;
g1(6,29)=1;
g1(7,21)=1;
g1(7,25)=(-1);
g1(7,28)=1;
g1(7,30)=1;
g1(8,25)=(-1);
g1(8,28)=1;
g1(8,31)=1;
g1(9,14)=1;
g1(9,22)=params(6);
g1(9,28)=(-1);
g1(9,32)=1/params(5);
g1(9,47)=1;
g1(10,1)=(-params(3));
g1(10,3)=(-(1-params(3)));
g1(10,33)=1;
g1(10,5)=T(1);
g1(11,2)=(-params(3));
g1(11,4)=(-(1-params(3)));
g1(11,34)=1;
g1(11,6)=T(1);
g1(12,15)=T(7)*(1/params(11)+T(5)-1);
g1(12,22)=(-1);
g1(12,45)=1;
g1(13,16)=1;
g1(13,31)=(-1);
g1(13,44)=(-1);
g1(14,14)=(-1);
g1(14,22)=(-params(6));
g1(14,36)=(-1);
g1(15,17)=1;
g1(15,57)=(-params(2));
g1(15,59)=(-(params(2)*T(1)));
g1(15,60)=params(2)*T(1);
g1(15,63)=params(2)*T(1);
g1(15,36)=1;
g1(15,65)=(-1);
g1(15,66)=params(2)*T(1);
g1(16,18)=1;
g1(16,58)=(-params(2));
g1(16,61)=params(2)*T(1);
g1(16,62)=(-(params(2)*T(1)));
g1(16,64)=params(2)*T(1);
g1(16,36)=1;
g1(16,65)=(-1);
g1(16,67)=params(2)*T(1);
g1(17,17)=1;
g1(17,19)=(-1);
g1(17,20)=1;
g1(17,33)=1;
g1(17,38)=1+params(4);
g1(18,18)=1;
g1(18,21)=1;
g1(18,25)=(-1);
g1(18,34)=1;
g1(18,39)=1+params(4);
g1(19,17)=1;
g1(19,26)=(-(params(3)*params(12)));
g1(19,33)=params(3)*params(12);
g1(20,18)=1;
g1(20,27)=(-(params(3)*params(12)));
g1(20,34)=params(3)*params(12);
g1(21,12)=1;
g1(21,13)=(-1);
g1(21,51)=1;
g1(22,12)=(-1);
g1(22,15)=(-(T(7)*(1-T(4))));
g1(22,19)=1;
g1(22,29)=(-T(3));
g1(22,33)=(-T(2));
g1(22,38)=(-T(2));
g1(22,41)=(-1);
g1(23,13)=(-1);
g1(23,16)=(-(T(7)*(1-T(4))));
g1(23,25)=1;
g1(23,30)=(-T(3));
g1(23,34)=(-T(2));
g1(23,39)=(-T(2));
g1(23,42)=(-1);
g1(24,12)=(-1);
g1(24,23)=1;
g1(24,29)=(-T(3));
g1(24,33)=(-T(2));
g1(24,41)=(-1);
g1(25,13)=(-1);
g1(25,24)=1;
g1(25,30)=(-T(3));
g1(25,34)=(-T(2));
g1(25,42)=(-1);
g1(26,29)=(-((1-params(10))*(1-T(8))));
g1(26,30)=(-(params(10)*(1-T(8))));
g1(26,31)=(-T(8));
g1(26,32)=1;
g1(27,33)=(-(1-params(10)));
g1(27,34)=(-params(10));
g1(27,35)=1;
g1(28,25)=1;
g1(28,26)=(-(1-params(10)));
g1(28,27)=(-params(10));
g1(29,15)=(-((1-params(10))*T(7)));
g1(29,16)=(-(params(10)*T(7)));
g1(29,38)=(-((1-params(10))*T(2)));
g1(29,39)=(-(params(10)*T(2)));
g1(29,40)=1;
g1(30,19)=1-params(10)-params(9);
g1(30,37)=(-(1-params(9)-params(10)));
g1(31,7)=(-params(14));
g1(31,41)=1;
g1(31,69)=(-1);
g1(32,8)=(-params(15));
g1(32,43)=1;
g1(32,68)=(-1);
g1(33,41)=(-1);
g1(33,42)=1;
g1(33,43)=(-1);
g1(34,9)=(-params(16));
g1(34,46)=1;
g1(34,70)=(-1);
g1(35,45)=1;
g1(35,46)=1;
g1(36,44)=1;
g1(36,46)=(-1);
g1(37,10)=(-(params(18)+params(19)));
g1(37,47)=1;
g1(37,71)=1;
g1(37,11)=(-(params(19)*(-params(18))));
g1(38,12)=1;
g1(38,19)=(-1);
g1(38,49)=1;
g1(39,13)=1;
g1(39,25)=(-1);
g1(39,50)=1;
g1(40,12)=1-params(10);
g1(40,13)=params(10);
g1(40,19)=(-(1-params(10)));
g1(40,25)=(-params(10));
g1(40,48)=1;
g1(41,12)=1-params(10);
g1(41,13)=params(10);
g1(41,23)=(-(1-params(10)));
g1(41,24)=(-params(10));
g1(41,55)=1;
g1(42,32)=params(9);
g1(42,35)=1-params(9);
g1(42,48)=(-1);
g1(42,53)=1;
g1(43,32)=params(9);
g1(43,35)=1-params(9);
g1(43,54)=1;
g1(43,55)=(-1);
g1(44,32)=1;
g1(44,48)=(-1);
g1(44,52)=1;
g1(45,10)=(-1);
g1(45,56)=1;

end
