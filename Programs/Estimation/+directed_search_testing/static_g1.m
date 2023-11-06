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
g1 = zeros(42, 42);
g1(1,1)=(-1);
g1(1,3)=1;
g1(1,4)=(-(T(7)*(1-T(5))));
g1(2,2)=(-1);
g1(2,5)=(-(T(7)*(1-T(5))));
g1(3,3)=(-1);
g1(3,6)=1;
g1(3,9)=(-1);
g1(4,4)=(-(T(4)*T(7)+T(9)));
g1(4,7)=1;
g1(5,5)=(-(T(4)*T(7)+T(9)));
g1(5,8)=1;
g1(6,6)=(-1);
g1(6,7)=1;
g1(6,15)=1;
g1(6,16)=1;
g1(7,8)=1;
g1(7,12)=(-1);
g1(7,15)=1;
g1(7,17)=1;
g1(8,12)=(-1);
g1(8,15)=1;
g1(8,18)=1;
g1(9,3)=1;
g1(9,9)=params(6);
g1(9,15)=(-1);
g1(9,19)=1/params(5);
g1(9,33)=1;
g1(10,13)=(-params(3));
g1(10,20)=1-(1-params(3));
g1(10,24)=T(1);
g1(11,14)=(-params(3));
g1(11,21)=1-(1-params(3));
g1(11,25)=T(1);
g1(12,4)=1;
g1(12,9)=(-1);
g1(12,31)=1;
g1(13,5)=1;
g1(13,18)=(-1);
g1(13,29)=(-1);
g1(14,3)=(-1);
g1(14,9)=(-params(6));
g1(14,23)=(-1);
g1(15,6)=(-(params(2)*T(1)));
g1(15,7)=params(2)*T(1);
g1(15,20)=params(2)*T(1);
g1(15,24)=params(2)*T(1);
g1(16,8)=params(2)*T(1);
g1(16,12)=(-(params(2)*T(1)));
g1(16,21)=params(2)*T(1);
g1(16,25)=params(2)*T(1);
g1(17,6)=(-1);
g1(17,7)=1;
g1(17,20)=1;
g1(17,24)=1+params(4);
g1(18,8)=1;
g1(18,12)=(-1);
g1(18,21)=1;
g1(18,25)=1+params(4);
g1(19,1)=1;
g1(19,2)=(-1);
g1(19,37)=1;
g1(20,1)=(-1);
g1(20,4)=(-(T(7)*(1-T(4))));
g1(20,6)=1;
g1(20,16)=(-T(3));
g1(20,20)=(-T(2));
g1(20,24)=(-T(2));
g1(20,26)=(-1);
g1(21,2)=(-1);
g1(21,5)=(-(T(7)*(1-T(4))));
g1(21,12)=1;
g1(21,17)=(-T(3));
g1(21,21)=(-T(2));
g1(21,25)=(-T(2));
g1(21,27)=(-1);
g1(22,1)=(-1);
g1(22,10)=1;
g1(22,16)=(-T(3));
g1(22,20)=(-T(2));
g1(22,26)=(-1);
g1(23,2)=(-1);
g1(23,11)=1;
g1(23,17)=(-T(3));
g1(23,21)=(-T(2));
g1(23,27)=(-1);
g1(24,16)=(-((1-params(10))*(1-T(8))));
g1(24,17)=(-(params(10)*(1-T(8))));
g1(24,18)=(-T(8));
g1(24,19)=1;
g1(25,20)=(-(1-params(10)));
g1(25,21)=(-params(10));
g1(25,22)=1;
g1(26,12)=1;
g1(26,13)=(-(1-params(10)));
g1(26,14)=(-params(10));
g1(27,26)=1-params(14);
g1(28,27)=(-params(15));
g1(28,28)=1;
g1(29,26)=(-1);
g1(29,27)=1;
g1(29,28)=(-1);
g1(30,32)=1-params(16);
g1(31,31)=1;
g1(31,32)=1;
g1(32,29)=1-params(17);
g1(33,29)=(-1);
g1(33,30)=1;
g1(33,32)=(-1);
g1(34,33)=1-(params(18)+params(19)+params(19)*(-params(18)));
g1(35,1)=1;
g1(35,6)=(-1);
g1(35,35)=1;
g1(36,2)=1;
g1(36,12)=(-1);
g1(36,36)=1;
g1(37,1)=1-params(10);
g1(37,2)=params(10);
g1(37,6)=(-(1-params(10)));
g1(37,12)=(-params(10));
g1(37,34)=1;
g1(38,1)=1-params(10);
g1(38,2)=params(10);
g1(38,10)=(-(1-params(10)));
g1(38,11)=(-params(10));
g1(38,41)=1;
g1(39,19)=params(9);
g1(39,22)=1-params(9);
g1(39,34)=(-1);
g1(39,39)=1;
g1(40,19)=params(9);
g1(40,22)=1-params(9);
g1(40,40)=1;
g1(40,41)=(-1);
g1(41,19)=1;
g1(41,34)=(-1);
g1(41,38)=1;
g1(42,33)=(-1);
g1(42,42)=1;
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
