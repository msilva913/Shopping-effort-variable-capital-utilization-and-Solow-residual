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
    T = two_sector_RBC_testing.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(35, 50);
g1(1,9)=(-1);
g1(1,11)=1;
g1(2,10)=(-1);
g1(3,11)=(-1);
g1(3,13)=1;
g1(3,16)=(-1);
g1(4,9)=0.0;
g1(4,13)=(-1);
g1(4,21)=1;
g1(4,22)=1;
g1(5,14)=(-1);
g1(5,21)=1;
g1(5,23)=1;
g1(6,20)=1;
g1(6,21)=(-1);
g1(6,22)=(-1);
g1(6,25)=1;
g1(6,29)=1;
g1(7,19)=1;
g1(7,21)=(-1);
g1(7,23)=(-1);
g1(7,26)=1;
g1(7,30)=1;
g1(8,11)=1;
g1(8,16)=params(6);
g1(8,21)=(-1);
g1(8,24)=1/params(5);
g1(8,34)=1;
g1(9,1)=(-params(3));
g1(9,2)=(-(1-params(3)));
g1(9,27)=1;
g1(9,3)=(1-params(10))*T(1);
g1(9,4)=params(10)*T(1);
g1(10,11)=1;
g1(10,16)=params(6);
g1(10,28)=1;
g1(11,12)=1;
g1(11,44)=(-params(2));
g1(11,46)=(-(params(2)*T(1)));
g1(11,28)=1;
g1(11,47)=(-1);
g1(12,12)=1;
g1(12,44)=(-params(2));
g1(12,45)=(-(params(2)*T(1)));
g1(12,28)=1;
g1(12,47)=(-1);
g1(13,12)=(-1);
g1(13,20)=1;
g1(13,29)=(-params(4));
g1(14,12)=(-1);
g1(14,19)=1;
g1(14,30)=(-params(4));
g1(15,12)=1;
g1(15,14)=(-(params(3)*params(11)));
g1(15,27)=params(3)*params(11);
g1(16,9)=1;
g1(16,38)=1;
g1(17,9)=(-1);
g1(17,13)=1;
g1(17,22)=(-(1-T(3)));
g1(17,25)=(-T(3));
g1(17,29)=(-T(3));
g1(17,31)=(-1);
g1(18,14)=1;
g1(18,23)=(-(1-T(3)));
g1(18,26)=(-T(3));
g1(18,30)=(-T(3));
g1(18,32)=(-1);
g1(19,9)=(-1);
g1(19,17)=1;
g1(19,22)=(-(1-T(3)));
g1(19,25)=(-T(3));
g1(19,31)=(-1);
g1(20,18)=1;
g1(20,23)=(-(1-T(3)));
g1(20,26)=(-T(3));
g1(20,32)=(-1);
g1(21,22)=(-(1-params(10)));
g1(21,23)=(-params(10));
g1(21,24)=1;
g1(22,25)=(-(1-params(10)));
g1(22,26)=(-params(10));
g1(22,27)=1;
g1(23,13)=(-(1-params(10)));
g1(23,14)=(-params(10));
g1(23,15)=1;
g1(24,5)=(-params(12));
g1(24,31)=1;
g1(24,49)=(-1);
g1(25,6)=(-params(13));
g1(25,33)=1;
g1(25,48)=(-1);
g1(26,31)=(-1);
g1(26,32)=1;
g1(26,33)=(-1);
g1(27,7)=(-(params(14)+params(15)));
g1(27,34)=1;
g1(27,50)=1;
g1(27,8)=(-(params(15)*(-params(14))));
g1(28,9)=1;
g1(28,13)=(-1);
g1(28,36)=1;
g1(29,14)=(-1);
g1(29,37)=1;
g1(30,9)=1-params(10);
g1(30,13)=(-(1-params(10)));
g1(30,14)=(-params(10));
g1(30,35)=1;
g1(31,9)=1-params(10);
g1(31,17)=(-(1-params(10)));
g1(31,18)=(-params(10));
g1(31,42)=1;
g1(32,24)=params(9);
g1(32,27)=1-params(9);
g1(32,35)=(-1);
g1(32,40)=1;
g1(33,24)=params(9);
g1(33,27)=1-params(9);
g1(33,41)=1;
g1(33,42)=(-1);
g1(34,24)=1;
g1(34,35)=(-1);
g1(34,39)=1;
g1(35,7)=(-1);
g1(35,43)=1;

end
