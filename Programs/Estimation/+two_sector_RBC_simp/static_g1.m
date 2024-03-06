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
    T = two_sector_RBC_simp.static_g1_tt(T, y, x, params);
end
g1 = zeros(24, 24);
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
g1(7,8)=1;
g1(7,9)=(-1);
g1(7,11)=(-1);
g1(7,14)=1;
g1(8,9)=(-1);
g1(8,12)=1/params(3);
g1(8,16)=(-1);
g1(9,5)=(-params(2));
g1(9,15)=1-(1-params(2));
g1(10,3)=1;
g1(10,7)=params(4);
g1(10,16)=1;
g1(11,8)=(-(params(1)*(1/params(1)-1+params(2))));
g1(12,1)=1;
g1(12,21)=1;
g1(13,1)=(-1);
g1(13,4)=1;
g1(13,10)=(-(1-(1-params(6)*params(7))));
g1(13,13)=(-(1-params(6)*params(7)));
g1(13,17)=(-1);
g1(14,5)=1;
g1(14,11)=(-(1-(1-params(6)*params(7))));
g1(14,14)=(-(1-params(6)*params(7)));
g1(14,17)=(-1);
g1(15,10)=(-(1-T(1)));
g1(15,11)=(-T(1));
g1(15,12)=1;
g1(16,13)=(-(1-T(1)));
g1(16,14)=(-T(1));
g1(16,15)=1;
g1(17,4)=(-(1-T(1)));
g1(17,5)=(-T(1));
g1(17,6)=1;
g1(18,17)=1-params(10);
g1(19,1)=1;
g1(19,4)=(-1);
g1(19,19)=1;
g1(20,5)=(-1);
g1(20,20)=1;
g1(21,1)=1-T(1);
g1(21,4)=(-(1-T(1)));
g1(21,5)=(-T(1));
g1(21,18)=1;
g1(22,12)=params(7);
g1(22,15)=1-params(7);
g1(22,18)=(-1);
g1(22,24)=1;
g1(23,12)=1;
g1(23,18)=(-1);
g1(23,22)=1;
g1(24,9)=(-1);
g1(24,12)=(-1);
g1(24,18)=1;
g1(24,23)=1;
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
