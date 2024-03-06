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
    T = directed_search_simp.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(38, 53);
g1(1,9)=(-1);
g1(1,11)=1;
g1(1,12)=(-(T(3)*T(6)));
g1(2,10)=(-1);
g1(2,13)=(-(T(3)*T(6)));
g1(3,11)=(-1);
g1(3,14)=1;
g1(3,19)=(-1);
g1(4,12)=(-T(7));
g1(4,17)=1;
g1(5,13)=(-T(7));
g1(5,18)=1;
g1(6,14)=(-1);
g1(6,17)=1;
g1(6,22)=1;
g1(6,23)=1;
g1(7,15)=(-1);
g1(7,18)=1;
g1(7,22)=1;
g1(7,24)=1;
g1(8,21)=1;
g1(8,22)=(-1);
g1(8,23)=(-1);
g1(8,1)=1;
g1(9,20)=1;
g1(9,22)=(-1);
g1(9,24)=(-1);
g1(9,2)=1;
g1(10,22)=(-1);
g1(10,25)=1/params(4);
g1(10,29)=(-1);
g1(10,34)=1;
g1(11,15)=(-params(3));
g1(11,3)=(-(1-params(3)));
g1(11,28)=1;
g1(12,12)=1;
g1(12,19)=(-1);
g1(12,35)=1;
g1(13,11)=1;
g1(13,13)=1;
g1(13,15)=(-1);
g1(13,35)=1;
g1(14,11)=1;
g1(14,14)=T(8);
g1(14,16)=(-T(8));
g1(14,19)=params(5);
g1(14,29)=1;
g1(15,48)=(-T(1));
g1(15,29)=1;
g1(15,49)=(-1);
g1(16,47)=(-T(1));
g1(16,29)=1;
g1(16,49)=(-1);
g1(17,9)=1;
g1(17,10)=(-1);
g1(17,41)=1;
g1(18,9)=(-1);
g1(18,12)=(-T(3));
g1(18,14)=1;
g1(18,23)=(-(1-(1-params(6)*params(7))));
g1(18,1)=(-(1-params(6)*params(7)));
g1(18,31)=(-1);
g1(19,10)=(-1);
g1(19,13)=(-T(3));
g1(19,15)=1;
g1(19,24)=(-(1-(1-params(6)*params(7))));
g1(19,2)=(-(1-params(6)*params(7)));
g1(19,32)=(-1);
g1(20,23)=(-T(5));
g1(20,24)=(-T(2));
g1(20,25)=1;
g1(21,26)=(-T(5));
g1(21,27)=(-T(2));
g1(21,28)=1;
g1(22,12)=(-(T(3)*T(5)));
g1(22,13)=(-(T(2)*T(3)));
g1(22,30)=1;
g1(23,14)=(-T(5));
g1(23,15)=(-T(2));
g1(23,16)=1;
g1(24,4)=(-params(10));
g1(24,31)=1;
g1(24,51)=(-1);
g1(25,5)=(-params(11));
g1(25,33)=1;
g1(25,50)=(-1);
g1(26,31)=(-1);
g1(26,32)=1;
g1(26,33)=(-1);
g1(27,7)=(-params(12));
g1(27,35)=1;
g1(27,53)=1;
g1(28,6)=(-(params(13)+params(14)));
g1(28,34)=1;
g1(28,52)=1;
g1(28,8)=(-(params(14)*(-params(13))));
g1(29,9)=1;
g1(29,14)=(-1);
g1(29,36)=1;
g1(30,10)=1;
g1(30,15)=(-1);
g1(30,37)=1;
g1(31,9)=T(5);
g1(31,10)=T(2);
g1(31,14)=(-T(5));
g1(31,15)=(-T(2));
g1(31,40)=1;
g1(32,10)=1;
g1(32,22)=(-1);
g1(32,45)=1;
g1(33,25)=params(7);
g1(33,3)=1-params(7);
g1(33,40)=(-1);
g1(33,44)=1;
g1(34,25)=1;
g1(34,40)=(-1);
g1(34,42)=1;
g1(35,25)=(-1);
g1(35,40)=1;
g1(35,43)=1;
g1(35,45)=(-1);
g1(36,23)=(-1);
g1(36,38)=1;
g1(37,24)=(-1);
g1(37,39)=1;
g1(38,6)=(-1);
g1(38,46)=1;

end
