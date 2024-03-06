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
    T = two_sector_RBC_diff_R.static_g1_tt(T, y, x, params);
end
g1 = zeros(23, 23);
g1(1,2)=(-1);
g1(2,1)=(-1);
g1(2,5)=(-1);
g1(2,8)=1;
g1(2,9)=1;
g1(3,3)=(-1);
g1(3,8)=1;
g1(3,10)=1;
g1(4,1)=(-1);
g1(4,5)=(-1);
g1(4,6)=1;
g1(4,12)=1;
g1(5,3)=(-1);
g1(5,7)=1;
g1(5,13)=1;
g1(6,8)=(-1);
g1(6,11)=1/params(3);
g1(6,15)=(-1);
g1(7,3)=(-params(2));
g1(7,14)=1-(1-params(2));
g1(8,1)=1;
g1(8,5)=params(4);
g1(8,15)=1;
g1(9,6)=(-(params(1)*(1/params(1)-1+params(2))));
g1(10,6)=1;
g1(10,7)=(-1);
g1(11,1)=1;
g1(11,20)=1;
g1(12,5)=1;
g1(12,9)=(-(1-(1-params(5)*params(6))));
g1(12,12)=(-(1-params(5)*params(6)));
g1(12,16)=(-1);
g1(13,3)=1;
g1(13,10)=(-(1-(1-params(5)*params(6))));
g1(13,13)=(-(1-params(5)*params(6)));
g1(13,16)=(-1);
g1(14,9)=(-(1-T(1)));
g1(14,10)=(-T(1));
g1(14,11)=1;
g1(15,12)=(-(1-T(1)));
g1(15,13)=(-T(1));
g1(15,14)=1;
g1(16,1)=(-(1-T(1)));
g1(16,3)=(-T(1));
g1(16,4)=1;
g1(16,5)=(-(1-T(1)));
g1(17,16)=1-params(9);
g1(18,5)=(-1);
g1(18,18)=1;
g1(19,3)=(-1);
g1(19,19)=1;
g1(20,3)=(-T(1));
g1(20,5)=(-(1-T(1)));
g1(20,17)=1;
g1(21,11)=params(6);
g1(21,14)=1-params(6);
g1(21,17)=(-1);
g1(21,23)=1;
g1(22,11)=1;
g1(22,17)=(-1);
g1(22,21)=1;
g1(23,8)=(-1);
g1(23,11)=(-1);
g1(23,17)=1;
g1(23,22)=1;
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
