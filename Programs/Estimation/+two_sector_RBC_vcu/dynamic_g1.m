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
    T = two_sector_RBC_vcu.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(25, 31);
g1(1,4)=(-1);
g1(1,6)=1;
g1(2,5)=(-1);
g1(3,6)=(-1);
g1(3,7)=1;
g1(3,10)=(-1);
g1(4,7)=(-1);
g1(4,12)=1;
g1(4,13)=1;
g1(5,8)=(-1);
g1(5,12)=1;
g1(5,14)=1;
g1(6,11)=1;
g1(6,12)=(-1);
g1(6,13)=(-1);
g1(6,16)=1;
g1(6,20)=1;
g1(7,11)=1;
g1(7,12)=(-1);
g1(7,14)=(-1);
g1(7,17)=1;
g1(7,20)=1;
g1(8,12)=(-1);
g1(8,15)=1/params(4);
g1(8,19)=(-1);
g1(9,8)=(-params(2));
g1(9,2)=(-(1-params(2)));
g1(9,18)=1;
g1(9,20)=T(1);
g1(10,6)=1;
g1(10,1)=(-((-params(5))/(1-params(8))*(-params(8))));
g1(10,10)=(-((-params(5))/(1-params(8))));
g1(10,19)=1;
g1(11,29)=(-(params(1)*T(1)));
g1(11,19)=1;
g1(11,30)=(-1);
g1(12,11)=(-params(3));
g1(12,20)=1;
g1(13,4)=1;
g1(13,25)=1;
g1(14,4)=(-1);
g1(14,7)=1;
g1(14,13)=(-(1-(1-params(6)*params(7))));
g1(14,16)=(-(1-params(6)*params(7)));
g1(14,20)=(-(1-params(6)*params(7)));
g1(14,21)=(-1);
g1(15,8)=1;
g1(15,14)=(-(1-(1-params(6)*params(7))));
g1(15,17)=(-(1-params(6)*params(7)));
g1(15,20)=(-(1-params(6)*params(7)));
g1(15,21)=(-1);
g1(16,13)=(-(1-T(2)));
g1(16,14)=(-T(2));
g1(16,15)=1;
g1(17,16)=(-(1-T(2)));
g1(17,17)=(-T(2));
g1(17,2)=1;
g1(18,7)=(-(1-T(2)));
g1(18,8)=(-T(2));
g1(18,9)=1;
g1(19,3)=(-params(10));
g1(19,21)=1;
g1(19,31)=(-1);
g1(20,4)=1;
g1(20,7)=(-1);
g1(20,23)=1;
g1(21,8)=(-1);
g1(21,24)=1;
g1(22,4)=1-T(2);
g1(22,7)=(-(1-T(2)));
g1(22,8)=(-T(2));
g1(22,22)=1;
g1(23,15)=params(7);
g1(23,2)=1-params(7);
g1(23,22)=(-1);
g1(23,28)=1;
g1(24,15)=1;
g1(24,22)=(-1);
g1(24,26)=1;
g1(25,12)=(-1);
g1(25,15)=(-1);
g1(25,22)=1;
g1(25,27)=1;

end
