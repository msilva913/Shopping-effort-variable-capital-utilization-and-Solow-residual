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
g1 = zeros(42, 60);
g1(1,11)=(-1);
g1(1,13)=1;
g1(1,14)=(-(T(10)*T(12)));
g1(2,12)=(-1);
g1(2,15)=(-(T(10)*T(12)));
g1(3,13)=(-1);
g1(3,18)=1;
g1(3,25)=(-1);
g1(4,14)=(-(T(5)*T(10)+T(13)));
g1(4,23)=1;
g1(5,15)=(-(T(5)*T(10)+T(13)));
g1(5,24)=1;
g1(6,11)=(-T(14));
g1(6,14)=(-(T(10)*T(14)));
g1(6,18)=(-(1-T(14)));
g1(6,23)=1;
g1(6,30)=1;
g1(6,31)=1;
g1(7,12)=(-T(14));
g1(7,15)=(-(T(10)*T(14)));
g1(7,19)=(-(1-T(14)));
g1(7,24)=1;
g1(7,30)=1;
g1(7,32)=1;
g1(8,29)=1;
g1(8,30)=(-1);
g1(8,31)=(-1);
g1(8,34)=1;
g1(8,38)=1;
g1(9,28)=1;
g1(9,30)=(-1);
g1(9,32)=(-1);
g1(9,35)=1;
g1(9,39)=1;
g1(10,13)=1;
g1(10,25)=params(6);
g1(10,30)=(-1);
g1(10,33)=1/params(5);
g1(10,42)=1;
g1(11,1)=(-params(3));
g1(11,3)=(-(1-params(3)));
g1(11,34)=1;
g1(11,5)=(1-params(10))*T(1);
g1(12,2)=(-params(3));
g1(12,4)=(-(1-params(3)));
g1(12,35)=1;
g1(12,6)=params(10)*T(1);
g1(13,14)=1;
g1(13,25)=(-1);
g1(13,41)=1;
g1(14,13)=1;
g1(14,15)=1;
g1(14,19)=(-1);
g1(14,41)=1;
g1(15,13)=1;
g1(15,18)=T(15);
g1(15,22)=(-T(15));
g1(15,25)=params(6);
g1(15,37)=1;
g1(16,16)=1;
g1(16,53)=(-params(2));
g1(16,56)=(-(params(2)*T(1)));
g1(16,37)=1;
g1(16,57)=(-1);
g1(17,17)=1;
g1(17,54)=(-params(2));
g1(17,55)=(-(params(2)*T(1)));
g1(17,37)=1;
g1(17,57)=(-1);
g1(18,16)=(-1);
g1(18,29)=1;
g1(18,38)=(-params(4));
g1(19,17)=(-1);
g1(19,28)=1;
g1(19,39)=(-params(4));
g1(20,16)=1;
g1(20,20)=(-(params(3)*params(12)));
g1(20,34)=params(3)*params(12);
g1(21,17)=1;
g1(21,21)=(-(params(3)*params(12)));
g1(21,35)=params(3)*params(12);
g1(22,11)=1;
g1(22,12)=(-1);
g1(22,46)=1;
g1(23,11)=(-(T(6)-(T(6)-1)));
g1(23,14)=(-(T(6)*T(10)*(1-T(5))-(T(6)-1)*T(10)));
g1(23,18)=1;
g1(23,31)=(-(params(9)*params(8)));
g1(23,34)=(-(T(3)*T(6)));
g1(23,38)=(-(T(3)*T(6)));
g1(23,40)=(-T(6));
g1(24,12)=(-(T(6)-(T(6)-1)));
g1(24,15)=(-(T(6)*T(10)*(1-T(5))-(T(6)-1)*T(10)));
g1(24,19)=1;
g1(24,32)=(-(params(9)*params(8)));
g1(24,35)=(-(T(3)*T(6)));
g1(24,39)=(-(T(3)*T(6)));
g1(24,40)=(-T(6));
g1(25,11)=(-(T(6)-(T(6)-1)));
g1(25,26)=1;
g1(25,31)=(-(params(9)*params(8)));
g1(25,34)=(-(T(3)*T(6)));
g1(25,40)=(-T(6));
g1(26,12)=(-(T(6)-(T(6)-1)));
g1(26,27)=1;
g1(26,32)=(-(params(9)*params(8)));
g1(26,35)=(-(T(3)*T(6)));
g1(26,40)=(-T(6));
g1(27,31)=(-(1-params(10)));
g1(27,32)=(-params(10));
g1(27,33)=1;
g1(28,34)=(-(1-params(10)));
g1(28,35)=(-params(10));
g1(28,36)=1;
g1(29,19)=1;
g1(29,20)=(-(1-params(10)));
g1(29,21)=(-params(10));
g1(30,18)=(-(1-params(10)));
g1(30,19)=(-params(10));
g1(30,22)=1;
g1(31,7)=(-params(14));
g1(31,40)=1;
g1(31,58)=(-1);
g1(32,8)=(-params(16));
g1(32,41)=1;
g1(32,59)=1;
g1(33,9)=(-(params(18)+params(19)));
g1(33,42)=1;
g1(33,60)=1;
g1(33,10)=(-(params(19)*(-params(18))));
g1(34,11)=1;
g1(34,18)=(-1);
g1(34,44)=1;
g1(35,12)=1;
g1(35,19)=(-1);
g1(35,45)=1;
g1(36,11)=1-params(10);
g1(36,12)=params(10);
g1(36,18)=(-(1-params(10)));
g1(36,19)=(-params(10));
g1(36,43)=1;
g1(37,11)=1-params(10);
g1(37,12)=params(10);
g1(37,26)=(-(1-params(10)));
g1(37,27)=(-params(10));
g1(37,51)=1;
g1(38,33)=params(9);
g1(38,36)=1-params(9);
g1(38,43)=(-1);
g1(38,49)=1;
g1(39,33)=params(9);
g1(39,36)=1-params(9);
g1(39,50)=1;
g1(39,51)=(-1);
g1(40,33)=1;
g1(40,43)=(-1);
g1(40,47)=1;
g1(41,12)=1;
g1(41,30)=(-1);
g1(41,33)=(-1);
g1(41,43)=1;
g1(41,48)=1;
g1(42,9)=(-1);
g1(42,52)=1;

end
