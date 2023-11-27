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
g1 = zeros(38, 56);
g1(1,11)=(-1);
g1(1,13)=1;
g1(2,12)=(-1);
g1(3,13)=(-1);
g1(3,16)=1;
g1(3,21)=(-1);
g1(4,11)=T(5);
g1(4,16)=(-(1+T(5)));
g1(4,26)=1;
g1(4,27)=1;
g1(5,17)=(-(1+T(5)));
g1(5,26)=1;
g1(5,28)=1;
g1(6,25)=1;
g1(6,26)=(-1);
g1(6,27)=(-1);
g1(6,30)=1;
g1(6,34)=1;
g1(7,24)=1;
g1(7,26)=(-1);
g1(7,28)=(-1);
g1(7,31)=1;
g1(7,35)=1;
g1(8,13)=1;
g1(8,21)=params(6);
g1(8,26)=(-1);
g1(8,29)=1/params(5);
g1(8,39)=1;
g1(9,1)=(-params(3));
g1(9,3)=(-(1-params(3)));
g1(9,30)=1;
g1(9,5)=(1-params(10))*T(1);
g1(10,2)=(-params(3));
g1(10,4)=(-(1-params(3)));
g1(10,31)=1;
g1(10,6)=params(10)*T(1);
g1(11,13)=1;
g1(11,21)=params(6);
g1(11,33)=1;
g1(12,14)=1;
g1(12,49)=(-params(2));
g1(12,52)=(-(params(2)*T(1)));
g1(12,33)=1;
g1(12,53)=(-1);
g1(13,15)=1;
g1(13,50)=(-params(2));
g1(13,51)=(-(params(2)*T(1)));
g1(13,33)=1;
g1(13,53)=(-1);
g1(14,14)=(-1);
g1(14,25)=1;
g1(14,34)=(-params(4));
g1(15,15)=(-1);
g1(15,24)=1;
g1(15,35)=(-params(4));
g1(16,14)=1;
g1(16,18)=(-(params(3)*params(11)));
g1(16,30)=params(3)*params(11);
g1(17,15)=1;
g1(17,19)=(-(params(3)*params(11)));
g1(17,31)=params(3)*params(11);
g1(18,11)=1;
g1(18,43)=1;
g1(19,11)=(-(T(4)-(T(4)-1)));
g1(19,16)=1;
g1(19,27)=(-(params(9)*params(8)));
g1(19,30)=(-(T(3)*T(4)));
g1(19,34)=(-(T(3)*T(4)));
g1(19,36)=(-T(4));
g1(20,17)=1;
g1(20,28)=(-(params(9)*params(8)));
g1(20,31)=(-(T(3)*T(4)));
g1(20,35)=(-(T(3)*T(4)));
g1(20,37)=(-T(4));
g1(21,11)=(-(T(4)-(T(4)-1)));
g1(21,22)=1;
g1(21,27)=(-(params(9)*params(8)));
g1(21,30)=(-(T(3)*T(4)));
g1(21,36)=(-T(4));
g1(22,23)=1;
g1(22,28)=(-(params(9)*params(8)));
g1(22,31)=(-(T(3)*T(4)));
g1(22,37)=(-T(4));
g1(23,27)=(-(1-params(10)));
g1(23,28)=(-params(10));
g1(23,29)=1;
g1(24,30)=(-(1-params(10)));
g1(24,31)=(-params(10));
g1(24,32)=1;
g1(25,17)=1;
g1(25,18)=(-(1-params(10)));
g1(25,19)=(-params(10));
g1(26,16)=(-(1-params(10)));
g1(26,17)=(-params(10));
g1(26,20)=1;
g1(27,7)=(-params(12));
g1(27,36)=1;
g1(27,55)=(-1);
g1(28,8)=(-params(13));
g1(28,38)=1;
g1(28,54)=(-1);
g1(29,36)=(-1);
g1(29,37)=1;
g1(29,38)=(-1);
g1(30,9)=(-(params(14)+params(15)));
g1(30,39)=1;
g1(30,56)=1;
g1(30,10)=(-(params(15)*(-params(14))));
g1(31,11)=1;
g1(31,16)=(-1);
g1(31,41)=1;
g1(32,17)=(-1);
g1(32,42)=1;
g1(33,11)=1-params(10);
g1(33,16)=(-(1-params(10)));
g1(33,17)=(-params(10));
g1(33,40)=1;
g1(34,11)=1-params(10);
g1(34,22)=(-(1-params(10)));
g1(34,23)=(-params(10));
g1(34,47)=1;
g1(35,29)=params(9);
g1(35,32)=1-params(9);
g1(35,40)=(-1);
g1(35,45)=1;
g1(36,29)=params(9);
g1(36,32)=1-params(9);
g1(36,46)=1;
g1(36,47)=(-1);
g1(37,29)=1;
g1(37,40)=(-1);
g1(37,44)=1;
g1(38,9)=(-1);
g1(38,48)=1;

end
