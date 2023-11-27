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
    T = two_sector_RBC_testing.static_g1_tt(T, y, x, params);
end
g1 = zeros(35, 35);
g1(1,1)=(-1);
g1(1,3)=1;
g1(2,2)=(-1);
g1(3,3)=(-1);
g1(3,5)=1;
g1(3,8)=(-1);
g1(4,1)=0.0;
g1(4,5)=(-1);
g1(4,13)=1;
g1(4,14)=1;
g1(5,6)=(-1);
g1(5,13)=1;
g1(5,15)=1;
g1(6,12)=1;
g1(6,13)=(-1);
g1(6,14)=(-1);
g1(6,17)=1;
g1(6,21)=1;
g1(7,11)=1;
g1(7,13)=(-1);
g1(7,15)=(-1);
g1(7,18)=1;
g1(7,22)=1;
g1(8,3)=1;
g1(8,8)=params(6);
g1(8,13)=(-1);
g1(8,16)=1/params(5);
g1(8,26)=1;
g1(9,6)=(-params(3));
g1(9,19)=1-(1-params(3));
g1(9,21)=T(1)*(1-params(10));
g1(9,22)=params(10)*T(1);
g1(10,3)=1;
g1(10,8)=params(6);
g1(10,20)=1;
g1(11,4)=1-params(2);
g1(11,12)=(-(params(2)*T(1)));
g1(12,4)=1-params(2);
g1(12,11)=(-(params(2)*T(1)));
g1(13,4)=(-1);
g1(13,12)=1;
g1(13,21)=(-params(4));
g1(14,4)=(-1);
g1(14,11)=1;
g1(14,22)=(-params(4));
g1(15,4)=1;
g1(15,6)=(-(params(3)*params(11)));
g1(15,19)=params(3)*params(11);
g1(16,1)=1;
g1(16,30)=1;
g1(17,1)=(-1);
g1(17,5)=1;
g1(17,14)=(-(1-T(3)));
g1(17,17)=(-T(3));
g1(17,21)=(-T(3));
g1(17,23)=(-1);
g1(18,6)=1;
g1(18,15)=(-(1-T(3)));
g1(18,18)=(-T(3));
g1(18,22)=(-T(3));
g1(18,24)=(-1);
g1(19,1)=(-1);
g1(19,9)=1;
g1(19,14)=(-(1-T(3)));
g1(19,17)=(-T(3));
g1(19,23)=(-1);
g1(20,10)=1;
g1(20,15)=(-(1-T(3)));
g1(20,18)=(-T(3));
g1(20,24)=(-1);
g1(21,14)=(-(1-params(10)));
g1(21,15)=(-params(10));
g1(21,16)=1;
g1(22,17)=(-(1-params(10)));
g1(22,18)=(-params(10));
g1(22,19)=1;
g1(23,5)=(-(1-params(10)));
g1(23,6)=(-params(10));
g1(23,7)=1;
g1(24,23)=1-params(12);
g1(25,24)=(-params(13));
g1(25,25)=1;
g1(26,23)=(-1);
g1(26,24)=1;
g1(26,25)=(-1);
g1(27,26)=1-(params(14)+params(15)+params(15)*(-params(14)));
g1(28,1)=1;
g1(28,5)=(-1);
g1(28,28)=1;
g1(29,6)=(-1);
g1(29,29)=1;
g1(30,1)=1-params(10);
g1(30,5)=(-(1-params(10)));
g1(30,6)=(-params(10));
g1(30,27)=1;
g1(31,1)=1-params(10);
g1(31,9)=(-(1-params(10)));
g1(31,10)=(-params(10));
g1(31,34)=1;
g1(32,16)=params(9);
g1(32,19)=1-params(9);
g1(32,27)=(-1);
g1(32,32)=1;
g1(33,16)=params(9);
g1(33,19)=1-params(9);
g1(33,33)=1;
g1(33,34)=(-1);
g1(34,16)=1;
g1(34,27)=(-1);
g1(34,31)=1;
g1(35,26)=(-1);
g1(35,35)=1;
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
