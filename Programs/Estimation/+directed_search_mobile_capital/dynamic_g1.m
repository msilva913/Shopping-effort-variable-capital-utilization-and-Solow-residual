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
    T = directed_search_mobile_capital.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(40, 55);
g1(1,9)=(-1);
g1(1,11)=1;
g1(1,12)=(-(T(10)*T(12)));
g1(2,10)=(-1);
g1(2,13)=(-(T(10)*T(12)));
g1(3,11)=(-1);
g1(3,15)=1;
g1(3,20)=(-1);
g1(4,12)=(-(T(5)*T(10)+T(13)));
g1(4,18)=1;
g1(5,13)=(-(T(5)*T(10)+T(13)));
g1(5,19)=1;
g1(6,9)=(-T(14));
g1(6,12)=(-(T(10)*T(14)));
g1(6,15)=(-(1-T(14)));
g1(6,18)=1;
g1(6,25)=1;
g1(6,26)=1;
g1(7,10)=(-T(14));
g1(7,13)=(-(T(10)*T(14)));
g1(7,16)=(-(1-T(14)));
g1(7,19)=1;
g1(7,25)=1;
g1(7,27)=1;
g1(8,24)=1;
g1(8,25)=(-1);
g1(8,26)=(-1);
g1(8,29)=1;
g1(8,33)=1;
g1(9,23)=1;
g1(9,25)=(-1);
g1(9,27)=(-1);
g1(9,30)=1;
g1(9,34)=1;
g1(10,25)=(-1);
g1(10,28)=1/params(5);
g1(10,32)=(-1);
g1(10,37)=1;
g1(11,1)=(-params(3));
g1(11,2)=(-(1-params(3)));
g1(11,31)=1;
g1(11,3)=(1-params(10))*T(1);
g1(11,4)=params(10)*T(1);
g1(12,12)=1;
g1(12,20)=(-1);
g1(12,36)=1;
g1(13,11)=1;
g1(13,13)=1;
g1(13,16)=(-1);
g1(13,36)=1;
g1(14,11)=1;
g1(14,15)=T(15);
g1(14,17)=(-T(15));
g1(14,20)=params(6);
g1(14,32)=1;
g1(15,14)=1;
g1(15,49)=(-params(2));
g1(15,51)=(-(params(2)*T(1)));
g1(15,32)=1;
g1(15,52)=(-1);
g1(16,14)=1;
g1(16,49)=(-params(2));
g1(16,50)=(-(params(2)*T(1)));
g1(16,32)=1;
g1(16,52)=(-1);
g1(17,14)=(-1);
g1(17,24)=1;
g1(17,33)=(-params(4));
g1(18,14)=(-1);
g1(18,23)=1;
g1(18,34)=(-params(4));
g1(19,14)=1;
g1(19,16)=(-(params(3)*params(12)));
g1(19,31)=params(3)*params(12);
g1(20,9)=1;
g1(20,10)=(-1);
g1(20,41)=1;
g1(21,9)=(-(T(6)-(T(6)-1)));
g1(21,12)=(-(T(6)*T(10)*(1-T(5))-(T(6)-1)*T(10)));
g1(21,15)=1;
g1(21,26)=(-(params(9)*params(8)));
g1(21,29)=(-(T(3)*T(6)));
g1(21,33)=(-(T(3)*T(6)));
g1(21,35)=(-T(6));
g1(22,10)=(-(T(6)-(T(6)-1)));
g1(22,13)=(-(T(6)*T(10)*(1-T(5))-(T(6)-1)*T(10)));
g1(22,16)=1;
g1(22,27)=(-(params(9)*params(8)));
g1(22,30)=(-(T(3)*T(6)));
g1(22,34)=(-(T(3)*T(6)));
g1(22,35)=(-T(6));
g1(23,9)=(-(T(6)-(T(6)-1)));
g1(23,21)=1;
g1(23,26)=(-(params(9)*params(8)));
g1(23,29)=(-(T(3)*T(6)));
g1(23,35)=(-T(6));
g1(24,10)=(-(T(6)-(T(6)-1)));
g1(24,22)=1;
g1(24,27)=(-(params(9)*params(8)));
g1(24,30)=(-(T(3)*T(6)));
g1(24,35)=(-T(6));
g1(25,26)=(-(1-params(10)));
g1(25,27)=(-params(10));
g1(25,28)=1;
g1(26,29)=(-(1-params(10)));
g1(26,30)=(-params(10));
g1(26,31)=1;
g1(27,15)=(-(1-params(10)));
g1(27,16)=(-params(10));
g1(27,17)=1;
g1(28,5)=(-params(14));
g1(28,35)=1;
g1(28,53)=(-1);
g1(29,6)=(-params(16));
g1(29,36)=1;
g1(29,54)=1;
g1(30,7)=(-(params(18)+params(19)));
g1(30,37)=1;
g1(30,55)=1;
g1(30,8)=(-(params(19)*(-params(18))));
g1(31,9)=1;
g1(31,15)=(-1);
g1(31,39)=1;
g1(32,10)=1;
g1(32,16)=(-1);
g1(32,40)=1;
g1(33,9)=1-params(10);
g1(33,10)=params(10);
g1(33,15)=(-(1-params(10)));
g1(33,16)=(-params(10));
g1(33,38)=1;
g1(34,10)=1;
g1(34,25)=(-1);
g1(34,45)=1;
g1(35,9)=1-params(10);
g1(35,10)=params(10);
g1(35,21)=(-(1-params(10)));
g1(35,22)=(-params(10));
g1(35,47)=1;
g1(36,28)=params(9);
g1(36,31)=1-params(9);
g1(36,38)=(-1);
g1(36,44)=1;
g1(37,28)=params(9);
g1(37,31)=1-params(9);
g1(37,46)=1;
g1(37,47)=(-1);
g1(38,28)=1;
g1(38,38)=(-1);
g1(38,42)=1;
g1(39,28)=(-1);
g1(39,38)=1;
g1(39,43)=1;
g1(39,45)=(-1);
g1(40,7)=(-1);
g1(40,48)=1;

end
