function T = static_g1_tt(T, y, x, params)
% function T = static_g1_tt(T, y, x, params)
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

assert(length(T) >= 45);

T = RBC_sectoral.static_resid_tt(T, y, x, params);

T(36) = getPowerDeriv(y(25)*y(7),T(3),1);
T(37) = getPowerDeriv(y(26)*y(8),T(3),1);
T(38) = getPowerDeriv(T(11),1/(1+params(17)),1);
T(39) = getPowerDeriv(y(10)/y(12),params(17),1);
T(40) = getPowerDeriv(y(10),T(4),1);
T(41) = getPowerDeriv(y(11)/y(12),params(17),1);
T(42) = getPowerDeriv(y(11),T(4),1);
T(43) = T(13)*getPowerDeriv(y(12),T(8),1);
T(44) = params(3)*exp(y(17))*exp(y(46))*getPowerDeriv(exp(y(46)),(-params(1)),1);
T(45) = exp(y(46))*getPowerDeriv(exp(y(46)),(-T(3)),1);

end
