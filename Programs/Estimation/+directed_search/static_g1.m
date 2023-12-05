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
    T = directed_search.static_g1_tt(T, y, x, params);
end
g1 = zeros(46, 46);
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
g1(6,19)=1;
g1(6,20)=1;
g1(7,10)=1;
g1(7,16)=(-1);
g1(7,19)=1;
g1(7,21)=1;
g1(8,16)=(-1);
g1(8,19)=1;
g1(8,22)=1;
g1(9,3)=1;
g1(9,11)=params(6);
g1(9,19)=(-1);
g1(9,23)=1/params(5);
g1(9,37)=1;
g1(10,17)=(-params(3));
g1(10,24)=1-(1-params(3));
g1(10,28)=T(1);
g1(11,18)=(-params(3));
g1(11,25)=1-(1-params(3));
g1(11,29)=T(1);
g1(12,4)=T(7)*(T(5)+1/params(11)-1);
g1(12,11)=(-1);
g1(12,35)=1;
g1(13,5)=1;
g1(13,22)=(-1);
g1(13,34)=(-1);
g1(14,3)=(-1);
g1(14,11)=(-params(6));
g1(14,27)=(-1);
g1(15,6)=1-params(2);
g1(15,8)=(-(params(2)*T(1)));
g1(15,9)=params(2)*T(1);
g1(15,24)=params(2)*T(1);
g1(15,28)=params(2)*T(1);
g1(16,7)=1-params(2);
g1(16,10)=params(2)*T(1);
g1(16,16)=(-(params(2)*T(1)));
g1(16,25)=params(2)*T(1);
g1(16,29)=params(2)*T(1);
g1(17,6)=1;
g1(17,8)=(-1);
g1(17,9)=1;
g1(17,24)=1;
g1(17,28)=1+params(4);
g1(18,7)=1;
g1(18,10)=1;
g1(18,16)=(-1);
g1(18,25)=1;
g1(18,29)=1+params(4);
g1(19,6)=1;
g1(19,17)=(-(params(3)*params(12)));
g1(19,24)=params(3)*params(12);
g1(20,7)=1;
g1(20,18)=(-(params(3)*params(12)));
g1(20,25)=params(3)*params(12);
g1(21,1)=1;
g1(21,2)=(-1);
g1(21,41)=1;
g1(22,1)=(-1);
g1(22,4)=(-(T(7)*(1-T(4))));
g1(22,8)=1;
g1(22,20)=(-T(3));
g1(22,24)=(-T(2));
g1(22,28)=(-T(2));
g1(22,30)=(-1);
g1(23,2)=(-1);
g1(23,5)=(-(T(7)*(1-T(4))));
g1(23,16)=1;
g1(23,21)=(-T(3));
g1(23,25)=(-T(2));
g1(23,29)=(-T(2));
g1(23,31)=(-1);
g1(24,1)=(-1);
g1(24,12)=1;
g1(24,20)=(-T(3));
g1(24,24)=(-T(2));
g1(24,30)=(-1);
g1(25,2)=(-1);
g1(25,13)=1;
g1(25,21)=(-T(3));
g1(25,25)=(-T(2));
g1(25,31)=(-1);
g1(26,20)=(-((1-params(10))*(1-T(8))));
g1(26,21)=(-(params(10)*(1-T(8))));
g1(26,22)=(-T(8));
g1(26,23)=1;
g1(27,24)=(-(1-params(10)));
g1(27,25)=(-params(10));
g1(27,26)=1;
g1(28,16)=1;
g1(28,17)=(-(1-params(10)));
g1(28,18)=(-params(10));
g1(29,4)=(-(T(7)*(1-params(10))));
g1(29,5)=(-(params(10)*T(7)));
g1(29,14)=1;
g1(29,28)=(-(T(2)*(1-params(10))));
g1(29,29)=(-(params(10)*T(2)));
g1(30,8)=1-params(10)-params(9);
g1(30,15)=(-(1-params(9)-params(10)));
g1(31,30)=1-params(14);
g1(32,31)=(-params(15));
g1(32,32)=1;
g1(33,30)=(-1);
g1(33,31)=1;
g1(33,32)=(-1);
g1(34,36)=1-params(16);
g1(35,35)=1;
g1(35,36)=1;
g1(36,33)=1-params(17);
g1(37,33)=(-1);
g1(37,34)=1;
g1(37,36)=(-1);
g1(38,37)=1-(params(18)+params(19)+params(19)*(-params(18)));
g1(39,1)=1;
g1(39,8)=(-1);
g1(39,39)=1;
g1(40,2)=1;
g1(40,16)=(-1);
g1(40,40)=1;
g1(41,1)=1-params(10);
g1(41,2)=params(10);
g1(41,8)=(-(1-params(10)));
g1(41,16)=(-params(10));
g1(41,38)=1;
g1(42,1)=1-params(10);
g1(42,2)=params(10);
g1(42,12)=(-(1-params(10)));
g1(42,13)=(-params(10));
g1(42,45)=1;
g1(43,23)=params(9);
g1(43,26)=1-params(9);
g1(43,38)=(-1);
g1(43,43)=1;
g1(44,23)=params(9);
g1(44,26)=1-params(9);
g1(44,44)=1;
g1(44,45)=(-1);
g1(45,23)=1;
g1(45,38)=(-1);
g1(45,42)=1;
g1(46,37)=(-1);
g1(46,46)=1;
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
