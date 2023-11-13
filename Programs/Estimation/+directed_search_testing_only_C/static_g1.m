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
    T = directed_search_testing_only_C.static_g1_tt(T, y, x, params);
end
g1 = zeros(41, 41);
g1(1,1)=(-1);
g1(1,2)=1;
g1(1,3)=(-(T(2)*(1-T(1))));
g1(2,2)=(-1);
g1(2,6)=1;
g1(2,8)=(-1);
g1(3,3)=(-(T(2)*params(6)*(1-(1-params(7)*params(8)))+T(4)));
g1(3,7)=1;
g1(4,6)=(-1);
g1(4,7)=1;
g1(4,14)=1;
g1(4,15)=1;
g1(5,11)=(-1);
g1(5,14)=1;
g1(5,16)=1;
g1(6,2)=1;
g1(6,8)=params(5);
g1(6,14)=(-1);
g1(6,17)=1/params(4);
g1(6,32)=1;
g1(7,12)=(-T(3));
g1(7,18)=1-(1-T(3));
g1(7,23)=T(5);
g1(8,13)=(-T(3));
g1(8,19)=1-(1-T(3));
g1(8,24)=T(5);
g1(9,3)=1;
g1(9,8)=(-1);
g1(9,30)=1;
g1(10,2)=(-1);
g1(10,8)=(-params(5));
g1(10,21)=(-1);
g1(11,4)=1-params(2);
g1(11,6)=(-(params(2)*T(5)));
g1(11,7)=params(2)*T(5);
g1(11,18)=params(2)*T(5);
g1(11,23)=params(2)*T(5);
g1(12,5)=1-params(2);
g1(12,11)=(-(params(2)*T(5)));
g1(12,19)=params(2)*T(5);
g1(12,24)=params(2)*T(5);
g1(13,4)=1;
g1(13,6)=(-1);
g1(13,7)=1;
g1(13,18)=1;
g1(13,23)=1+params(3);
g1(14,5)=1;
g1(14,11)=(-1);
g1(14,19)=1;
g1(14,24)=1+params(3);
g1(15,4)=1;
g1(15,12)=(-(T(3)*params(11)));
g1(15,18)=T(3)*params(11);
g1(16,5)=1;
g1(16,13)=(-(T(3)*params(11)));
g1(16,19)=T(3)*params(11);
g1(17,1)=1;
g1(17,36)=1;
g1(18,1)=(-1);
g1(18,3)=(-(T(2)*(1-params(6)*(1-(1-params(7)*params(8))))));
g1(18,6)=1;
g1(18,15)=(-(1-(1-params(7)*params(8))));
g1(18,18)=(-(1-params(7)*params(8)));
g1(18,23)=(-(1-params(7)*params(8)));
g1(18,26)=(-1);
g1(19,11)=1;
g1(19,16)=(-(1-(1-params(7)*params(8))));
g1(19,19)=(-(1-params(7)*params(8)));
g1(19,24)=(-(1-params(7)*params(8)));
g1(19,27)=(-1);
g1(20,1)=(-1);
g1(20,9)=1;
g1(20,15)=(-(1-(1-params(7)*params(8))));
g1(20,18)=(-(1-params(7)*params(8)));
g1(20,26)=(-1);
g1(21,10)=1;
g1(21,16)=(-(1-(1-params(7)*params(8))));
g1(21,19)=(-(1-params(7)*params(8)));
g1(21,27)=(-1);
g1(22,15)=(-(1-params(9)));
g1(22,16)=(-params(9));
g1(22,17)=1;
g1(23,18)=(-(1-params(9)));
g1(23,19)=(-params(9));
g1(23,20)=1;
g1(24,11)=1;
g1(24,12)=(-(1-params(9)));
g1(24,13)=(-params(9));
g1(25,3)=(-(T(2)*(1-params(9))));
g1(25,23)=(-((1-params(7)*params(8))*(1-params(9))));
g1(25,24)=(-((1-params(7)*params(8))*params(9)));
g1(25,25)=1;
g1(26,6)=1-params(9)-params(8);
g1(26,22)=(-(1-params(8)-params(9)));
g1(27,26)=1-params(13);
g1(28,27)=(-params(14));
g1(28,28)=1;
g1(29,26)=(-1);
g1(29,27)=1;
g1(29,28)=(-1);
g1(30,31)=1-params(15);
g1(31,30)=1;
g1(31,31)=1;
g1(32,29)=1;
g1(32,31)=(-1);
g1(33,32)=1-(params(17)+params(18)+params(18)*(-params(17)));
g1(34,1)=1;
g1(34,6)=(-1);
g1(34,34)=1;
g1(35,11)=(-1);
g1(35,35)=1;
g1(36,1)=1-params(9);
g1(36,6)=(-(1-params(9)));
g1(36,11)=(-params(9));
g1(36,33)=1;
g1(37,1)=1-params(9);
g1(37,9)=(-(1-params(9)));
g1(37,10)=(-params(9));
g1(37,40)=1;
g1(38,17)=params(8);
g1(38,20)=1-params(8);
g1(38,33)=(-1);
g1(38,38)=1;
g1(39,17)=params(8);
g1(39,20)=1-params(8);
g1(39,39)=1;
g1(39,40)=(-1);
g1(40,17)=1;
g1(40,33)=(-1);
g1(40,37)=1;
g1(41,32)=(-1);
g1(41,41)=1;
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
