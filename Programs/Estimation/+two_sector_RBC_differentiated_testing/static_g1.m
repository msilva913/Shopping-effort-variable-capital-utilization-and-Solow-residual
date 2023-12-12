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
    T = two_sector_RBC_differentiated_testing.static_g1_tt(T, y, x, params);
end
g1 = zeros(37, 37);
g1(1,1)=(-1);
g1(1,3)=1;
g1(2,2)=(-1);
g1(3,3)=(-1);
g1(3,6)=1;
g1(3,11)=(-1);
g1(4,1)=(-T(5));
g1(4,6)=(-(1-T(5)));
g1(4,16)=1;
g1(4,17)=1;
g1(5,7)=(-(1-T(5)));
g1(5,16)=1;
g1(5,18)=1;
g1(6,15)=1;
g1(6,16)=(-1);
g1(6,17)=(-1);
g1(6,20)=1;
g1(6,24)=1;
g1(7,14)=1;
g1(7,16)=(-1);
g1(7,18)=(-1);
g1(7,21)=1;
g1(7,25)=1;
g1(8,16)=(-1);
g1(8,19)=1/params(5);
g1(8,23)=(-1);
g1(8,27)=1;
g1(9,8)=(-params(3));
g1(9,20)=1-(1-params(3));
g1(9,24)=T(1)*(1-params(10));
g1(10,9)=(-params(3));
g1(10,21)=1-(1-params(3));
g1(10,25)=params(10)*T(1);
g1(11,3)=1;
g1(11,11)=params(6);
g1(11,23)=1;
g1(12,4)=1-params(2);
g1(12,15)=(-(params(2)*T(1)));
g1(13,5)=1-params(2);
g1(13,14)=(-(params(2)*T(1)));
g1(14,4)=(-1);
g1(14,15)=1;
g1(14,24)=(-params(4));
g1(15,5)=(-1);
g1(15,14)=1;
g1(15,25)=(-params(4));
g1(16,4)=1;
g1(16,8)=(-(params(3)*params(11)));
g1(16,20)=params(3)*params(11);
g1(17,5)=1;
g1(17,9)=(-(params(3)*params(11)));
g1(17,21)=params(3)*params(11);
g1(18,1)=1;
g1(18,31)=1;
g1(19,1)=(-(T(4)-(T(4)-1)));
g1(19,6)=1;
g1(19,17)=(-(params(9)*params(8)));
g1(19,20)=(-(T(3)*T(4)));
g1(19,24)=(-(T(3)*T(4)));
g1(19,26)=(-T(4));
g1(20,7)=1;
g1(20,18)=(-(params(9)*params(8)));
g1(20,21)=(-(T(3)*T(4)));
g1(20,25)=(-(T(3)*T(4)));
g1(20,26)=(-T(4));
g1(21,1)=(-(T(4)-(T(4)-1)));
g1(21,12)=1;
g1(21,17)=(-(params(9)*params(8)));
g1(21,20)=(-(T(3)*T(4)));
g1(21,26)=(-T(4));
g1(22,13)=1;
g1(22,18)=(-(params(9)*params(8)));
g1(22,21)=(-(T(3)*T(4)));
g1(22,26)=(-T(4));
g1(23,17)=(-(1-params(10)));
g1(23,18)=(-params(10));
g1(23,19)=1;
g1(24,20)=(-(1-params(10)));
g1(24,21)=(-params(10));
g1(24,22)=1;
g1(25,7)=1;
g1(25,8)=(-(1-params(10)));
g1(25,9)=(-params(10));
g1(26,6)=(-(1-params(10)));
g1(26,7)=(-params(10));
g1(26,10)=1;
g1(27,26)=1-params(13);
g1(28,27)=1-(params(15)+params(16)+params(16)*(-params(15)));
g1(29,1)=1;
g1(29,6)=(-1);
g1(29,29)=1;
g1(30,7)=(-1);
g1(30,30)=1;
g1(31,1)=1-params(10);
g1(31,6)=(-(1-params(10)));
g1(31,7)=(-params(10));
g1(31,28)=1;
g1(32,1)=1-params(10);
g1(32,12)=(-(1-params(10)));
g1(32,13)=(-params(10));
g1(32,36)=1;
g1(33,19)=params(9);
g1(33,22)=1-params(9);
g1(33,28)=(-1);
g1(33,34)=1;
g1(34,19)=params(9);
g1(34,22)=1-params(9);
g1(34,35)=1;
g1(34,36)=(-1);
g1(35,19)=1;
g1(35,28)=(-1);
g1(35,32)=1;
g1(36,16)=(-1);
g1(36,19)=(-1);
g1(36,28)=1;
g1(36,33)=1;
g1(37,27)=(-1);
g1(37,37)=1;
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
