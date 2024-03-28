function T = static_resid_tt(T, y, x, params)
% function T = static_resid_tt(T, y, x, params)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%
% Output:
%   T         [#temp variables by 1]  double   vector of temporary terms
%

assert(length(T) >= 35);

T(1) = 1+params(12)/params(13)-exp(params(4));
T(2) = T(1)+exp(params(4))^params(1)/params(3)-1;
T(3) = params(13)*T(2)/(1+params(15));
T(4) = params(14)/(1+params(15));
T(5) = exp(params(4))^(-T(3));
T(6) = (1-params(12)+params(15)*(1-params(12)))/(T(5)*((1-params(12))*params(13)*exp(params(4)))^T(3)*((1-params(12))*params(26))^T(4));
T(7) = (params(12)+params(12)*params(15))/(T(5)*(params(12)*params(13)*exp(params(4)))^T(3)*(params(12)*params(26))^T(4));
T(8) = 1/params(5);
T(9) = (1-params(12))^(-params(17));
T(10) = (1-(1-params(12)))^(-params(17));
T(11) = y(10)^(1+params(17))*T(9)+y(11)^(1+params(17))*T(10);
T(12) = (y(10)/y(12))^params(17);
T(13) = params(14)/params(26)/(params(7)*(1-params(12))*(1-params(16))*params(26)^T(8))*exp(y(16));
T(14) = y(12)^T(8)*T(13);
T(15) = (y(11)/y(12))^params(17);
T(16) = T(13)*y(12)^(1+T(8))/(1+T(8));
T(17) = y(36)*T(16);
T(18) = (y(2)-params(16)*y(2))^params(6);
T(19) = y(36)^(1-params(6));
T(20) = params(3)*exp(y(17))*exp(y(46))^(-params(1));
T(21) = y(40)^2;
T(22) = y(33)*y(38)*T(20)*T(21);
T(23) = y(41)^2;
T(24) = y(34)*T(20)*y(39)*T(23);
T(25) = y(10)^T(4);
T(26) = exp(y(46))^(-T(3));
T(27) = exp(y(13))*T(6)*T(26);
T(28) = (y(25)*y(7))^T(3);
T(29) = y(11)^T(4);
T(30) = exp(y(15))*T(7)*T(26);
T(31) = (y(26)*y(8))^T(3);
T(32) = y(7)^T(3);
T(33) = T(25)*T(32)-params(15)*(1-params(12));
T(34) = y(8)^T(3);
T(35) = T(29)*T(34)-params(12)*params(15);

end
