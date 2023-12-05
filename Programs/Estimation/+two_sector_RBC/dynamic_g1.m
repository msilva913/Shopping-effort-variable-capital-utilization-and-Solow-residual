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
    T = two_sector_RBC.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(37, 53);
g1(1,10)=(-1);
g1(1,12)=1;
g1(2,11)=(-1);
g1(3,12)=(-1);
g1(3,15)=1;
g1(3,20)=(-1);
g1(4,15)=(-1);
g1(4,25)=1;
g1(4,26)=1;
g1(5,16)=(-1);
g1(5,25)=1;
g1(5,27)=1;
g1(6,24)=1;
g1(6,25)=(-1);
g1(6,26)=(-1);
g1(6,29)=1;
g1(6,33)=1;
g1(7,23)=1;
g1(7,25)=(-1);
g1(7,27)=(-1);
g1(7,30)=1;
g1(7,34)=1;
g1(8,12)=1;
g1(8,20)=params(6);
g1(8,25)=(-1);
g1(8,28)=1/params(5);
g1(8,36)=1;
g1(9,1)=(-params(3));
g1(9,3)=(-(1-params(3)));
g1(9,29)=1;
g1(9,5)=T(1)*(1-T(2));
g1(10,2)=(-params(3));
g1(10,4)=(-(1-params(3)));
g1(10,30)=1;
g1(10,6)=params(3)*(1-params(8)*params(9))/params(8);
g1(11,12)=1;
g1(11,20)=params(6);
g1(11,32)=1;
g1(12,13)=1;
g1(12,47)=(-params(2));
g1(12,50)=(-(params(2)*T(1)));
g1(12,32)=1;
g1(12,51)=(-1);
g1(13,14)=1;
g1(13,48)=(-params(2));
g1(13,49)=(-(params(2)*T(1)));
g1(13,32)=1;
g1(13,51)=(-1);
g1(14,13)=(-1);
g1(14,24)=1;
g1(14,33)=(-params(4));
g1(15,14)=(-1);
g1(15,23)=1;
g1(15,34)=(-params(4));
g1(16,13)=1;
g1(16,17)=(-(params(3)*params(10)));
g1(16,29)=params(3)*params(10);
g1(17,14)=1;
g1(17,18)=(-(params(3)*params(10)));
g1(17,30)=params(3)*params(10);
g1(18,10)=1;
g1(18,40)=1;
g1(19,10)=(-1);
g1(19,15)=1;
g1(19,26)=(-(1-(1-params(8)*params(9))));
g1(19,29)=(-(1-params(8)*params(9)));
g1(19,33)=(-(1-params(8)*params(9)));
g1(19,35)=(-1);
g1(20,16)=1;
g1(20,27)=(-(1-(1-params(8)*params(9))));
g1(20,30)=(-(1-params(8)*params(9)));
g1(20,34)=(-(1-params(8)*params(9)));
g1(20,35)=(-1);
g1(21,10)=(-1);
g1(21,21)=1;
g1(21,26)=(-(1-(1-params(8)*params(9))));
g1(21,29)=(-(1-params(8)*params(9)));
g1(21,35)=(-1);
g1(22,22)=1;
g1(22,27)=(-(1-(1-params(8)*params(9))));
g1(22,30)=(-(1-params(8)*params(9)));
g1(22,35)=(-1);
g1(23,26)=(-(1-T(2)));
g1(23,27)=(-T(2));
g1(23,28)=1;
g1(24,29)=(-(1-T(2)));
g1(24,30)=(-T(2));
g1(24,31)=1;
g1(25,16)=1;
g1(25,17)=(-(1-T(2)));
g1(25,18)=(-T(2));
g1(26,15)=(-(1-T(2)));
g1(26,16)=(-T(2));
g1(26,19)=1;
g1(27,7)=(-params(11));
g1(27,35)=1;
g1(27,52)=(-1);
g1(28,8)=(-(params(13)+params(14)));
g1(28,36)=1;
g1(28,53)=1;
g1(28,9)=(-(params(14)*(-params(13))));
g1(29,10)=1;
g1(29,15)=(-1);
g1(29,38)=1;
g1(30,16)=(-1);
g1(30,39)=1;
g1(31,10)=1-T(2);
g1(31,15)=(-(1-T(2)));
g1(31,16)=(-T(2));
g1(31,37)=1;
g1(32,10)=1-T(2);
g1(32,21)=(-(1-T(2)));
g1(32,22)=(-T(2));
g1(32,45)=1;
g1(33,28)=params(9);
g1(33,31)=1-params(9);
g1(33,37)=(-1);
g1(33,43)=1;
g1(34,28)=params(9);
g1(34,31)=1-params(9);
g1(34,44)=1;
g1(34,45)=(-1);
g1(35,28)=1;
g1(35,37)=(-1);
g1(35,41)=1;
g1(36,25)=(-1);
g1(36,28)=(-1);
g1(36,37)=1;
g1(36,42)=1;
g1(37,8)=(-1);
g1(37,46)=1;

end
