function g1 = static_g1(T, y, x, params, T_flag)
% function g1 = static_g1(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   g1
%

if T_flag
    T = directed_search_est_only_C.static_g1_tt(T, y, x, params);
end
g1 = zeros(39, 39);
g1(1,1)=(-1);
g1(1,3)=1;
g1(1,4)=(-(T(10)*(1-T(11))));
g1(2,2)=(-1);
g1(3,3)=(-1);
g1(3,6)=1;
g1(3,10)=(-1);
g1(4,4)=(-(T(5)*T(10)+params(13)*T(8)*T(10)*(T(5)-T(11))/params(8)*(1-T(10))));
g1(4,9)=1;
g1(5,1)=(-T(12));
g1(5,4)=(-(T(10)*T(12)));
g1(5,6)=(-(1-T(12)));
g1(5,9)=1;
g1(5,13)=1;
g1(5,14)=1;
g1(6,7)=(-(1-T(12)));
g1(6,13)=1;
g1(6,15)=1;
g1(7,12)=1;
g1(7,13)=(-1);
g1(7,14)=(-1);
g1(7,17)=1;
g1(7,21)=1;
g1(8,11)=1;
g1(8,13)=(-1);
g1(8,15)=(-1);
g1(8,18)=1;
g1(8,22)=1;
g1(9,13)=(-1);
g1(9,16)=1/params(5);
g1(9,20)=(-1);
g1(9,27)=1;
g1(10,7)=(-params(3));
g1(10,19)=1-(1-params(3));
g1(10,21)=T(1)*(1-params(10));
g1(10,22)=params(10)*T(1);
g1(11,4)=1;
g1(11,10)=(-1);
g1(11,28)=1;
g1(12,3)=1;
g1(12,10)=params(6);
g1(12,20)=1;
g1(13,5)=1-params(2);
g1(13,12)=(-(params(2)*T(1)));
g1(14,5)=1-params(2);
g1(14,11)=(-(params(2)*T(1)));
g1(15,5)=(-1);
g1(15,12)=1;
g1(15,21)=(-params(4));
g1(16,5)=(-1);
g1(16,11)=1;
g1(16,22)=(-params(4));
g1(17,5)=1;
g1(17,7)=(-(params(3)*params(12)));
g1(17,19)=params(3)*params(12);
g1(18,1)=1;
g1(18,34)=1;
g1(19,1)=(-(T(6)-(T(6)-1)));
g1(19,4)=(-(T(6)*T(10)*(1-T(5))-(T(6)-1)*T(10)));
g1(19,6)=1;
g1(19,14)=(-(params(9)*params(8)));
g1(19,17)=(-(T(3)*T(6)));
g1(19,21)=(-(T(3)*T(6)));
g1(19,24)=(-T(6));
g1(20,7)=1;
g1(20,15)=(-(params(9)*params(8)));
g1(20,18)=(-(T(3)*T(6)));
g1(20,22)=(-(T(3)*T(6)));
g1(20,25)=(-T(6));
g1(21,14)=(-(1-params(10)));
g1(21,15)=(-params(10));
g1(21,16)=1;
g1(22,17)=(-(1-params(10)));
g1(22,18)=(-params(10));
g1(22,19)=1;
g1(23,4)=(-(T(10)*(1-params(10))));
g1(23,21)=(-(T(3)*(1-params(10))));
g1(23,22)=(-(params(10)*T(3)));
g1(23,23)=1;
g1(24,6)=(-(1-params(10)));
g1(24,7)=(-params(10));
g1(24,8)=1;
g1(25,24)=1-params(15);
g1(26,26)=1-params(16);
g1(27,24)=(-1);
g1(27,25)=1;
g1(27,26)=(-1);
g1(28,28)=1-params(17);
g1(29,27)=1-(params(18)+params(19)+params(19)*(-params(18)));
g1(30,1)=1;
g1(30,6)=(-1);
g1(30,29)=1;
g1(31,7)=(-1);
g1(31,30)=1;
g1(32,1)=1-params(10);
g1(32,6)=(-(1-params(10)));
g1(32,7)=(-params(10));
g1(32,33)=1;
g1(33,13)=(-1);
g1(33,38)=1;
g1(34,16)=params(9);
g1(34,19)=1-params(9);
g1(34,33)=(-1);
g1(34,37)=1;
g1(35,16)=1;
g1(35,33)=(-1);
g1(35,35)=1;
g1(36,16)=(-1);
g1(36,33)=1;
g1(36,36)=1;
g1(36,38)=(-1);
g1(37,14)=(-1);
g1(37,31)=1;
g1(38,15)=(-1);
g1(38,32)=1;
g1(39,27)=(-1);
g1(39,39)=1;
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
