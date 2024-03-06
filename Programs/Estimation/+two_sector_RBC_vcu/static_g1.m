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
    T = two_sector_RBC_vcu.static_g1_tt(T, y, x, params);
end
g1 = zeros(25, 25);
g1(1,1)=(-1);
g1(1,3)=1;
g1(2,2)=(-1);
g1(3,3)=(-1);
g1(3,4)=1;
g1(3,7)=(-1);
g1(4,4)=(-1);
g1(4,9)=1;
g1(4,10)=1;
g1(5,5)=(-1);
g1(5,9)=1;
g1(5,11)=1;
g1(6,8)=1;
g1(6,9)=(-1);
g1(6,10)=(-1);
g1(6,13)=1;
g1(6,17)=1;
g1(7,8)=1;
g1(7,9)=(-1);
g1(7,11)=(-1);
g1(7,14)=1;
g1(7,17)=1;
g1(8,9)=(-1);
g1(8,12)=1/params(4);
g1(8,16)=(-1);
g1(9,5)=(-params(2));
g1(9,15)=1-(1-params(2));
g1(9,17)=T(1);
g1(10,3)=1;
g1(10,7)=params(5);
g1(10,16)=1;
g1(11,8)=(-(params(1)*T(1)));
g1(12,8)=(-params(3));
g1(12,17)=1;
g1(13,1)=1;
g1(13,22)=1;
g1(14,1)=(-1);
g1(14,4)=1;
g1(14,10)=(-(1-(1-params(6)*params(7))));
g1(14,13)=(-(1-params(6)*params(7)));
g1(14,17)=(-(1-params(6)*params(7)));
g1(14,18)=(-1);
g1(15,5)=1;
g1(15,11)=(-(1-(1-params(6)*params(7))));
g1(15,14)=(-(1-params(6)*params(7)));
g1(15,17)=(-(1-params(6)*params(7)));
g1(15,18)=(-1);
g1(16,10)=(-(1-T(2)));
g1(16,11)=(-T(2));
g1(16,12)=1;
g1(17,13)=(-(1-T(2)));
g1(17,14)=(-T(2));
g1(17,15)=1;
g1(18,4)=(-(1-T(2)));
g1(18,5)=(-T(2));
g1(18,6)=1;
g1(19,18)=1-params(10);
g1(20,1)=1;
g1(20,4)=(-1);
g1(20,20)=1;
g1(21,5)=(-1);
g1(21,21)=1;
g1(22,1)=1-T(2);
g1(22,4)=(-(1-T(2)));
g1(22,5)=(-T(2));
g1(22,19)=1;
g1(23,12)=params(7);
g1(23,15)=1-params(7);
g1(23,19)=(-1);
g1(23,25)=1;
g1(24,12)=1;
g1(24,19)=(-1);
g1(24,23)=1;
g1(25,9)=(-1);
g1(25,12)=(-1);
g1(25,19)=1;
g1(25,24)=1;
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
