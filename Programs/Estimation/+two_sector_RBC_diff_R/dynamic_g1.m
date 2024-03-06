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
    T = two_sector_RBC_diff_R.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(23, 32);
g1(1,7)=(-1);
g1(2,6)=(-1);
g1(2,10)=(-1);
g1(2,13)=1;
g1(2,14)=1;
g1(3,8)=(-1);
g1(3,13)=1;
g1(3,15)=1;
g1(4,6)=(-1);
g1(4,10)=(-1);
g1(4,11)=1;
g1(4,2)=1;
g1(5,8)=(-1);
g1(5,12)=1;
g1(5,3)=1;
g1(6,13)=(-1);
g1(6,16)=1/params(3);
g1(6,20)=(-1);
g1(7,8)=(-params(2));
g1(7,4)=(-(1-params(2)));
g1(7,19)=1;
g1(8,6)=1;
g1(8,1)=(-((-params(4))/(1-params(8))*(-params(8))));
g1(8,10)=(-((-params(4))/(1-params(8))));
g1(8,20)=1;
g1(9,29)=(-(params(1)*(1/params(1)-1+params(2))));
g1(9,20)=1;
g1(9,31)=(-1);
g1(10,29)=1;
g1(10,30)=(-1);
g1(11,6)=1;
g1(11,25)=1;
g1(12,10)=1;
g1(12,14)=(-(1-(1-params(5)*params(6))));
g1(12,2)=(-(1-params(5)*params(6)));
g1(12,21)=(-1);
g1(13,8)=1;
g1(13,15)=(-(1-(1-params(5)*params(6))));
g1(13,3)=(-(1-params(5)*params(6)));
g1(13,21)=(-1);
g1(14,14)=(-(1-T(1)));
g1(14,15)=(-T(1));
g1(14,16)=1;
g1(15,17)=(-(1-T(1)));
g1(15,18)=(-T(1));
g1(15,19)=1;
g1(16,6)=(-(1-T(1)));
g1(16,8)=(-T(1));
g1(16,9)=1;
g1(16,10)=(-(1-T(1)));
g1(17,5)=(-params(9));
g1(17,21)=1;
g1(17,32)=(-1);
g1(18,10)=(-1);
g1(18,23)=1;
g1(19,8)=(-1);
g1(19,24)=1;
g1(20,8)=(-T(1));
g1(20,10)=(-(1-T(1)));
g1(20,22)=1;
g1(21,16)=params(6);
g1(21,19)=1-params(6);
g1(21,22)=(-1);
g1(21,28)=1;
g1(22,16)=1;
g1(22,22)=(-1);
g1(22,26)=1;
g1(23,13)=(-1);
g1(23,16)=(-1);
g1(23,22)=1;
g1(23,27)=1;

end
