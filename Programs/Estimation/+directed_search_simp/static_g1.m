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
    T = directed_search_simp.static_g1_tt(T, y, x, params);
end
g1 = zeros(38, 38);
g1(1,1)=(-1);
g1(1,3)=1;
g1(1,4)=(-(T(2)*T(5)));
g1(2,2)=(-1);
g1(2,5)=(-(T(2)*T(5)));
g1(3,3)=(-1);
g1(3,6)=1;
g1(3,11)=(-1);
g1(4,4)=(-T(6));
g1(4,9)=1;
g1(5,5)=(-T(6));
g1(5,10)=1;
g1(6,6)=(-1);
g1(6,9)=1;
g1(6,14)=1;
g1(6,15)=1;
g1(7,7)=(-1);
g1(7,10)=1;
g1(7,14)=1;
g1(7,16)=1;
g1(8,13)=1;
g1(8,14)=(-1);
g1(8,15)=(-1);
g1(8,18)=1;
g1(9,12)=1;
g1(9,14)=(-1);
g1(9,16)=(-1);
g1(9,19)=1;
g1(10,14)=(-1);
g1(10,17)=1/params(4);
g1(10,21)=(-1);
g1(10,26)=1;
g1(11,7)=(-params(3));
g1(11,20)=1-(1-params(3));
g1(12,4)=1;
g1(12,11)=(-1);
g1(12,27)=1;
g1(13,3)=1;
g1(13,5)=1;
g1(13,7)=(-1);
g1(13,27)=1;
g1(14,3)=1;
g1(14,6)=T(7);
g1(14,8)=(-T(7));
g1(14,11)=params(5);
g1(14,21)=1;
g1(15,13)=(-T(8));
g1(16,12)=(-T(8));
g1(17,1)=1;
g1(17,2)=(-1);
g1(17,33)=1;
g1(18,1)=(-1);
g1(18,4)=(-T(2));
g1(18,6)=1;
g1(18,15)=(-(1-(1-params(6)*params(7))));
g1(18,18)=(-(1-params(6)*params(7)));
g1(18,23)=(-1);
g1(19,2)=(-1);
g1(19,5)=(-T(2));
g1(19,7)=1;
g1(19,16)=(-(1-(1-params(6)*params(7))));
g1(19,19)=(-(1-params(6)*params(7)));
g1(19,24)=(-1);
g1(20,15)=(-T(4));
g1(20,16)=(-T(1));
g1(20,17)=1;
g1(21,18)=(-T(4));
g1(21,19)=(-T(1));
g1(21,20)=1;
g1(22,4)=(-(T(2)*T(4)));
g1(22,5)=(-(T(1)*T(2)));
g1(22,22)=1;
g1(23,6)=(-T(4));
g1(23,7)=(-T(1));
g1(23,8)=1;
g1(24,23)=1-params(10);
g1(25,25)=1-params(11);
g1(26,23)=(-1);
g1(26,24)=1;
g1(26,25)=(-1);
g1(27,27)=1-params(12);
g1(28,26)=1-(params(13)+params(14)+params(14)*(-params(13)));
g1(29,1)=1;
g1(29,6)=(-1);
g1(29,28)=1;
g1(30,2)=1;
g1(30,7)=(-1);
g1(30,29)=1;
g1(31,1)=T(4);
g1(31,2)=T(1);
g1(31,6)=(-T(4));
g1(31,7)=(-T(1));
g1(31,32)=1;
g1(32,2)=1;
g1(32,14)=(-1);
g1(32,37)=1;
g1(33,17)=params(7);
g1(33,20)=1-params(7);
g1(33,32)=(-1);
g1(33,36)=1;
g1(34,17)=1;
g1(34,32)=(-1);
g1(34,34)=1;
g1(35,17)=(-1);
g1(35,32)=1;
g1(35,35)=1;
g1(35,37)=(-1);
g1(36,15)=(-1);
g1(36,30)=1;
g1(37,16)=(-1);
g1(37,31)=1;
g1(38,26)=(-1);
g1(38,38)=1;
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
