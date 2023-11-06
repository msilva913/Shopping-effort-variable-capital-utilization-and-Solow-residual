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
    T = directed_search_testing.static_g1_tt(T, y, x, params);
end
g1 = zeros(45, 45);
g1(1,1)=(-1);
g1(1,3)=1;
g1(1,4)=(-(T(7)*(1-T(5))));
g1(2,2)=(-1);
g1(2,5)=(-(T(7)*(1-T(5))));
g1(3,3)=(-1);
g1(3,8)=1;
g1(3,11)=(-1);
g1(4,4)=(-(T(4)*T(7)+T(9)));
g1(4,9)=1;
g1(5,5)=(-(T(4)*T(7)+T(9)));
g1(5,10)=1;
g1(6,8)=(-1);
g1(6,9)=1;
g1(6,17)=1;
g1(6,18)=1;
g1(7,10)=1;
g1(7,14)=(-1);
g1(7,17)=1;
g1(7,19)=1;
g1(8,14)=(-1);
g1(8,17)=1;
g1(8,20)=1;
g1(9,3)=1;
g1(9,11)=params(6);
g1(9,17)=(-1);
g1(9,21)=1/params(5);
g1(9,36)=1;
g1(10,15)=(-params(3));
g1(10,22)=1-(1-params(3));
g1(10,27)=T(1);
g1(11,16)=(-params(3));
g1(11,23)=1-(1-params(3));
g1(11,28)=T(1);
g1(12,4)=T(7)*(T(5)+1/params(11)-1);
g1(12,11)=(-1);
g1(12,34)=1;
g1(13,5)=1;
g1(13,20)=(-1);
g1(13,33)=(-1);
g1(14,3)=(-1);
g1(14,11)=(-params(6));
g1(14,25)=(-1);
g1(15,6)=1-params(2);
g1(15,8)=(-(params(2)*T(1)));
g1(15,9)=params(2)*T(1);
g1(15,22)=params(2)*T(1);
g1(15,27)=params(2)*T(1);
g1(16,7)=1-params(2);
g1(16,10)=params(2)*T(1);
g1(16,14)=(-(params(2)*T(1)));
g1(16,23)=params(2)*T(1);
g1(16,28)=params(2)*T(1);
g1(17,6)=1;
g1(17,8)=(-1);
g1(17,9)=1;
g1(17,22)=1;
g1(17,27)=1+params(4);
g1(18,7)=1;
g1(18,10)=1;
g1(18,14)=(-1);
g1(18,23)=1;
g1(18,28)=1+params(4);
g1(19,6)=1;
g1(19,15)=(-(params(3)*params(12)));
g1(19,22)=params(3)*params(12);
g1(20,7)=1;
g1(20,16)=(-(params(3)*params(12)));
g1(20,23)=params(3)*params(12);
g1(21,1)=1;
g1(21,2)=(-1);
g1(21,40)=1;
g1(22,1)=(-1);
g1(22,4)=(-(T(7)*(1-T(4))));
g1(22,8)=1;
g1(22,18)=(-T(3));
g1(22,22)=(-T(2));
g1(22,27)=(-T(2));
g1(22,30)=(-1);
g1(23,2)=(-1);
g1(23,5)=(-(T(7)*(1-T(4))));
g1(23,14)=1;
g1(23,19)=(-T(3));
g1(23,23)=(-T(2));
g1(23,28)=(-T(2));
g1(23,31)=(-1);
g1(24,1)=(-1);
g1(24,12)=1;
g1(24,18)=(-T(3));
g1(24,22)=(-T(2));
g1(24,30)=(-1);
g1(25,2)=(-1);
g1(25,13)=1;
g1(25,19)=(-T(3));
g1(25,23)=(-T(2));
g1(25,31)=(-1);
g1(26,18)=(-((1-params(10))*(1-T(8))));
g1(26,19)=(-(params(10)*(1-T(8))));
g1(26,20)=(-T(8));
g1(26,21)=1;
g1(27,22)=(-(1-params(10)));
g1(27,23)=(-params(10));
g1(27,24)=1;
g1(28,14)=1;
g1(28,15)=(-(1-params(10)));
g1(28,16)=(-params(10));
g1(29,4)=(-(T(7)*(1-params(10))));
g1(29,5)=(-(params(10)*T(7)));
g1(29,27)=(-(T(2)*(1-params(10))));
g1(29,28)=(-(params(10)*T(2)));
g1(29,29)=1;
g1(30,8)=1-params(10)-params(9);
g1(30,26)=(-(1-params(9)-params(10)));
g1(31,30)=1-params(14);
g1(32,31)=(-params(15));
g1(32,32)=1;
g1(33,30)=(-1);
g1(33,31)=1;
g1(33,32)=(-1);
g1(34,35)=1-params(16);
g1(35,34)=1;
g1(35,35)=1;
g1(36,33)=1-params(17);
g1(37,36)=1-(params(18)+params(19)+params(19)*(-params(18)));
g1(38,1)=1;
g1(38,8)=(-1);
g1(38,38)=1;
g1(39,2)=1;
g1(39,14)=(-1);
g1(39,39)=1;
g1(40,1)=1-params(10);
g1(40,2)=params(10);
g1(40,8)=(-(1-params(10)));
g1(40,14)=(-params(10));
g1(40,37)=1;
g1(41,1)=1-params(10);
g1(41,2)=params(10);
g1(41,12)=(-(1-params(10)));
g1(41,13)=(-params(10));
g1(41,44)=1;
g1(42,21)=params(9);
g1(42,24)=1-params(9);
g1(42,37)=(-1);
g1(42,42)=1;
g1(43,21)=params(9);
g1(43,24)=1-params(9);
g1(43,43)=1;
g1(43,44)=(-1);
g1(44,21)=1;
g1(44,37)=(-1);
g1(44,41)=1;
g1(45,36)=(-1);
g1(45,45)=1;
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
