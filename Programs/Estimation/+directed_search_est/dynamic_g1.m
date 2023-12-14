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
    T = directed_search_est.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(45, 65);
g1(1,13)=(-1);
g1(1,15)=1;
g1(1,16)=(-(T(10)*T(14)));
g1(2,14)=(-1);
g1(2,17)=(-(T(10)*T(14)));
g1(3,15)=(-1);
g1(3,20)=1;
g1(3,27)=(-1);
g1(4,16)=(-(T(5)*T(10)+T(15)));
g1(4,25)=1;
g1(5,17)=(-(T(5)*T(10)+T(15)));
g1(5,26)=1;
g1(6,13)=(-T(16));
g1(6,16)=(-(T(10)*T(16)));
g1(6,20)=(-(1-T(16)));
g1(6,25)=1;
g1(6,32)=1;
g1(6,33)=1;
g1(7,14)=(-T(16));
g1(7,17)=(-(T(10)*T(16)));
g1(7,21)=(-(1-T(16)));
g1(7,26)=1;
g1(7,32)=1;
g1(7,34)=1;
g1(8,31)=1;
g1(8,32)=(-1);
g1(8,33)=(-1);
g1(8,36)=1;
g1(8,40)=1;
g1(9,30)=1;
g1(9,32)=(-1);
g1(9,34)=(-1);
g1(9,37)=1;
g1(9,41)=1;
g1(10,32)=(-1);
g1(10,35)=1/params(5);
g1(10,39)=(-1);
g1(11,2)=(-params(3));
g1(11,6)=(-(1-params(3)));
g1(11,36)=1;
g1(11,8)=(1-params(10))*T(1);
g1(12,3)=(-params(3));
g1(12,7)=(-(1-params(3)));
g1(12,37)=1;
g1(12,9)=params(10)*T(1);
g1(13,16)=1;
g1(13,27)=(-1);
g1(13,45)=1;
g1(14,15)=1;
g1(14,17)=1;
g1(14,21)=(-1);
g1(14,45)=1;
g1(15,15)=1;
g1(15,1)=(-(T(17)*(-(params(14)*T(12)))));
g1(15,20)=(-(T(12)*T(17)));
g1(15,4)=(-(T(17)*(-(params(14)*(-T(12))))));
g1(15,24)=(-(T(17)*(-T(12))));
g1(15,5)=(-(T(17)*(-(params(14)*T(13)))));
g1(15,27)=(-(T(13)*T(17)));
g1(15,39)=1;
g1(16,18)=1;
g1(16,58)=(-params(2));
g1(16,61)=(-(params(2)*T(1)));
g1(16,39)=1;
g1(16,62)=(-1);
g1(17,19)=1;
g1(17,59)=(-params(2));
g1(17,60)=(-(params(2)*T(1)));
g1(17,39)=1;
g1(17,62)=(-1);
g1(18,18)=(-1);
g1(18,31)=1;
g1(18,40)=(-params(4));
g1(19,19)=(-1);
g1(19,30)=1;
g1(19,41)=(-params(4));
g1(20,18)=1;
g1(20,22)=(-(params(3)*params(12)));
g1(20,36)=params(3)*params(12);
g1(21,19)=1;
g1(21,23)=(-(params(3)*params(12)));
g1(21,37)=params(3)*params(12);
g1(22,13)=1;
g1(22,14)=(-1);
g1(22,51)=1;
g1(23,13)=(-(T(6)-(T(6)-1)));
g1(23,16)=(-(T(6)*T(10)*(1-T(5))-(T(6)-1)*T(10)));
g1(23,20)=1;
g1(23,33)=(-(params(9)*params(8)));
g1(23,36)=(-(T(3)*T(6)));
g1(23,40)=(-(T(3)*T(6)));
g1(23,42)=(-T(6));
g1(24,14)=(-(T(6)-(T(6)-1)));
g1(24,17)=(-(T(6)*T(10)*(1-T(5))-(T(6)-1)*T(10)));
g1(24,21)=1;
g1(24,34)=(-(params(9)*params(8)));
g1(24,37)=(-(T(3)*T(6)));
g1(24,41)=(-(T(3)*T(6)));
g1(24,43)=(-T(6));
g1(25,13)=(-(T(6)-(T(6)-1)));
g1(25,28)=1;
g1(25,33)=(-(params(9)*params(8)));
g1(25,36)=(-(T(3)*T(6)));
g1(25,42)=(-T(6));
g1(26,14)=(-(T(6)-(T(6)-1)));
g1(26,29)=1;
g1(26,34)=(-(params(9)*params(8)));
g1(26,37)=(-(T(3)*T(6)));
g1(26,43)=(-T(6));
g1(27,33)=(-(1-params(10)));
g1(27,34)=(-params(10));
g1(27,35)=1;
g1(28,36)=(-(1-params(10)));
g1(28,37)=(-params(10));
g1(28,38)=1;
g1(29,21)=1;
g1(29,22)=(-(1-params(10)));
g1(29,23)=(-params(10));
g1(30,20)=(-(1-params(10)));
g1(30,21)=(-params(10));
g1(30,24)=1;
g1(31,10)=(-params(15));
g1(31,42)=1;
g1(31,64)=(-1);
g1(32,11)=(-params(16));
g1(32,44)=1;
g1(32,63)=(-1);
g1(33,42)=(-1);
g1(33,43)=1;
g1(33,44)=(-1);
g1(34,12)=(-params(17));
g1(34,45)=1;
g1(34,65)=1;
g1(35,13)=1;
g1(35,20)=(-1);
g1(35,46)=1;
g1(36,14)=1;
g1(36,21)=(-1);
g1(36,47)=1;
g1(37,13)=1-params(10);
g1(37,14)=params(10);
g1(37,20)=(-(1-params(10)));
g1(37,21)=(-params(10));
g1(37,50)=1;
g1(38,14)=1;
g1(38,32)=(-1);
g1(38,55)=1;
g1(39,13)=1-params(10);
g1(39,14)=params(10);
g1(39,28)=(-(1-params(10)));
g1(39,29)=(-params(10));
g1(39,57)=1;
g1(40,35)=params(9);
g1(40,38)=1-params(9);
g1(40,50)=(-1);
g1(40,54)=1;
g1(41,35)=params(9);
g1(41,38)=1-params(9);
g1(41,56)=1;
g1(41,57)=(-1);
g1(42,35)=1;
g1(42,50)=(-1);
g1(42,52)=1;
g1(43,35)=(-1);
g1(43,50)=1;
g1(43,53)=1;
g1(43,55)=(-1);
g1(44,35)=(-1);
g1(44,48)=1;
g1(45,35)=(-1);
g1(45,49)=1;

end
