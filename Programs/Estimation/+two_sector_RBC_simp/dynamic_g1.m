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
    T = two_sector_RBC_simp.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(24, 30);
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
g1(7,11)=1;
g1(7,12)=(-1);
g1(7,14)=(-1);
g1(7,17)=1;
g1(8,12)=(-1);
g1(8,15)=1/params(3);
g1(8,19)=(-1);
g1(9,8)=(-params(2));
g1(9,2)=(-(1-params(2)));
g1(9,18)=1;
g1(10,6)=1;
g1(10,1)=(-((-params(4))/(1-params(9))*(-params(9))));
g1(10,10)=(-((-params(4))/(1-params(9))));
g1(10,19)=1;
g1(11,28)=(-(params(1)*(1/params(1)-1+params(2))));
g1(11,19)=1;
g1(11,29)=(-1);
g1(12,4)=1;
g1(12,24)=1;
g1(13,4)=(-1);
g1(13,7)=1;
g1(13,13)=(-(1-(1-params(6)*params(7))));
g1(13,16)=(-(1-params(6)*params(7)));
g1(13,20)=(-1);
g1(14,8)=1;
g1(14,14)=(-(1-(1-params(6)*params(7))));
g1(14,17)=(-(1-params(6)*params(7)));
g1(14,20)=(-1);
g1(15,13)=(-(1-T(1)));
g1(15,14)=(-T(1));
g1(15,15)=1;
g1(16,16)=(-(1-T(1)));
g1(16,17)=(-T(1));
g1(16,2)=1;
g1(17,7)=(-(1-T(1)));
g1(17,8)=(-T(1));
g1(17,9)=1;
g1(18,3)=(-params(10));
g1(18,20)=1;
g1(18,30)=(-1);
g1(19,4)=1;
g1(19,7)=(-1);
g1(19,22)=1;
g1(20,8)=(-1);
g1(20,23)=1;
g1(21,4)=1-T(1);
g1(21,7)=(-(1-T(1)));
g1(21,8)=(-T(1));
g1(21,21)=1;
g1(22,15)=params(7);
g1(22,18)=1-params(7);
g1(22,21)=(-1);
g1(22,27)=1;
g1(23,15)=1;
g1(23,21)=(-1);
g1(23,25)=1;
g1(24,12)=(-1);
g1(24,15)=(-1);
g1(24,21)=1;
g1(24,26)=1;

end
