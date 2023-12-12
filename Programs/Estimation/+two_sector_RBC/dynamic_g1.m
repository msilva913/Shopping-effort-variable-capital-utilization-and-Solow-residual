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
g1 = zeros(37, 54);
g1(1,11)=(-1);
g1(1,13)=1;
g1(2,12)=(-1);
g1(3,13)=(-1);
g1(3,16)=1;
g1(3,21)=(-1);
g1(4,16)=(-1);
g1(4,26)=1;
g1(4,27)=1;
g1(5,17)=(-1);
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
g1(8,26)=(-1);
g1(8,29)=1/params(5);
g1(8,33)=(-1);
g1(8,37)=1;
g1(9,1)=(-params(3));
g1(9,4)=(-(1-params(3)));
g1(9,30)=1;
g1(9,6)=T(1)*(1-T(2));
g1(10,2)=(-params(3));
g1(10,5)=(-(1-params(3)));
g1(10,31)=1;
g1(10,7)=params(3)*(1-params(8)*params(9))/params(8);
g1(11,13)=1;
g1(11,3)=(-((-params(6))/(1-params(11))*(-params(11))));
g1(11,21)=(-((-params(6))/(1-params(11))));
g1(11,33)=1;
g1(12,14)=1;
g1(12,48)=(-params(2));
g1(12,51)=(-(params(2)*T(1)));
g1(12,33)=1;
g1(12,52)=(-1);
g1(13,15)=1;
g1(13,49)=(-params(2));
g1(13,50)=(-(params(2)*T(1)));
g1(13,33)=1;
g1(13,52)=(-1);
g1(14,14)=(-1);
g1(14,25)=1;
g1(14,34)=(-params(4));
g1(15,15)=(-1);
g1(15,24)=1;
g1(15,35)=(-params(4));
g1(16,14)=1;
g1(16,18)=(-(params(3)*params(10)));
g1(16,30)=params(3)*params(10);
g1(17,15)=1;
g1(17,19)=(-(params(3)*params(10)));
g1(17,31)=params(3)*params(10);
g1(18,11)=1;
g1(18,41)=1;
g1(19,11)=(-1);
g1(19,16)=1;
g1(19,27)=(-(1-(1-params(8)*params(9))));
g1(19,30)=(-(1-params(8)*params(9)));
g1(19,34)=(-(1-params(8)*params(9)));
g1(19,36)=(-1);
g1(20,17)=1;
g1(20,28)=(-(1-(1-params(8)*params(9))));
g1(20,31)=(-(1-params(8)*params(9)));
g1(20,35)=(-(1-params(8)*params(9)));
g1(20,36)=(-1);
g1(21,11)=(-1);
g1(21,22)=1;
g1(21,27)=(-(1-(1-params(8)*params(9))));
g1(21,30)=(-(1-params(8)*params(9)));
g1(21,36)=(-1);
g1(22,23)=1;
g1(22,28)=(-(1-(1-params(8)*params(9))));
g1(22,31)=(-(1-params(8)*params(9)));
g1(22,36)=(-1);
g1(23,27)=(-(1-T(2)));
g1(23,28)=(-T(2));
g1(23,29)=1;
g1(24,30)=(-(1-T(2)));
g1(24,31)=(-T(2));
g1(24,32)=1;
g1(25,17)=1;
g1(25,18)=(-(1-T(2)));
g1(25,19)=(-T(2));
g1(26,16)=(-(1-T(2)));
g1(26,17)=(-T(2));
g1(26,20)=1;
g1(27,8)=(-params(12));
g1(27,36)=1;
g1(27,53)=(-1);
g1(28,9)=(-(params(14)+params(15)));
g1(28,37)=1;
g1(28,54)=1;
g1(28,10)=(-(params(15)*(-params(14))));
g1(29,11)=1;
g1(29,16)=(-1);
g1(29,39)=1;
g1(30,17)=(-1);
g1(30,40)=1;
g1(31,11)=1-T(2);
g1(31,16)=(-(1-T(2)));
g1(31,17)=(-T(2));
g1(31,38)=1;
g1(32,11)=1-T(2);
g1(32,22)=(-(1-T(2)));
g1(32,23)=(-T(2));
g1(32,46)=1;
g1(33,29)=params(9);
g1(33,32)=1-params(9);
g1(33,38)=(-1);
g1(33,44)=1;
g1(34,29)=params(9);
g1(34,32)=1-params(9);
g1(34,45)=1;
g1(34,46)=(-1);
g1(35,29)=1;
g1(35,38)=(-1);
g1(35,42)=1;
g1(36,26)=(-1);
g1(36,29)=(-1);
g1(36,38)=1;
g1(36,43)=1;
g1(37,9)=(-1);
g1(37,47)=1;

end
