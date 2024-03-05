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
    T = BRS_growth_sep.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(36, 59);
g1(1,20)=T(20)*getPowerDeriv(y(20),1/params(5),1);
g1(1,26)=T(21);
g1(1,30)=(-(T(4)*(1-T(2))));
g1(1,34)=(-(y(30)*(1-T(2))*T(38)));
g1(2,15)=(-(T(2)/y(32)));
g1(2,27)=T(5);
g1(2,31)=T(35);
g1(2,32)=(-((-(T(2)*y(15)))/(y(32)*y(32))));
g1(3,16)=(-(T(2)*y(35)/y(33)));
g1(3,27)=T(5);
g1(3,31)=T(35);
g1(3,33)=(-((-(y(16)*T(2)*y(35)))/(y(33)*y(33))));
g1(3,35)=(-(T(2)*y(16)/y(33)));
g1(4,15)=(-1);
g1(4,27)=T(6);
g1(4,31)=exp(y(27))*getPowerDeriv(y(31),T(3),1)/T(3);
g1(4,34)=1;
g1(5,50)=(-(T(8)*T(7)*(1-T(2))*T(9)));
g1(5,34)=y(35)*T(38);
g1(5,52)=(-(T(8)*T(23)*getPowerDeriv(y(52),(-params(1)),1)));
g1(5,35)=T(4);
g1(5,53)=(-(T(8)*T(7)*T(9)*T(22)));
g1(5,54)=(-(T(7)*T(23)*exp(y(54))*getPowerDeriv(exp(y(54)),(-params(1)),1)));
g1(6,50)=(-1);
g1(6,51)=1;
g1(7,15)=1;
g1(7,1)=(-(T(24)*T(29)*T(26)*getPowerDeriv(y(1),T(11),1)));
g1(7,21)=(-(T(24)*T(28)*getPowerDeriv(y(21),T(10),1)));
g1(7,23)=(-(T(24)*T(28)*T(29)));
g1(7,32)=(-((T(28)*T(29)-T(15))*T(36)));
g1(7,36)=(-(T(24)*T(29)*T(27)*exp(y(23))*T(18)*T(39)));
g1(8,16)=1;
g1(8,2)=(-(T(30)*T(34)*T(31)*getPowerDeriv(y(2),T(11),1)));
g1(8,22)=(-(T(30)*T(33)*getPowerDeriv(y(22),T(10),1)));
g1(8,25)=(-(T(30)*T(33)*T(34)));
g1(8,33)=(-((T(33)*T(34)-T(16))*T(37)));
g1(8,36)=(-(T(30)*T(34)*T(32)*exp(y(25))*T(19)*T(39)));
g1(9,16)=exp(y(36));
g1(9,1)=T(22);
g1(9,18)=(-exp(y(36)));
g1(9,2)=T(22);
g1(9,19)=(-exp(y(36)));
g1(9,36)=y(16)*exp(y(36))-exp(y(36))*(y(18)+y(19));
g1(10,15)=(-(T(10)/y(21)));
g1(10,21)=(-((-(T(10)*(y(15)+T(15)*T(24))))/(y(21)*y(21))));
g1(10,30)=1-T(2);
g1(10,32)=(-(T(10)*T(15)*T(36)/y(21)));
g1(11,15)=(-(exp(y(36))*T(11)/y(1)));
g1(11,1)=(-((-((y(15)+T(15)*T(24))*exp(y(36))*T(11)))/(y(1)*y(1))));
g1(11,28)=1-T(2);
g1(11,32)=(-(exp(y(36))*T(11)*T(15)*T(36)/y(1)));
g1(11,36)=(-((y(15)+T(15)*T(24))*exp(y(36))*T(11)/y(1)));
g1(12,16)=(-(T(10)/y(22)));
g1(12,22)=(-((-(T(10)*(y(16)+T(16)*T(30))))/(y(22)*y(22))));
g1(12,30)=(1-T(2))/y(35);
g1(12,33)=(-(T(10)*T(16)*T(37)/y(22)));
g1(12,35)=(-(y(30)*(1-T(2))))/(y(35)*y(35));
g1(13,16)=(-(exp(y(36))*T(11)/y(2)));
g1(13,2)=(-((-(exp(y(36))*T(11)*(y(16)+T(16)*T(30))))/(y(2)*y(2))));
g1(13,29)=(1-T(2))/y(35);
g1(13,33)=(-(exp(y(36))*T(11)*T(16)*T(37)/y(2)));
g1(13,35)=(-(y(29)*(1-T(2))))/(y(35)*y(35));
g1(13,36)=(-(exp(y(36))*T(11)*(y(16)+T(16)*T(30))/y(2)));
g1(14,20)=1;
g1(14,21)=(-1);
g1(14,22)=(-1);
g1(15,17)=1;
g1(15,18)=(-1);
g1(15,19)=(-1);
g1(16,31)=1;
g1(16,32)=(-1);
g1(16,33)=(-1);
g1(17,14)=1;
g1(17,15)=(-1);
g1(17,16)=(-params(18));
g1(18,7)=(-params(13));
g1(18,36)=1;
g1(18,55)=(-1);
g1(19,3)=(-params(14));
g1(19,23)=1;
g1(19,56)=(-1);
g1(20,24)=1;
g1(20,4)=(-params(15));
g1(20,57)=(-1);
g1(21,23)=(-1);
g1(21,24)=(-1);
g1(21,25)=1;
g1(22,5)=(-params(16));
g1(22,26)=1;
g1(22,58)=1;
g1(23,6)=(-params(17));
g1(23,27)=1;
g1(23,59)=1;
g1(24,14)=(-(1/y(14)));
g1(24,37)=1;
g1(25,15)=(-(1/y(15)));
g1(25,38)=1;
g1(26,16)=(-(1/y(16)));
g1(26,39)=1;
g1(27,20)=(-(1/y(20)));
g1(27,40)=1;
g1(28,37)=(-1);
g1(28,40)=1;
g1(28,41)=1;
g1(29,31)=(-(1/y(31)));
g1(29,42)=1;
g1(30,35)=(-(1/y(35)));
g1(30,43)=1;
g1(31,36)=(-1);
g1(31,9)=1;
g1(31,38)=(-1);
g1(31,44)=1;
g1(32,36)=(-1);
g1(32,10)=1;
g1(32,39)=(-1);
g1(32,45)=1;
g1(33,36)=(-1);
g1(33,8)=1;
g1(33,37)=(-1);
g1(33,46)=1;
g1(34,36)=(-1);
g1(34,12)=1;
g1(34,41)=(-1);
g1(34,47)=1;
g1(35,13)=1;
g1(35,43)=(-1);
g1(35,48)=1;
g1(36,11)=1;
g1(36,40)=(-1);
g1(36,49)=1;

end
