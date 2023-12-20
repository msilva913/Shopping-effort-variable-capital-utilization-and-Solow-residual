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
g1 = zeros(43, 61);
g1(1,11)=(-1);
g1(1,13)=1;
g1(1,14)=(-(T(10)*T(14)));
g1(2,12)=(-1);
g1(2,15)=(-(T(10)*T(14)));
g1(3,13)=(-1);
g1(3,17)=1;
g1(3,22)=(-1);
g1(4,14)=(-(T(5)*T(10)+T(15)));
g1(4,20)=1;
g1(5,15)=(-(T(5)*T(10)+T(15)));
g1(5,21)=1;
g1(6,11)=(-T(16));
g1(6,14)=(-(T(10)*T(16)));
g1(6,17)=(-(1-T(16)));
g1(6,20)=1;
g1(6,27)=1;
g1(6,28)=1;
g1(7,12)=(-T(16));
g1(7,15)=(-(T(10)*T(16)));
g1(7,18)=(-(1-T(16)));
g1(7,21)=1;
g1(7,27)=1;
g1(7,29)=1;
g1(8,26)=1;
g1(8,27)=(-1);
g1(8,28)=(-1);
g1(8,4)=1;
g1(8,35)=1;
g1(9,25)=1;
g1(9,27)=(-1);
g1(9,29)=(-1);
g1(9,5)=1;
g1(9,36)=1;
g1(10,27)=(-1);
g1(10,30)=1/params(5);
g1(10,34)=(-1);
g1(11,18)=(-params(3));
g1(11,6)=(-(1-params(3)));
g1(11,33)=1;
g1(11,35)=(1-params(10))*T(1);
g1(11,36)=params(10)*T(1);
g1(12,14)=1;
g1(12,22)=(-1);
g1(12,40)=1;
g1(13,13)=1;
g1(13,15)=1;
g1(13,18)=(-1);
g1(13,40)=1;
g1(13,41)=1;
g1(14,13)=1;
g1(14,1)=(-(T(17)*(-(params(14)*T(12)))));
g1(14,17)=(-(T(12)*T(17)));
g1(14,2)=(-(T(17)*(-(params(14)*(-T(12))))));
g1(14,19)=(-(T(17)*(-T(12))));
g1(14,3)=(-(T(17)*(-(params(14)*T(13)))));
g1(14,22)=(-(T(13)*T(17)));
g1(14,34)=1;
g1(15,16)=1;
g1(15,54)=(-params(2));
g1(15,56)=(-(params(2)*T(1)));
g1(15,34)=1;
g1(15,57)=(-1);
g1(16,16)=1;
g1(16,54)=(-params(2));
g1(16,55)=(-(params(2)*T(1)));
g1(16,34)=1;
g1(16,57)=(-1);
g1(17,16)=(-1);
g1(17,26)=1;
g1(17,35)=(-params(4));
g1(18,16)=(-1);
g1(18,25)=1;
g1(18,36)=(-params(4));
g1(19,16)=1;
g1(19,18)=(-(params(3)*params(12)));
g1(19,6)=params(3)*params(12);
g1(20,11)=1;
g1(20,12)=(-1);
g1(20,47)=1;
g1(21,11)=(-(T(6)-(T(6)-1)));
g1(21,14)=(-(T(6)*T(10)*(1-T(5))-(T(6)-1)*T(10)));
g1(21,17)=1;
g1(21,28)=(-(params(9)*params(8)));
g1(21,4)=(-(T(3)*T(6)));
g1(21,35)=(-(T(3)*T(6)));
g1(21,37)=(-T(6));
g1(22,12)=(-(T(6)-(T(6)-1)));
g1(22,15)=(-(T(6)*T(10)*(1-T(5))-(T(6)-1)*T(10)));
g1(22,18)=1;
g1(22,29)=(-(params(9)*params(8)));
g1(22,5)=(-(T(3)*T(6)));
g1(22,36)=(-(T(3)*T(6)));
g1(22,38)=(-T(6));
g1(23,11)=(-(T(6)-(T(6)-1)));
g1(23,23)=1;
g1(23,28)=(-(params(9)*params(8)));
g1(23,4)=(-(T(3)*T(6)));
g1(23,37)=(-T(6));
g1(24,12)=(-(T(6)-(T(6)-1)));
g1(24,24)=1;
g1(24,29)=(-(params(9)*params(8)));
g1(24,5)=(-(T(3)*T(6)));
g1(24,38)=(-T(6));
g1(25,28)=(-(1-params(10)));
g1(25,29)=(-params(10));
g1(25,30)=1;
g1(26,31)=(-(1-params(10)));
g1(26,32)=(-params(10));
g1(26,33)=1;
g1(27,17)=(-(1-params(10)));
g1(27,18)=(-params(10));
g1(27,19)=1;
g1(28,7)=(-params(15));
g1(28,37)=1;
g1(28,59)=(-1);
g1(29,8)=(-params(16));
g1(29,39)=1;
g1(29,58)=(-1);
g1(30,37)=(-1);
g1(30,38)=1;
g1(30,39)=(-1);
g1(31,9)=(-params(17));
g1(31,40)=1;
g1(31,60)=1;
g1(32,10)=(-params(18));
g1(32,41)=1;
g1(32,61)=1;
g1(33,11)=1;
g1(33,17)=(-1);
g1(33,42)=1;
g1(34,12)=1;
g1(34,18)=(-1);
g1(34,43)=1;
g1(35,11)=1-params(10);
g1(35,12)=params(10);
g1(35,17)=(-(1-params(10)));
g1(35,18)=(-params(10));
g1(35,46)=1;
g1(36,12)=1;
g1(36,27)=(-1);
g1(36,51)=1;
g1(37,11)=1-params(10);
g1(37,12)=params(10);
g1(37,23)=(-(1-params(10)));
g1(37,24)=(-params(10));
g1(37,53)=1;
g1(38,30)=params(9);
g1(38,6)=1-params(9);
g1(38,46)=(-1);
g1(38,50)=1;
g1(39,30)=params(9);
g1(39,6)=1-params(9);
g1(39,52)=1;
g1(39,53)=(-1);
g1(40,30)=1;
g1(40,46)=(-1);
g1(40,48)=1;
g1(41,30)=(-1);
g1(41,46)=1;
g1(41,49)=1;
g1(41,51)=(-1);
g1(42,28)=(-1);
g1(42,44)=1;
g1(43,29)=(-1);
g1(43,45)=1;

end
