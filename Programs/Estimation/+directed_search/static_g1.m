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
g1 = zeros(44, 44);
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
g1(9,35)=1;
g1(10,15)=(-params(3));
g1(10,22)=1-(1-params(3));
g1(10,26)=T(1);
g1(11,16)=(-params(3));
g1(11,23)=1-(1-params(3));
g1(11,27)=T(1);
g1(12,4)=T(7)*(T(5)+1/params(11)-1);
g1(12,11)=(-1);
g1(12,33)=1;
g1(13,5)=1;
g1(13,20)=(-1);
g1(13,31)=(-1);
g1(14,3)=(-1);
g1(14,11)=(-params(6));
g1(14,25)=(-1);
g1(15,6)=1-params(2);
g1(15,8)=(-(params(2)*T(1)));
g1(15,9)=params(2)*T(1);
g1(15,22)=params(2)*T(1);
g1(15,26)=params(2)*T(1);
g1(16,7)=1-params(2);
g1(16,10)=params(2)*T(1);
g1(16,14)=(-(params(2)*T(1)));
g1(16,23)=params(2)*T(1);
g1(16,27)=params(2)*T(1);
g1(17,8)=(-1);
g1(17,9)=1;
g1(17,22)=1;
g1(17,26)=1+params(4);
g1(18,10)=1;
g1(18,14)=(-1);
g1(18,23)=1;
g1(18,27)=1+params(4);
g1(19,6)=1;
g1(19,15)=(-(params(3)*params(12)));
g1(19,22)=params(3)*params(12);
g1(20,7)=1;
g1(20,16)=(-(params(3)*params(12)));
g1(20,23)=params(3)*params(12);
g1(21,1)=1;
g1(21,2)=(-1);
g1(21,39)=1;
g1(22,1)=(-1);
g1(22,4)=(-(T(7)*(1-T(4))));
g1(22,8)=1;
g1(22,18)=(-T(3));
g1(22,22)=(-T(2));
g1(22,26)=(-T(2));
g1(22,28)=(-1);
g1(23,2)=(-1);
g1(23,5)=(-(T(7)*(1-T(4))));
g1(23,14)=1;
g1(23,19)=(-T(3));
g1(23,23)=(-T(2));
g1(23,27)=(-T(2));
g1(23,29)=(-1);
g1(24,1)=(-1);
g1(24,12)=1;
g1(24,18)=(-T(3));
g1(24,22)=(-T(2));
g1(24,28)=(-1);
g1(25,2)=(-1);
g1(25,13)=1;
g1(25,19)=(-T(3));
g1(25,23)=(-T(2));
g1(25,29)=(-1);
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
g1(29,28)=1-params(14);
g1(30,29)=(-params(15));
g1(30,30)=1;
g1(31,28)=(-1);
g1(31,29)=1;
g1(31,30)=(-1);
g1(32,34)=1-params(16);
g1(33,33)=1;
g1(33,34)=1;
g1(34,31)=1-params(17);
g1(35,31)=(-1);
g1(35,32)=1;
g1(35,34)=(-1);
g1(36,35)=1-(params(18)+params(19)+params(19)*(-params(18)));
g1(37,1)=1;
g1(37,8)=(-1);
g1(37,37)=1;
g1(38,2)=1;
g1(38,14)=(-1);
g1(38,38)=1;
g1(39,1)=1-params(10);
g1(39,2)=params(10);
g1(39,8)=(-(1-params(10)));
g1(39,14)=(-params(10));
g1(39,36)=1;
g1(40,1)=1-params(10);
g1(40,2)=params(10);
g1(40,12)=(-(1-params(10)));
g1(40,13)=(-params(10));
g1(40,43)=1;
g1(41,21)=params(9);
g1(41,24)=1-params(9);
g1(41,36)=(-1);
g1(41,41)=1;
g1(42,21)=params(9);
g1(42,24)=1-params(9);
g1(42,42)=1;
g1(42,43)=(-1);
g1(43,21)=1;
g1(43,36)=(-1);
g1(43,40)=1;
g1(44,35)=(-1);
g1(44,44)=1;
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
