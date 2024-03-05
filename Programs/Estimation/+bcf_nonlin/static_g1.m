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
    T = bcf_nonlin.static_g1_tt(T, y, x, params);
end
g1 = zeros(7, 7);
g1(1,7)=1;
g1(2,3)=(-(y(7)*(y(7)-params(2))))/((y(7)*y(3)-y(3)*params(2))*(y(7)*y(3)-y(3)*params(2)))-(-(params(2)*params(1)*(y(7)-params(2))))/((y(7)*y(3)-y(3)*params(2))*(y(7)*y(3)-y(3)*params(2)));
g1(2,6)=(-1);
g1(2,7)=(y(7)*y(3)-y(3)*params(2)-y(7)*y(3))/((y(7)*y(3)-y(3)*params(2))*(y(7)*y(3)-y(3)*params(2)))-(-(y(3)*params(2)*params(1)))/((y(7)*y(3)-y(3)*params(2))*(y(7)*y(3)-y(3)*params(2)));
g1(3,1)=(1-params(3))*1/y(4);
g1(3,4)=(1-params(3))*(-y(1))/(y(4)*y(4));
g1(3,6)=(-((-1)/(y(6)*y(6))));
g1(4,1)=params(1)*T(1)*y(7)*params(3)/y(2);
g1(4,2)=params(1)*T(1)*(-(y(7)*params(3)*y(1)))/(y(2)*y(2));
g1(4,6)=params(1)*T(2)*1/y(7)-1;
g1(4,7)=params(1)*(T(2)*(-y(6))/(y(7)*y(7))+T(1)*params(3)*y(1)/y(2));
g1(5,2)=(1-params(6))/y(7)-1;
g1(5,5)=1;
g1(5,7)=(-(y(2)*(1-params(6))))/(y(7)*y(7));
g1(6,1)=1;
g1(6,2)=(-(T(6)*T(3)*getPowerDeriv(y(2),params(3),1)));
g1(6,4)=(-(T(5)*getPowerDeriv(y(4),1-params(3),1)));
g1(6,7)=(-(T(6)*T(4)*getPowerDeriv(y(7),(-params(3)),1)));
g1(7,1)=1;
g1(7,3)=(-1);
g1(7,5)=(-1);
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
