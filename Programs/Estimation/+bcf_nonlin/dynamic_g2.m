function g2 = dynamic_g2(T, y, x, params, steady_state, it_, T_flag)
% function g2 = dynamic_g2(T, y, x, params, steady_state, it_, T_flag)
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
%   g2
%

if T_flag
    T = bcf_nonlin.dynamic_g2_tt(T, y, x, params, steady_state, it_);
end
g2_i = zeros(48,1);
g2_j = zeros(48,1);
g2_v = zeros(48,1);

g2_i(1)=1;
g2_i(2)=2;
g2_i(3)=2;
g2_i(4)=2;
g2_i(5)=2;
g2_i(6)=2;
g2_i(7)=2;
g2_i(8)=2;
g2_i(9)=2;
g2_i(10)=2;
g2_i(11)=2;
g2_i(12)=2;
g2_i(13)=2;
g2_i(14)=2;
g2_i(15)=2;
g2_i(16)=2;
g2_i(17)=2;
g2_i(18)=2;
g2_i(19)=3;
g2_i(20)=3;
g2_i(21)=3;
g2_i(22)=3;
g2_i(23)=4;
g2_i(24)=4;
g2_i(25)=4;
g2_i(26)=4;
g2_i(27)=4;
g2_i(28)=4;
g2_i(29)=4;
g2_i(30)=4;
g2_i(31)=4;
g2_i(32)=4;
g2_i(33)=4;
g2_i(34)=4;
g2_i(35)=4;
g2_i(36)=4;
g2_i(37)=5;
g2_i(38)=5;
g2_i(39)=5;
g2_i(40)=6;
g2_i(41)=6;
g2_i(42)=6;
g2_i(43)=6;
g2_i(44)=6;
g2_i(45)=6;
g2_i(46)=6;
g2_i(47)=6;
g2_i(48)=6;
g2_j(1)=196;
g2_j(2)=16;
g2_j(3)=20;
g2_j(4)=72;
g2_j(5)=23;
g2_j(6)=114;
g2_j(7)=76;
g2_j(8)=81;
g2_j(9)=146;
g2_j(10)=79;
g2_j(11)=118;
g2_j(12)=83;
g2_j(13)=174;
g2_j(14)=151;
g2_j(15)=153;
g2_j(16)=179;
g2_j(17)=121;
g2_j(18)=181;
g2_j(19)=45;
g2_j(20)=32;
g2_j(21)=31;
g2_j(22)=106;
g2_j(23)=131;
g2_j(24)=66;
g2_j(25)=138;
g2_j(26)=164;
g2_j(27)=139;
g2_j(28)=178;
g2_j(29)=61;
g2_j(30)=68;
g2_j(31)=159;
g2_j(32)=69;
g2_j(33)=173;
g2_j(34)=167;
g2_j(35)=180;
g2_j(36)=181;
g2_j(37)=9;
g2_j(38)=113;
g2_j(39)=121;
g2_j(40)=1;
g2_j(41)=3;
g2_j(42)=29;
g2_j(43)=9;
g2_j(44)=113;
g2_j(45)=31;
g2_j(46)=37;
g2_j(47)=115;
g2_j(48)=121;
g2_v(1)=(-exp(params(4)+x(it_, 1)));
g2_v(2)=(-((-(y(9)*(-params(2))))*((y(9)*y(6)-params(2)*y(2))*(-params(2))+(y(9)*y(6)-params(2)*y(2))*(-params(2)))))/(T(10)*T(10));
g2_v(3)=(-((-(y(9)*(-params(2))))*(y(9)*(y(9)*y(6)-params(2)*y(2))+y(9)*(y(9)*y(6)-params(2)*y(2)))))/(T(10)*T(10));
g2_v(4)=g2_v(3);
g2_v(5)=(params(2)*T(10)-(-(y(9)*(-params(2))))*(y(6)*(y(9)*y(6)-params(2)*y(2))+y(6)*(y(9)*y(6)-params(2)*y(2))))/(T(10)*T(10));
g2_v(6)=g2_v(5);
g2_v(7)=(-((-(y(9)*y(9)))*(y(9)*(y(9)*y(6)-params(2)*y(2))+y(9)*(y(9)*y(6)-params(2)*y(2)))))/(T(10)*T(10))-(-((-(params(2)*params(1)*(-params(2))))*((y(13)*y(11)-y(6)*params(2))*(-params(2))+(y(13)*y(11)-y(6)*params(2))*(-params(2)))))/T(16);
g2_v(8)=(-((-((-(params(2)*params(1)*(-params(2))))*(y(13)*(y(13)*y(11)-y(6)*params(2))+y(13)*(y(13)*y(11)-y(6)*params(2)))))/T(16)));
g2_v(9)=g2_v(8);
g2_v(10)=(T(10)*(-(y(9)+y(9)))-(-(y(9)*y(9)))*(y(6)*(y(9)*y(6)-params(2)*y(2))+y(6)*(y(9)*y(6)-params(2)*y(2))))/(T(10)*T(10));
g2_v(11)=g2_v(10);
g2_v(12)=(-((-((-(params(2)*params(1)*(-params(2))))*(y(11)*(y(13)*y(11)-y(6)*params(2))+y(11)*(y(13)*y(11)-y(6)*params(2)))))/T(16)));
g2_v(13)=g2_v(12);
g2_v(14)=(-((-((-(params(2)*params(1)*y(13)))*(y(13)*(y(13)*y(11)-y(6)*params(2))+y(13)*(y(13)*y(11)-y(6)*params(2)))))/T(16)));
g2_v(15)=(-((T(11)*(-(params(2)*params(1)))-(-(params(2)*params(1)*y(13)))*(y(11)*(y(13)*y(11)-y(6)*params(2))+y(11)*(y(13)*y(11)-y(6)*params(2))))/T(16)));
g2_v(16)=g2_v(15);
g2_v(17)=(-((y(9)*y(6)-params(2)*y(2)-y(9)*y(6))*(y(6)*(y(9)*y(6)-params(2)*y(2))+y(6)*(y(9)*y(6)-params(2)*y(2)))))/(T(10)*T(10));
g2_v(18)=(-((-((-(params(2)*params(1)*y(11)))*(y(11)*(y(13)*y(11)-y(6)*params(2))+y(11)*(y(13)*y(11)-y(6)*params(2)))))/T(16)));
g2_v(19)=(1-params(3))*(-1)/(y(3)*y(3));
g2_v(20)=g2_v(19);
g2_v(21)=(1-params(3))*(-((-y(4))*(y(3)+y(3))))/(y(3)*y(3)*y(3)*y(3));
g2_v(22)=(-((y(8)+y(8))/(y(8)*y(8)*y(8)*y(8))));
g2_v(23)=params(1)*T(1)*(-(y(13)*params(3)))/(y(5)*y(5));
g2_v(24)=g2_v(23);
g2_v(25)=params(1)*y(13)*params(3)/y(5)*T(13);
g2_v(26)=g2_v(25);
g2_v(27)=params(1)*(y(13)*params(3)/y(5)*T(15)+T(1)*params(3)/y(5));
g2_v(28)=g2_v(27);
g2_v(29)=params(1)*T(1)*(-((-(y(13)*params(3)*y(10)))*(y(5)+y(5))))/(y(5)*y(5)*y(5)*y(5));
g2_v(30)=params(1)*T(9)*T(13);
g2_v(31)=g2_v(30);
g2_v(32)=params(1)*(T(9)*T(15)+T(1)*(-(params(3)*y(10)))/(y(5)*y(5)));
g2_v(33)=g2_v(32);
g2_v(34)=params(1)*(T(13)*params(3)*y(10)/y(5)+T(2)*(-1)/(y(13)*y(13)));
g2_v(35)=g2_v(34);
g2_v(36)=params(1)*(T(15)*params(3)*y(10)/y(5)+T(15)*params(3)*y(10)/y(5)+T(2)*(-((-y(12))*(y(13)+y(13))))/(y(13)*y(13)*y(13)*y(13)));
g2_v(37)=(-(1-params(6)))/(y(9)*y(9));
g2_v(38)=g2_v(37);
g2_v(39)=(-((-((1-params(6))*y(1)))*(y(9)+y(9))))/(y(9)*y(9)*y(9)*y(9));
g2_v(40)=(-(T(6)*T(3)*getPowerDeriv(y(1),params(3),2)));
g2_v(41)=(-(T(8)*T(12)));
g2_v(42)=g2_v(41);
g2_v(43)=(-(T(6)*T(7)*T(14)));
g2_v(44)=g2_v(43);
g2_v(45)=(-(T(5)*getPowerDeriv(y(3),1-params(3),2)));
g2_v(46)=(-(T(12)*T(4)*T(14)));
g2_v(47)=g2_v(46);
g2_v(48)=(-(T(6)*T(4)*getPowerDeriv(y(9),(-params(3)),2)));
g2 = sparse(g2_i,g2_j,g2_v,7,196);
end
