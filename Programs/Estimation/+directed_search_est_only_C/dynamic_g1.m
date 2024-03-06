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
    T = directed_search_est_only_C.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(39, 56);
g1(1,10)=(-1);
g1(1,12)=1;
g1(1,13)=(-(T(10)*(1-T(11))));
g1(2,11)=(-1);
g1(3,12)=(-1);
g1(3,15)=1;
g1(3,19)=(-1);
g1(4,13)=(-(T(5)*T(10)+params(13)*T(8)*T(10)*(T(5)-T(11))/params(8)*(1-T(10))));
g1(4,18)=1;
g1(5,10)=(-T(12));
g1(5,13)=(-(T(10)*T(12)));
g1(5,15)=(-(1-T(12)));
g1(5,18)=1;
g1(5,22)=1;
g1(5,23)=1;
g1(6,16)=(-(1-T(12)));
g1(6,22)=1;
g1(6,24)=1;
g1(7,21)=1;
g1(7,22)=(-1);
g1(7,23)=(-1);
g1(7,2)=1;
g1(7,30)=1;
g1(8,20)=1;
g1(8,22)=(-1);
g1(8,24)=(-1);
g1(8,3)=1;
g1(8,31)=1;
g1(9,22)=(-1);
g1(9,25)=1/params(5);
g1(9,29)=(-1);
g1(9,36)=1;
g1(10,16)=(-params(3));
g1(10,4)=(-(1-params(3)));
g1(10,28)=1;
g1(10,30)=(1-params(10))*T(1);
g1(10,31)=params(10)*T(1);
g1(11,13)=1;
g1(11,19)=(-1);
g1(11,37)=1;
g1(12,12)=1;
g1(12,1)=(-((-params(6))/(1-params(14))*(-params(14))));
g1(12,19)=(-((-params(6))/(1-params(14))));
g1(12,29)=1;
g1(13,14)=1;
g1(13,49)=(-params(2));
g1(13,51)=(-(params(2)*T(1)));
g1(13,29)=1;
g1(13,52)=(-1);
g1(14,14)=1;
g1(14,49)=(-params(2));
g1(14,50)=(-(params(2)*T(1)));
g1(14,29)=1;
g1(14,52)=(-1);
g1(15,14)=(-1);
g1(15,21)=1;
g1(15,30)=(-params(4));
g1(16,14)=(-1);
g1(16,20)=1;
g1(16,31)=(-params(4));
g1(17,14)=1;
g1(17,16)=(-(params(3)*params(12)));
g1(17,4)=params(3)*params(12);
g1(18,10)=1;
g1(18,43)=1;
g1(19,10)=(-(T(6)-(T(6)-1)));
g1(19,13)=(-(T(6)*T(10)*(1-T(5))-(T(6)-1)*T(10)));
g1(19,15)=1;
g1(19,23)=(-(params(9)*params(8)));
g1(19,2)=(-(T(3)*T(6)));
g1(19,30)=(-(T(3)*T(6)));
g1(19,33)=(-T(6));
g1(20,16)=1;
g1(20,24)=(-(params(9)*params(8)));
g1(20,3)=(-(T(3)*T(6)));
g1(20,31)=(-(T(3)*T(6)));
g1(20,34)=(-T(6));
g1(21,23)=(-(1-params(10)));
g1(21,24)=(-params(10));
g1(21,25)=1;
g1(22,26)=(-(1-params(10)));
g1(22,27)=(-params(10));
g1(22,28)=1;
g1(23,13)=(-((1-params(10))*T(10)));
g1(23,30)=(-((1-params(10))*T(3)));
g1(23,31)=(-(params(10)*T(3)));
g1(23,32)=1;
g1(24,15)=(-(1-params(10)));
g1(24,16)=(-params(10));
g1(24,17)=1;
g1(25,5)=(-params(15));
g1(25,33)=1;
g1(25,54)=(-1);
g1(26,6)=(-params(16));
g1(26,35)=1;
g1(26,53)=(-1);
g1(27,33)=(-1);
g1(27,34)=1;
g1(27,35)=(-1);
g1(28,8)=(-params(17));
g1(28,37)=1;
g1(28,56)=1;
g1(29,7)=(-(params(18)+params(19)));
g1(29,36)=1;
g1(29,55)=1;
g1(29,9)=(-(params(19)*(-params(18))));
g1(30,10)=1;
g1(30,15)=(-1);
g1(30,38)=1;
g1(31,16)=(-1);
g1(31,39)=1;
g1(32,10)=1-params(10);
g1(32,15)=(-(1-params(10)));
g1(32,16)=(-params(10));
g1(32,42)=1;
g1(33,22)=(-1);
g1(33,47)=1;
g1(34,25)=params(9);
g1(34,4)=1-params(9);
g1(34,42)=(-1);
g1(34,46)=1;
g1(35,25)=1;
g1(35,42)=(-1);
g1(35,44)=1;
g1(36,25)=(-1);
g1(36,42)=1;
g1(36,45)=1;
g1(36,47)=(-1);
g1(37,23)=(-1);
g1(37,40)=1;
g1(38,24)=(-1);
g1(38,41)=1;
g1(39,7)=(-1);
g1(39,48)=1;

end
