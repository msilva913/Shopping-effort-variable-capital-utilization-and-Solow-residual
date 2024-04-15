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
    T = BRS_growth_id.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(40, 65);
g1(1,22)=T(17)*getPowerDeriv(y(22),T(2),1);
g1(1,28)=T(18);
g1(1,32)=(-(1-params(8)));
g1(2,17)=(-(params(8)/y(34)));
g1(2,29)=T(3);
g1(2,33)=T(31);
g1(2,34)=(-((-(params(8)*y(17)))/(y(34)*y(34))));
g1(3,18)=(-(params(8)*y(37)/y(35)));
g1(3,29)=T(3);
g1(3,33)=T(31);
g1(3,35)=(-((-(params(8)*y(37)*y(18)))/(y(35)*y(35))));
g1(3,37)=(-(params(8)*y(18)/y(35)));
g1(4,17)=(-1);
g1(4,22)=T(17)*getPowerDeriv(y(22),1+T(2),1)/(1+T(2));
g1(4,28)=T(19);
g1(4,29)=T(5);
g1(4,33)=exp(y(29))*getPowerDeriv(y(33),T(4),1)/T(4);
g1(4,36)=1;
g1(5,56)=(-(T(8)*T(7)*params(2)*(1-params(8))));
g1(5,36)=y(37)*getPowerDeriv(y(36),(-params(1)),1);
g1(5,58)=(-(T(8)*T(21)*getPowerDeriv(y(58),(-params(1)),1)));
g1(5,37)=T(6);
g1(5,59)=(-(T(8)*T(7)*params(2)*T(20)));
g1(5,60)=(-(T(7)*T(21)*exp(y(60))*getPowerDeriv(exp(y(60)),(-params(1)),1)));
g1(6,56)=(-1);
g1(6,57)=1;
g1(7,17)=1;
g1(7,1)=(-(T(9)*T(24)*getPowerDeriv(y(1),T(11),1)));
g1(7,23)=(-(T(26)*getPowerDeriv(y(23),(1-params(8))*params(7),1)));
g1(7,25)=(-(T(9)*T(26)));
g1(7,34)=(-(T(9)*T(25)*T(23)*exp(y(25))*T(15)*T(12)*getPowerDeriv(y(34),params(8),1)));
g1(7,38)=(-(T(9)*T(25)*T(22)*T(32)));
g1(8,18)=1;
g1(8,2)=(-(T(10)*T(28)*getPowerDeriv(y(2),T(11),1)));
g1(8,24)=(-(T(30)*getPowerDeriv(y(24),(1-params(8))*params(7),1)));
g1(8,27)=(-(T(10)*T(30)));
g1(8,35)=(-(T(10)*T(29)*T(23)*exp(y(27))*T(16)*T(13)*getPowerDeriv(y(35),params(8),1)));
g1(8,38)=(-(T(10)*T(29)*T(27)*T(32)));
g1(9,18)=exp(y(38));
g1(9,1)=T(20);
g1(9,20)=(-exp(y(38)));
g1(9,2)=T(20);
g1(9,21)=(-exp(y(38)));
g1(9,38)=y(18)*exp(y(38))-exp(y(38))*(y(20)+y(21));
g1(10,17)=(-((1-params(8))*params(7)/y(23)));
g1(10,23)=(-((-((1-params(8))*params(7)*y(17)))/(y(23)*y(23))));
g1(10,32)=1-params(8);
g1(11,17)=(-(exp(y(38))*T(11)/y(1)));
g1(11,1)=(-(exp(y(38))*(-(y(17)*T(11)))/(y(1)*y(1))));
g1(11,30)=1-params(8);
g1(11,38)=(-(exp(y(38))*y(17)*T(11)/y(1)));
g1(12,18)=(-((1-params(8))*params(7)/y(24)));
g1(12,24)=(-((-((1-params(8))*params(7)*y(18)))/(y(24)*y(24))));
g1(12,32)=(1-params(8))/y(37);
g1(12,37)=(-((1-params(8))*y(32)))/(y(37)*y(37));
g1(13,18)=(-(exp(y(38))*T(11)/y(2)));
g1(13,2)=(-(exp(y(38))*(-(y(18)*T(11)))/(y(2)*y(2))));
g1(13,31)=(1-params(8))/y(37);
g1(13,37)=(-((1-params(8))*y(31)))/(y(37)*y(37));
g1(13,38)=(-(exp(y(38))*y(18)*T(11)/y(2)));
g1(14,22)=1;
g1(14,23)=(-1);
g1(14,24)=(-1);
g1(15,19)=1;
g1(15,20)=(-1);
g1(15,21)=(-1);
g1(16,33)=1;
g1(16,34)=(-1);
g1(16,35)=(-1);
g1(17,16)=1;
g1(17,17)=(-1);
g1(17,18)=(-params(16));
g1(18,7)=(-params(11));
g1(18,38)=1;
g1(18,61)=(-1);
g1(19,3)=(-params(12));
g1(19,25)=1;
g1(19,62)=(-1);
g1(20,26)=1;
g1(20,4)=(-params(13));
g1(20,63)=(-1);
g1(21,25)=(-1);
g1(21,26)=(-1);
g1(21,27)=1;
g1(22,5)=(-params(14));
g1(22,28)=1;
g1(22,64)=1;
g1(23,6)=(-params(15));
g1(23,29)=1;
g1(23,65)=1;
g1(24,16)=(-(1/y(16)));
g1(24,39)=1;
g1(25,17)=(-(1/y(17)));
g1(25,40)=1;
g1(26,18)=(-(1/y(18)));
g1(26,41)=1;
g1(27,22)=(-(1/y(22)));
g1(27,42)=1;
g1(28,23)=(-(1/y(23)));
g1(28,43)=1;
g1(29,24)=(-(1/y(24)));
g1(29,44)=1;
g1(30,39)=(-1);
g1(30,42)=1;
g1(30,45)=1;
g1(31,33)=(-(1/y(33)));
g1(31,46)=1;
g1(32,37)=(-(1/y(37)));
g1(32,47)=1;
g1(33,38)=(-1);
g1(33,9)=1;
g1(33,40)=(-1);
g1(33,48)=1;
g1(34,38)=(-1);
g1(34,10)=1;
g1(34,41)=(-1);
g1(34,49)=1;
g1(35,38)=(-1);
g1(35,8)=1;
g1(35,39)=(-1);
g1(35,50)=1;
g1(36,38)=(-1);
g1(36,14)=1;
g1(36,45)=(-1);
g1(36,51)=1;
g1(37,15)=1;
g1(37,47)=(-1);
g1(37,52)=1;
g1(38,11)=1;
g1(38,42)=(-1);
g1(38,55)=1;
g1(39,12)=1;
g1(39,43)=(-1);
g1(39,53)=1;
g1(40,13)=1;
g1(40,44)=(-1);
g1(40,54)=1;

end
