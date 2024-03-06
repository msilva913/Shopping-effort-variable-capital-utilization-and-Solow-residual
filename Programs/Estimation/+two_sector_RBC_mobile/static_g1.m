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
    T = two_sector_RBC_mobile.static_g1_tt(T, y, x, params);
end
g1 = zeros(34, 34);
g1(1,1)=(-1);
g1(1,3)=1;
g1(2,2)=(-1);
g1(3,3)=(-1);
g1(3,5)=1;
g1(3,8)=(-1);
g1(4,5)=(-1);
g1(4,11)=1;
g1(4,12)=1;
g1(5,6)=(-1);
g1(5,11)=1;
g1(5,13)=1;
g1(6,10)=1;
g1(6,11)=(-1);
g1(6,12)=(-1);
g1(6,15)=1;
g1(6,19)=1;
g1(7,9)=1;
g1(7,11)=(-1);
g1(7,13)=(-1);
g1(7,16)=1;
g1(7,20)=1;
g1(8,11)=(-1);
g1(8,14)=1/params(4);
g1(8,18)=(-1);
g1(8,24)=1;
g1(9,6)=(-params(2));
g1(9,17)=1-(1-params(2));
g1(9,19)=T(1)*(1-T(2));
g1(9,20)=params(2)*(1-params(6)*params(7))/params(6);
g1(10,3)=1;
g1(10,8)=params(5);
g1(10,18)=1;
g1(11,4)=1-params(1);
g1(11,10)=(-(params(1)*T(1)));
g1(12,4)=1-params(1);
g1(12,9)=(-(params(1)*T(1)));
g1(13,4)=(-1);
g1(13,10)=1;
g1(13,19)=(-params(3));
g1(14,4)=(-1);
g1(14,9)=1;
g1(14,20)=(-params(3));
g1(15,4)=1;
g1(15,6)=(-(params(2)*params(8)));
g1(15,17)=params(2)*params(8);
g1(16,1)=1;
g1(16,30)=1;
g1(17,1)=(-1);
g1(17,5)=1;
g1(17,12)=(-(1-(1-params(6)*params(7))));
g1(17,15)=(-(1-params(6)*params(7)));
g1(17,19)=(-(1-params(6)*params(7)));
g1(17,21)=(-1);
g1(18,6)=1;
g1(18,13)=(-(1-(1-params(6)*params(7))));
g1(18,16)=(-(1-params(6)*params(7)));
g1(18,20)=(-(1-params(6)*params(7)));
g1(18,22)=(-1);
g1(19,12)=(-(1-T(2)));
g1(19,13)=(-T(2));
g1(19,14)=1;
g1(20,15)=(-(1-T(2)));
g1(20,16)=(-T(2));
g1(20,17)=1;
g1(21,5)=(-(1-T(2)));
g1(21,6)=(-T(2));
g1(21,7)=1;
g1(22,21)=1-params(10);
g1(23,23)=1-params(11);
g1(24,21)=(-1);
g1(24,22)=1;
g1(24,23)=(-1);
g1(25,24)=1-(params(12)+params(13)+params(13)*(-params(12)));
g1(26,1)=1;
g1(26,5)=(-1);
g1(26,26)=1;
g1(27,6)=(-1);
g1(27,27)=1;
g1(28,1)=1-T(2);
g1(28,5)=(-(1-T(2)));
g1(28,6)=(-T(2));
g1(28,25)=1;
g1(29,14)=params(7);
g1(29,17)=1-params(7);
g1(29,25)=(-1);
g1(29,33)=1;
g1(30,14)=1;
g1(30,25)=(-1);
g1(30,31)=1;
g1(31,11)=(-1);
g1(31,14)=(-1);
g1(31,25)=1;
g1(31,32)=1;
g1(32,12)=(-1);
g1(32,28)=1;
g1(33,13)=(-1);
g1(33,29)=1;
g1(34,24)=(-1);
g1(34,34)=1;
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
