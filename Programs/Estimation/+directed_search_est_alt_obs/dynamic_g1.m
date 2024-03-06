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
    T = directed_search_est_alt_obs.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(46, 67);
g1(1,13)=(-1);
g1(1,15)=1;
g1(1,16)=(-(T(10)*T(14)));
g1(2,14)=(-1);
g1(2,17)=(-(T(10)*T(14)));
g1(3,15)=(-1);
g1(3,19)=1;
g1(3,24)=(-1);
g1(4,16)=(-(T(5)*T(10)+T(15)));
g1(4,22)=1;
g1(5,17)=(-(T(5)*T(10)+T(15)));
g1(5,23)=1;
g1(6,13)=(-T(16));
g1(6,16)=(-(T(10)*T(16)));
g1(6,19)=(-(1-T(16)));
g1(6,22)=1;
g1(6,29)=1;
g1(6,30)=1;
g1(7,14)=(-T(16));
g1(7,17)=(-(T(10)*T(16)));
g1(7,20)=(-(1-T(16)));
g1(7,23)=1;
g1(7,29)=1;
g1(7,31)=1;
g1(8,28)=1;
g1(8,29)=(-1);
g1(8,30)=(-1);
g1(8,4)=1;
g1(8,37)=1;
g1(9,27)=1;
g1(9,29)=(-1);
g1(9,31)=(-1);
g1(9,5)=1;
g1(9,38)=1;
g1(10,29)=(-1);
g1(10,32)=1/params(5);
g1(10,36)=(-1);
g1(10,43)=1;
g1(11,20)=(-params(3));
g1(11,6)=(-(1-params(3)));
g1(11,35)=1;
g1(11,37)=(1-params(10))*T(1);
g1(11,38)=params(10)*T(1);
g1(12,16)=1;
g1(12,24)=(-1);
g1(12,44)=1;
g1(13,15)=1;
g1(13,17)=1;
g1(13,20)=(-1);
g1(13,44)=1;
g1(13,45)=1;
g1(14,15)=1;
g1(14,1)=(-(T(17)*(-(params(14)*T(12)))));
g1(14,19)=(-(T(12)*T(17)));
g1(14,2)=(-(T(17)*(-(params(14)*(-T(12))))));
g1(14,21)=(-(T(17)*(-T(12))));
g1(14,3)=(-(T(17)*(-(params(14)*T(13)))));
g1(14,24)=(-(T(13)*T(17)));
g1(14,36)=1;
g1(15,18)=1;
g1(15,59)=(-params(2));
g1(15,61)=(-(params(2)*T(1)));
g1(15,36)=1;
g1(15,62)=(-1);
g1(16,18)=1;
g1(16,59)=(-params(2));
g1(16,60)=(-(params(2)*T(1)));
g1(16,36)=1;
g1(16,62)=(-1);
g1(17,18)=(-1);
g1(17,28)=1;
g1(17,37)=(-params(4));
g1(18,18)=(-1);
g1(18,27)=1;
g1(18,38)=(-params(4));
g1(19,18)=1;
g1(19,20)=(-(params(3)*params(12)));
g1(19,6)=params(3)*params(12);
g1(20,13)=1;
g1(20,14)=(-1);
g1(20,51)=1;
g1(21,13)=(-(T(6)-(T(6)-1)));
g1(21,16)=(-(T(6)*T(10)*(1-T(5))-(T(6)-1)*T(10)));
g1(21,19)=1;
g1(21,30)=(-(params(9)*params(8)));
g1(21,4)=(-(T(3)*T(6)));
g1(21,37)=(-(T(3)*T(6)));
g1(21,40)=(-T(6));
g1(22,14)=(-(T(6)-(T(6)-1)));
g1(22,17)=(-(T(6)*T(10)*(1-T(5))-(T(6)-1)*T(10)));
g1(22,20)=1;
g1(22,31)=(-(params(9)*params(8)));
g1(22,5)=(-(T(3)*T(6)));
g1(22,38)=(-(T(3)*T(6)));
g1(22,41)=(-T(6));
g1(23,13)=(-(T(6)-(T(6)-1)));
g1(23,25)=1;
g1(23,30)=(-(params(9)*params(8)));
g1(23,4)=(-(T(3)*T(6)));
g1(23,40)=(-T(6));
g1(24,14)=(-(T(6)-(T(6)-1)));
g1(24,26)=1;
g1(24,31)=(-(params(9)*params(8)));
g1(24,5)=(-(T(3)*T(6)));
g1(24,41)=(-T(6));
g1(25,30)=(-(1-params(10)));
g1(25,31)=(-params(10));
g1(25,32)=1;
g1(26,33)=(-(1-params(10)));
g1(26,34)=(-params(10));
g1(26,35)=1;
g1(27,16)=(-((1-params(10))*T(10)));
g1(27,17)=(-(params(10)*T(10)));
g1(27,37)=(-((1-params(10))*T(3)));
g1(27,38)=(-(params(10)*T(3)));
g1(27,39)=1;
g1(28,19)=(-(1-params(10)));
g1(28,20)=(-params(10));
g1(28,21)=1;
g1(29,7)=(-params(15));
g1(29,40)=1;
g1(29,64)=(-1);
g1(30,8)=(-params(16));
g1(30,42)=1;
g1(30,63)=(-1);
g1(31,40)=(-1);
g1(31,41)=1;
g1(31,42)=(-1);
g1(32,10)=(-params(17));
g1(32,44)=1;
g1(32,66)=1;
g1(33,11)=(-params(18));
g1(33,45)=1;
g1(33,67)=1;
g1(34,9)=(-(params(19)+params(20)));
g1(34,43)=1;
g1(34,65)=1;
g1(34,12)=(-(params(20)*(-params(19))));
g1(35,13)=1;
g1(35,19)=(-1);
g1(35,46)=1;
g1(36,14)=1;
g1(36,20)=(-1);
g1(36,47)=1;
g1(37,13)=1-params(10);
g1(37,14)=params(10);
g1(37,19)=(-(1-params(10)));
g1(37,20)=(-params(10));
g1(37,50)=1;
g1(38,14)=1;
g1(38,29)=(-1);
g1(38,55)=1;
g1(39,13)=1-params(10);
g1(39,14)=params(10);
g1(39,25)=(-(1-params(10)));
g1(39,26)=(-params(10));
g1(39,57)=1;
g1(40,32)=params(9);
g1(40,6)=1-params(9);
g1(40,50)=(-1);
g1(40,54)=1;
g1(41,32)=params(9);
g1(41,6)=1-params(9);
g1(41,56)=1;
g1(41,57)=(-1);
g1(42,32)=1;
g1(42,50)=(-1);
g1(42,52)=1;
g1(43,32)=(-1);
g1(43,50)=1;
g1(43,53)=1;
g1(43,55)=(-1);
g1(44,30)=(-1);
g1(44,48)=1;
g1(45,31)=(-1);
g1(45,49)=1;
g1(46,9)=(-1);
g1(46,58)=1;

end
