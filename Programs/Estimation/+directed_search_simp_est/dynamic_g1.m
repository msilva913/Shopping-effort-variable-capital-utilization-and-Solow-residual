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
    T = directed_search_simp_est.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(43, 58);
g1(1,8)=(-1);
g1(1,10)=1;
g1(1,11)=(-(T(10)*T(13)));
g1(2,9)=(-1);
g1(2,12)=(-(T(10)*T(13)));
g1(3,10)=(-1);
g1(3,14)=1;
g1(3,19)=(-1);
g1(4,11)=(-(T(5)*T(10)+T(14)));
g1(4,17)=1;
g1(5,12)=(-(T(5)*T(10)+T(14)));
g1(5,18)=1;
g1(6,8)=(-T(15));
g1(6,11)=(-(T(10)*T(15)));
g1(6,14)=(-(1-T(15)));
g1(6,17)=1;
g1(6,24)=1;
g1(6,25)=1;
g1(7,9)=(-T(15));
g1(7,12)=(-(T(10)*T(15)));
g1(7,15)=(-(1-T(15)));
g1(7,18)=1;
g1(7,24)=1;
g1(7,26)=1;
g1(8,23)=1;
g1(8,24)=(-1);
g1(8,25)=(-1);
g1(8,1)=1;
g1(8,32)=1;
g1(9,22)=1;
g1(9,24)=(-1);
g1(9,26)=(-1);
g1(9,2)=1;
g1(9,33)=1;
g1(10,24)=(-1);
g1(10,27)=1/params(5);
g1(10,31)=(-1);
g1(11,15)=(-params(3));
g1(11,3)=(-(1-params(3)));
g1(11,30)=1;
g1(11,32)=(1-params(10))*T(1);
g1(11,33)=params(10)*T(1);
g1(12,11)=1;
g1(12,19)=(-1);
g1(12,37)=1;
g1(13,10)=1;
g1(13,12)=1;
g1(13,15)=(-1);
g1(13,37)=1;
g1(13,38)=1;
g1(14,10)=1;
g1(14,14)=(-(T(12)*T(16)));
g1(14,16)=(-(T(16)*(-T(12))));
g1(14,19)=params(6);
g1(14,31)=1;
g1(15,13)=1;
g1(15,51)=(-params(2));
g1(15,53)=(-(params(2)*T(1)));
g1(15,31)=1;
g1(15,54)=(-1);
g1(16,13)=1;
g1(16,51)=(-params(2));
g1(16,52)=(-(params(2)*T(1)));
g1(16,31)=1;
g1(16,54)=(-1);
g1(17,13)=(-1);
g1(17,23)=1;
g1(17,32)=(-params(4));
g1(18,13)=(-1);
g1(18,22)=1;
g1(18,33)=(-params(4));
g1(19,13)=1;
g1(19,15)=(-(params(3)*params(12)));
g1(19,3)=params(3)*params(12);
g1(20,8)=1;
g1(20,9)=(-1);
g1(20,44)=1;
g1(21,8)=(-(T(6)-(T(6)-1)));
g1(21,11)=(-(T(6)*T(10)*(1-T(5))-(T(6)-1)*T(10)));
g1(21,14)=1;
g1(21,25)=(-(params(9)*params(8)));
g1(21,1)=(-(T(3)*T(6)));
g1(21,32)=(-(T(3)*T(6)));
g1(21,34)=(-T(6));
g1(22,9)=(-(T(6)-(T(6)-1)));
g1(22,12)=(-(T(6)*T(10)*(1-T(5))-(T(6)-1)*T(10)));
g1(22,15)=1;
g1(22,26)=(-(params(9)*params(8)));
g1(22,2)=(-(T(3)*T(6)));
g1(22,33)=(-(T(3)*T(6)));
g1(22,35)=(-T(6));
g1(23,8)=(-(T(6)-(T(6)-1)));
g1(23,20)=1;
g1(23,25)=(-(params(9)*params(8)));
g1(23,1)=(-(T(3)*T(6)));
g1(23,34)=(-T(6));
g1(24,9)=(-(T(6)-(T(6)-1)));
g1(24,21)=1;
g1(24,26)=(-(params(9)*params(8)));
g1(24,2)=(-(T(3)*T(6)));
g1(24,35)=(-T(6));
g1(25,25)=(-(1-params(10)));
g1(25,26)=(-params(10));
g1(25,27)=1;
g1(26,28)=(-(1-params(10)));
g1(26,29)=(-params(10));
g1(26,30)=1;
g1(27,14)=(-(1-params(10)));
g1(27,15)=(-params(10));
g1(27,16)=1;
g1(28,4)=(-params(14));
g1(28,34)=1;
g1(28,56)=(-1);
g1(29,5)=(-params(15));
g1(29,36)=1;
g1(29,55)=(-1);
g1(30,34)=(-1);
g1(30,35)=1;
g1(30,36)=(-1);
g1(31,6)=(-params(16));
g1(31,37)=1;
g1(31,57)=1;
g1(32,7)=(-params(17));
g1(32,38)=1;
g1(32,58)=1;
g1(33,8)=1;
g1(33,14)=(-1);
g1(33,39)=1;
g1(34,9)=1;
g1(34,15)=(-1);
g1(34,40)=1;
g1(35,8)=1-params(10);
g1(35,9)=params(10);
g1(35,14)=(-(1-params(10)));
g1(35,15)=(-params(10));
g1(35,43)=1;
g1(36,9)=1;
g1(36,24)=(-1);
g1(36,48)=1;
g1(37,8)=1-params(10);
g1(37,9)=params(10);
g1(37,20)=(-(1-params(10)));
g1(37,21)=(-params(10));
g1(37,50)=1;
g1(38,27)=params(9);
g1(38,3)=1-params(9);
g1(38,43)=(-1);
g1(38,47)=1;
g1(39,27)=params(9);
g1(39,3)=1-params(9);
g1(39,49)=1;
g1(39,50)=(-1);
g1(40,27)=1;
g1(40,43)=(-1);
g1(40,45)=1;
g1(41,27)=(-1);
g1(41,43)=1;
g1(41,46)=1;
g1(41,48)=(-1);
g1(42,25)=(-1);
g1(42,41)=1;
g1(43,26)=(-1);
g1(43,42)=1;

end
