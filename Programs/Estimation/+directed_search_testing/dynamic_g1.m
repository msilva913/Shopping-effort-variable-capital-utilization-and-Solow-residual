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
g1 = zeros(42, 68);
g1(1,13)=(-1);
g1(1,15)=1;
g1(1,16)=(-(T(7)*(1-T(5))));
g1(2,14)=(-1);
g1(2,17)=(-(T(7)*(1-T(5))));
g1(3,15)=(-1);
g1(3,18)=1;
g1(3,21)=(-1);
g1(4,16)=(-(T(4)*T(7)+T(9)));
g1(4,19)=1;
g1(5,17)=(-(T(4)*T(7)+T(9)));
g1(5,20)=1;
g1(6,18)=(-1);
g1(6,19)=1;
g1(6,27)=1;
g1(6,28)=1;
g1(7,20)=1;
g1(7,24)=(-1);
g1(7,27)=1;
g1(7,29)=1;
g1(8,24)=(-1);
g1(8,27)=1;
g1(8,30)=1;
g1(9,15)=1;
g1(9,21)=params(6);
g1(9,27)=(-1);
g1(9,31)=1/params(5);
g1(9,45)=1;
g1(10,1)=(-params(3));
g1(10,3)=(-(1-params(3)));
g1(10,32)=1;
g1(10,5)=T(1);
g1(11,2)=(-params(3));
g1(11,4)=(-(1-params(3)));
g1(11,33)=1;
g1(11,6)=T(1);
g1(12,16)=1;
g1(12,21)=(-1);
g1(12,43)=1;
g1(13,17)=1;
g1(13,30)=(-1);
g1(13,41)=(-1);
g1(14,15)=(-1);
g1(14,21)=(-params(6));
g1(14,35)=(-1);
g1(15,55)=(-(params(2)*T(1)));
g1(15,56)=params(2)*T(1);
g1(15,59)=params(2)*T(1);
g1(15,35)=1;
g1(15,61)=(-1);
g1(15,62)=params(2)*T(1);
g1(16,57)=params(2)*T(1);
g1(16,58)=(-(params(2)*T(1)));
g1(16,60)=params(2)*T(1);
g1(16,35)=1;
g1(16,61)=(-1);
g1(16,63)=params(2)*T(1);
g1(17,18)=(-1);
g1(17,19)=1;
g1(17,32)=1;
g1(17,36)=1+params(4);
g1(18,20)=1;
g1(18,24)=(-1);
g1(18,33)=1;
g1(18,37)=1+params(4);
g1(19,13)=1;
g1(19,14)=(-1);
g1(19,49)=1;
g1(20,13)=(-1);
g1(20,16)=(-(T(7)*(1-T(4))));
g1(20,18)=1;
g1(20,28)=(-T(3));
g1(20,32)=(-T(2));
g1(20,36)=(-T(2));
g1(20,38)=(-1);
g1(21,14)=(-1);
g1(21,17)=(-(T(7)*(1-T(4))));
g1(21,24)=1;
g1(21,29)=(-T(3));
g1(21,33)=(-T(2));
g1(21,37)=(-T(2));
g1(21,39)=(-1);
g1(22,13)=(-1);
g1(22,22)=1;
g1(22,28)=(-T(3));
g1(22,32)=(-T(2));
g1(22,38)=(-1);
g1(23,14)=(-1);
g1(23,23)=1;
g1(23,29)=(-T(3));
g1(23,33)=(-T(2));
g1(23,39)=(-1);
g1(24,28)=(-((1-params(10))*(1-T(8))));
g1(24,29)=(-(params(10)*(1-T(8))));
g1(24,30)=(-T(8));
g1(24,31)=1;
g1(25,32)=(-(1-params(10)));
g1(25,33)=(-params(10));
g1(25,34)=1;
g1(26,24)=1;
g1(26,25)=(-(1-params(10)));
g1(26,26)=(-params(10));
g1(27,7)=(-params(14));
g1(27,38)=1;
g1(27,65)=(-1);
g1(28,8)=(-params(15));
g1(28,40)=1;
g1(28,64)=(-1);
g1(29,38)=(-1);
g1(29,39)=1;
g1(29,40)=(-1);
g1(30,10)=(-params(16));
g1(30,44)=1;
g1(30,66)=(-1);
g1(31,43)=1;
g1(31,44)=1;
g1(32,9)=(-params(17));
g1(32,41)=1;
g1(32,67)=(-1);
g1(33,41)=(-1);
g1(33,42)=1;
g1(33,44)=(-1);
g1(34,11)=(-(params(18)+params(19)));
g1(34,45)=1;
g1(34,68)=1;
g1(34,12)=(-(params(19)*(-params(18))));
g1(35,13)=1;
g1(35,18)=(-1);
g1(35,47)=1;
g1(36,14)=1;
g1(36,24)=(-1);
g1(36,48)=1;
g1(37,13)=1-params(10);
g1(37,14)=params(10);
g1(37,18)=(-(1-params(10)));
g1(37,24)=(-params(10));
g1(37,46)=1;
g1(38,13)=1-params(10);
g1(38,14)=params(10);
g1(38,22)=(-(1-params(10)));
g1(38,23)=(-params(10));
g1(38,53)=1;
g1(39,31)=params(9);
g1(39,34)=1-params(9);
g1(39,46)=(-1);
g1(39,51)=1;
g1(40,31)=params(9);
g1(40,34)=1-params(9);
g1(40,52)=1;
g1(40,53)=(-1);
g1(41,31)=1;
g1(41,46)=(-1);
g1(41,50)=1;
g1(42,11)=(-1);
g1(42,54)=1;

end
