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
g1 = zeros(43, 64);
g1(1,14)=(-1);
g1(1,16)=1;
g1(1,17)=(-(T(10)*T(14)));
g1(2,15)=(-1);
g1(2,18)=(-(T(10)*T(14)));
g1(3,16)=(-1);
g1(3,21)=1;
g1(3,28)=(-1);
g1(4,17)=(-(T(5)*T(10)+T(15)));
g1(4,26)=1;
g1(5,18)=(-(T(5)*T(10)+T(15)));
g1(5,27)=1;
g1(6,14)=(-T(16));
g1(6,17)=(-(T(10)*T(16)));
g1(6,21)=(-(1-T(16)));
g1(6,26)=1;
g1(6,33)=1;
g1(6,34)=1;
g1(7,15)=(-T(16));
g1(7,18)=(-(T(10)*T(16)));
g1(7,22)=(-(1-T(16)));
g1(7,27)=1;
g1(7,33)=1;
g1(7,35)=1;
g1(8,32)=1;
g1(8,33)=(-1);
g1(8,34)=(-1);
g1(8,37)=1;
g1(8,41)=1;
g1(9,31)=1;
g1(9,33)=(-1);
g1(9,35)=(-1);
g1(9,38)=1;
g1(9,42)=1;
g1(10,16)=1;
g1(10,28)=params(6);
g1(10,33)=(-1);
g1(10,36)=1/params(5);
g1(10,45)=1;
g1(11,2)=(-params(3));
g1(11,6)=(-(1-params(3)));
g1(11,37)=1;
g1(11,8)=(1-params(10))*T(1);
g1(12,3)=(-params(3));
g1(12,7)=(-(1-params(3)));
g1(12,38)=1;
g1(12,9)=params(10)*T(1);
g1(13,17)=1;
g1(13,28)=(-1);
g1(13,44)=1;
g1(14,16)=1;
g1(14,18)=1;
g1(14,22)=(-1);
g1(14,44)=1;
g1(15,16)=1;
g1(15,1)=(-(T(17)*(-(params(14)*T(12)))));
g1(15,21)=(-(T(12)*T(17)));
g1(15,4)=(-(T(17)*(-(params(14)*(-T(12))))));
g1(15,25)=(-(T(17)*(-T(12))));
g1(15,5)=(-(T(17)*(-(params(14)*T(13)))));
g1(15,28)=(-(T(13)*T(17)));
g1(15,40)=1;
g1(16,19)=1;
g1(16,57)=(-params(2));
g1(16,60)=(-(params(2)*T(1)));
g1(16,40)=1;
g1(16,61)=(-1);
g1(17,20)=1;
g1(17,58)=(-params(2));
g1(17,59)=(-(params(2)*T(1)));
g1(17,40)=1;
g1(17,61)=(-1);
g1(18,19)=(-1);
g1(18,32)=1;
g1(18,41)=(-params(4));
g1(19,20)=(-1);
g1(19,31)=1;
g1(19,42)=(-params(4));
g1(20,19)=1;
g1(20,23)=(-(params(3)*params(12)));
g1(20,37)=params(3)*params(12);
g1(21,20)=1;
g1(21,24)=(-(params(3)*params(12)));
g1(21,38)=params(3)*params(12);
g1(22,14)=1;
g1(22,15)=(-1);
g1(22,49)=1;
g1(23,14)=(-(T(6)-(T(6)-1)));
g1(23,17)=(-(T(6)*T(10)*(1-T(5))-(T(6)-1)*T(10)));
g1(23,21)=1;
g1(23,34)=(-(params(9)*params(8)));
g1(23,37)=(-(T(3)*T(6)));
g1(23,41)=(-(T(3)*T(6)));
g1(23,43)=(-T(6));
g1(24,15)=(-(T(6)-(T(6)-1)));
g1(24,18)=(-(T(6)*T(10)*(1-T(5))-(T(6)-1)*T(10)));
g1(24,22)=1;
g1(24,35)=(-(params(9)*params(8)));
g1(24,38)=(-(T(3)*T(6)));
g1(24,42)=(-(T(3)*T(6)));
g1(24,43)=(-T(6));
g1(25,14)=(-(T(6)-(T(6)-1)));
g1(25,29)=1;
g1(25,34)=(-(params(9)*params(8)));
g1(25,37)=(-(T(3)*T(6)));
g1(25,43)=(-T(6));
g1(26,15)=(-(T(6)-(T(6)-1)));
g1(26,30)=1;
g1(26,35)=(-(params(9)*params(8)));
g1(26,38)=(-(T(3)*T(6)));
g1(26,43)=(-T(6));
g1(27,34)=(-(1-params(10)));
g1(27,35)=(-params(10));
g1(27,36)=1;
g1(28,37)=(-(1-params(10)));
g1(28,38)=(-params(10));
g1(28,39)=1;
g1(29,22)=1;
g1(29,23)=(-(1-params(10)));
g1(29,24)=(-params(10));
g1(30,21)=(-(1-params(10)));
g1(30,22)=(-params(10));
g1(30,25)=1;
g1(31,10)=(-params(15));
g1(31,43)=1;
g1(31,62)=(-1);
g1(32,11)=(-params(17));
g1(32,44)=1;
g1(32,63)=1;
g1(33,12)=(-(params(19)+params(20)));
g1(33,45)=1;
g1(33,64)=1;
g1(33,13)=(-(params(20)*(-params(19))));
g1(34,14)=1;
g1(34,21)=(-1);
g1(34,47)=1;
g1(35,15)=1;
g1(35,22)=(-1);
g1(35,48)=1;
g1(36,14)=1-params(10);
g1(36,15)=params(10);
g1(36,21)=(-(1-params(10)));
g1(36,22)=(-params(10));
g1(36,46)=1;
g1(37,15)=1;
g1(37,33)=(-1);
g1(37,53)=1;
g1(38,14)=1-params(10);
g1(38,15)=params(10);
g1(38,29)=(-(1-params(10)));
g1(38,30)=(-params(10));
g1(38,55)=1;
g1(39,36)=params(9);
g1(39,39)=1-params(9);
g1(39,46)=(-1);
g1(39,52)=1;
g1(40,36)=params(9);
g1(40,39)=1-params(9);
g1(40,54)=1;
g1(40,55)=(-1);
g1(41,36)=1;
g1(41,46)=(-1);
g1(41,50)=1;
g1(42,36)=(-1);
g1(42,46)=1;
g1(42,51)=1;
g1(42,53)=(-1);
g1(43,12)=(-1);
g1(43,56)=1;

end
