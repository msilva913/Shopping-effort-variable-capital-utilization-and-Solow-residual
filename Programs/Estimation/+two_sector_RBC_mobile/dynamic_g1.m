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
    T = two_sector_RBC_mobile.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(34, 49);
g1(1,9)=(-1);
g1(1,11)=1;
g1(2,10)=(-1);
g1(3,11)=(-1);
g1(3,13)=1;
g1(3,16)=(-1);
g1(4,13)=(-1);
g1(4,19)=1;
g1(4,20)=1;
g1(5,14)=(-1);
g1(5,19)=1;
g1(5,21)=1;
g1(6,18)=1;
g1(6,19)=(-1);
g1(6,20)=(-1);
g1(6,2)=1;
g1(6,27)=1;
g1(7,17)=1;
g1(7,19)=(-1);
g1(7,21)=(-1);
g1(7,3)=1;
g1(7,28)=1;
g1(8,19)=(-1);
g1(8,22)=1/params(4);
g1(8,26)=(-1);
g1(8,32)=1;
g1(9,14)=(-params(2));
g1(9,4)=(-(1-params(2)));
g1(9,25)=1;
g1(9,27)=T(1)*(1-T(2));
g1(9,28)=params(2)*(1-params(6)*params(7))/params(6);
g1(10,11)=1;
g1(10,1)=(-((-params(5))/(1-params(9))*(-params(9))));
g1(10,16)=(-((-params(5))/(1-params(9))));
g1(10,26)=1;
g1(11,12)=1;
g1(11,43)=(-params(1));
g1(11,45)=(-(params(1)*T(1)));
g1(11,26)=1;
g1(11,46)=(-1);
g1(12,12)=1;
g1(12,43)=(-params(1));
g1(12,44)=(-(params(1)*T(1)));
g1(12,26)=1;
g1(12,46)=(-1);
g1(13,12)=(-1);
g1(13,18)=1;
g1(13,27)=(-params(3));
g1(14,12)=(-1);
g1(14,17)=1;
g1(14,28)=(-params(3));
g1(15,12)=1;
g1(15,14)=(-(params(2)*params(8)));
g1(15,4)=params(2)*params(8);
g1(16,9)=1;
g1(16,38)=1;
g1(17,9)=(-1);
g1(17,13)=1;
g1(17,20)=(-(1-(1-params(6)*params(7))));
g1(17,2)=(-(1-params(6)*params(7)));
g1(17,27)=(-(1-params(6)*params(7)));
g1(17,29)=(-1);
g1(18,14)=1;
g1(18,21)=(-(1-(1-params(6)*params(7))));
g1(18,3)=(-(1-params(6)*params(7)));
g1(18,28)=(-(1-params(6)*params(7)));
g1(18,30)=(-1);
g1(19,20)=(-(1-T(2)));
g1(19,21)=(-T(2));
g1(19,22)=1;
g1(20,23)=(-(1-T(2)));
g1(20,24)=(-T(2));
g1(20,25)=1;
g1(21,13)=(-(1-T(2)));
g1(21,14)=(-T(2));
g1(21,15)=1;
g1(22,5)=(-params(10));
g1(22,29)=1;
g1(22,48)=(-1);
g1(23,6)=(-params(11));
g1(23,31)=1;
g1(23,47)=(-1);
g1(24,29)=(-1);
g1(24,30)=1;
g1(24,31)=(-1);
g1(25,7)=(-(params(12)+params(13)));
g1(25,32)=1;
g1(25,49)=1;
g1(25,8)=(-(params(13)*(-params(12))));
g1(26,9)=1;
g1(26,13)=(-1);
g1(26,34)=1;
g1(27,14)=(-1);
g1(27,35)=1;
g1(28,9)=1-T(2);
g1(28,13)=(-(1-T(2)));
g1(28,14)=(-T(2));
g1(28,33)=1;
g1(29,22)=params(7);
g1(29,4)=1-params(7);
g1(29,33)=(-1);
g1(29,41)=1;
g1(30,22)=1;
g1(30,33)=(-1);
g1(30,39)=1;
g1(31,19)=(-1);
g1(31,22)=(-1);
g1(31,33)=1;
g1(31,40)=1;
g1(32,20)=(-1);
g1(32,36)=1;
g1(33,21)=(-1);
g1(33,37)=1;
g1(34,7)=(-1);
g1(34,42)=1;

end
