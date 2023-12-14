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
    T = two_sector_RBC_differentiated_testing.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(39, 58);
g1(1,12)=(-1);
g1(1,14)=1;
g1(2,13)=(-1);
g1(3,14)=(-1);
g1(3,17)=1;
g1(3,22)=(-1);
g1(4,12)=(-T(5));
g1(4,17)=(-(1-T(5)));
g1(4,27)=1;
g1(4,28)=1;
g1(5,18)=(-(1-T(5)));
g1(5,27)=1;
g1(5,29)=1;
g1(6,26)=1;
g1(6,27)=(-1);
g1(6,28)=(-1);
g1(6,31)=1;
g1(6,35)=1;
g1(7,25)=1;
g1(7,27)=(-1);
g1(7,29)=(-1);
g1(7,32)=1;
g1(7,36)=1;
g1(8,27)=(-1);
g1(8,30)=1/params(5);
g1(8,34)=(-1);
g1(8,40)=1;
g1(9,1)=(-params(3));
g1(9,4)=(-(1-params(3)));
g1(9,31)=1;
g1(9,6)=(1-params(10))*T(1);
g1(10,2)=(-params(3));
g1(10,5)=(-(1-params(3)));
g1(10,32)=1;
g1(10,7)=params(10)*T(1);
g1(11,14)=1;
g1(11,3)=(-((-params(6))/(1-params(12))*(-params(12))));
g1(11,22)=(-((-params(6))/(1-params(12))));
g1(11,34)=1;
g1(12,15)=1;
g1(12,51)=(-params(2));
g1(12,54)=(-(params(2)*T(1)));
g1(12,34)=1;
g1(12,55)=(-1);
g1(13,16)=1;
g1(13,52)=(-params(2));
g1(13,53)=(-(params(2)*T(1)));
g1(13,34)=1;
g1(13,55)=(-1);
g1(14,15)=(-1);
g1(14,26)=1;
g1(14,35)=(-params(4));
g1(15,16)=(-1);
g1(15,25)=1;
g1(15,36)=(-params(4));
g1(16,15)=1;
g1(16,19)=(-(params(3)*params(11)));
g1(16,31)=params(3)*params(11);
g1(17,16)=1;
g1(17,20)=(-(params(3)*params(11)));
g1(17,32)=params(3)*params(11);
g1(18,12)=1;
g1(18,44)=1;
g1(19,12)=(-(T(4)-(T(4)-1)));
g1(19,17)=1;
g1(19,28)=(-(params(9)*params(8)));
g1(19,31)=(-(T(3)*T(4)));
g1(19,35)=(-(T(3)*T(4)));
g1(19,37)=(-T(4));
g1(20,18)=1;
g1(20,29)=(-(params(9)*params(8)));
g1(20,32)=(-(T(3)*T(4)));
g1(20,36)=(-(T(3)*T(4)));
g1(20,38)=(-T(4));
g1(21,12)=(-(T(4)-(T(4)-1)));
g1(21,23)=1;
g1(21,28)=(-(params(9)*params(8)));
g1(21,31)=(-(T(3)*T(4)));
g1(21,37)=(-T(4));
g1(22,24)=1;
g1(22,29)=(-(params(9)*params(8)));
g1(22,32)=(-(T(3)*T(4)));
g1(22,37)=(-T(4));
g1(23,28)=(-(1-params(10)));
g1(23,29)=(-params(10));
g1(23,30)=1;
g1(24,31)=(-(1-params(10)));
g1(24,32)=(-params(10));
g1(24,33)=1;
g1(25,18)=1;
g1(25,19)=(-(1-params(10)));
g1(25,20)=(-params(10));
g1(26,17)=(-(1-params(10)));
g1(26,18)=(-params(10));
g1(26,21)=1;
g1(27,8)=(-params(13));
g1(27,37)=1;
g1(27,56)=(-1);
g1(28,9)=(-params(14));
g1(28,39)=1;
g1(28,57)=(-1);
g1(29,37)=(-1);
g1(29,38)=1;
g1(29,39)=(-1);
g1(30,10)=(-(params(15)+params(16)));
g1(30,40)=1;
g1(30,58)=1;
g1(30,11)=(-(params(16)*(-params(15))));
g1(31,12)=1;
g1(31,17)=(-1);
g1(31,42)=1;
g1(32,18)=(-1);
g1(32,43)=1;
g1(33,12)=1-params(10);
g1(33,17)=(-(1-params(10)));
g1(33,18)=(-params(10));
g1(33,41)=1;
g1(34,12)=1-params(10);
g1(34,23)=(-(1-params(10)));
g1(34,24)=(-params(10));
g1(34,49)=1;
g1(35,30)=params(9);
g1(35,33)=1-params(9);
g1(35,41)=(-1);
g1(35,47)=1;
g1(36,30)=params(9);
g1(36,33)=1-params(9);
g1(36,48)=1;
g1(36,49)=(-1);
g1(37,30)=1;
g1(37,41)=(-1);
g1(37,45)=1;
g1(38,27)=(-1);
g1(38,30)=(-1);
g1(38,41)=1;
g1(38,46)=1;
g1(39,10)=(-1);
g1(39,50)=1;

end
