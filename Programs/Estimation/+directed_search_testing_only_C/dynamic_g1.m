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
    T = directed_search_testing_only_C.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(41, 66);
g1(1,12)=(-1);
g1(1,13)=1;
g1(1,14)=(-(T(2)*(1-T(1))));
g1(2,13)=(-1);
g1(2,17)=1;
g1(2,19)=(-1);
g1(3,14)=(-(T(2)*params(6)*(1-(1-params(7)*params(8)))+T(4)));
g1(3,18)=1;
g1(4,17)=(-1);
g1(4,18)=1;
g1(4,25)=1;
g1(4,26)=1;
g1(5,22)=(-1);
g1(5,25)=1;
g1(5,27)=1;
g1(6,13)=1;
g1(6,19)=params(5);
g1(6,25)=(-1);
g1(6,28)=1/params(4);
g1(6,43)=1;
g1(7,1)=(-T(3));
g1(7,3)=(-(1-T(3)));
g1(7,29)=1;
g1(7,5)=T(5);
g1(8,2)=(-T(3));
g1(8,4)=(-(1-T(3)));
g1(8,30)=1;
g1(8,6)=T(5);
g1(9,14)=1;
g1(9,19)=(-1);
g1(9,41)=1;
g1(10,13)=(-1);
g1(10,19)=(-params(5));
g1(10,32)=(-1);
g1(11,15)=1;
g1(11,53)=(-params(2));
g1(11,55)=(-(params(2)*T(5)));
g1(11,56)=params(2)*T(5);
g1(11,58)=params(2)*T(5);
g1(11,32)=1;
g1(11,60)=(-1);
g1(11,61)=params(2)*T(5);
g1(12,16)=1;
g1(12,54)=(-params(2));
g1(12,57)=(-(params(2)*T(5)));
g1(12,59)=params(2)*T(5);
g1(12,32)=1;
g1(12,60)=(-1);
g1(12,62)=params(2)*T(5);
g1(13,15)=1;
g1(13,17)=(-1);
g1(13,18)=1;
g1(13,29)=1;
g1(13,34)=1+params(3);
g1(14,16)=1;
g1(14,22)=(-1);
g1(14,30)=1;
g1(14,35)=1+params(3);
g1(15,15)=1;
g1(15,23)=(-(params(11)*T(3)));
g1(15,29)=params(11)*T(3);
g1(16,16)=1;
g1(16,24)=(-(params(11)*T(3)));
g1(16,30)=params(11)*T(3);
g1(17,12)=1;
g1(17,47)=1;
g1(18,12)=(-1);
g1(18,14)=(-(T(2)*(1-params(6)*(1-(1-params(7)*params(8))))));
g1(18,17)=1;
g1(18,26)=(-(1-(1-params(7)*params(8))));
g1(18,29)=(-(1-params(7)*params(8)));
g1(18,34)=(-(1-params(7)*params(8)));
g1(18,37)=(-1);
g1(19,22)=1;
g1(19,27)=(-(1-(1-params(7)*params(8))));
g1(19,30)=(-(1-params(7)*params(8)));
g1(19,35)=(-(1-params(7)*params(8)));
g1(19,38)=(-1);
g1(20,12)=(-1);
g1(20,20)=1;
g1(20,26)=(-(1-(1-params(7)*params(8))));
g1(20,29)=(-(1-params(7)*params(8)));
g1(20,37)=(-1);
g1(21,21)=1;
g1(21,27)=(-(1-(1-params(7)*params(8))));
g1(21,30)=(-(1-params(7)*params(8)));
g1(21,38)=(-1);
g1(22,26)=(-(1-params(9)));
g1(22,27)=(-params(9));
g1(22,28)=1;
g1(23,29)=(-(1-params(9)));
g1(23,30)=(-params(9));
g1(23,31)=1;
g1(24,22)=1;
g1(24,23)=(-(1-params(9)));
g1(24,24)=(-params(9));
g1(25,14)=(-((1-params(9))*T(2)));
g1(25,34)=(-((1-params(7)*params(8))*(1-params(9))));
g1(25,35)=(-((1-params(7)*params(8))*params(9)));
g1(25,36)=1;
g1(26,17)=1-params(9)-params(8);
g1(26,33)=(-(1-params(8)-params(9)));
g1(27,7)=(-params(13));
g1(27,37)=1;
g1(27,64)=(-1);
g1(28,8)=(-params(14));
g1(28,39)=1;
g1(28,63)=(-1);
g1(29,37)=(-1);
g1(29,38)=1;
g1(29,39)=(-1);
g1(30,9)=(-params(15));
g1(30,42)=1;
g1(30,65)=(-1);
g1(31,41)=1;
g1(31,42)=1;
g1(32,40)=1;
g1(32,42)=(-1);
g1(33,10)=(-(params(17)+params(18)));
g1(33,43)=1;
g1(33,66)=1;
g1(33,11)=(-(params(18)*(-params(17))));
g1(34,12)=1;
g1(34,17)=(-1);
g1(34,45)=1;
g1(35,22)=(-1);
g1(35,46)=1;
g1(36,12)=1-params(9);
g1(36,17)=(-(1-params(9)));
g1(36,22)=(-params(9));
g1(36,44)=1;
g1(37,12)=1-params(9);
g1(37,20)=(-(1-params(9)));
g1(37,21)=(-params(9));
g1(37,51)=1;
g1(38,28)=params(8);
g1(38,31)=1-params(8);
g1(38,44)=(-1);
g1(38,49)=1;
g1(39,28)=params(8);
g1(39,31)=1-params(8);
g1(39,50)=1;
g1(39,51)=(-1);
g1(40,28)=1;
g1(40,44)=(-1);
g1(40,48)=1;
g1(41,10)=(-1);
g1(41,52)=1;

end
