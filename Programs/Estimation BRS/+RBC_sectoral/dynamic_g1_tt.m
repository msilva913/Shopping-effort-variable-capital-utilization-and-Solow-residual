function T = dynamic_g1_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_g1_tt(T, y, x, params, steady_state, it_)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double  vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double  vector of endogenous variables in the order stored
%                                                    in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double  matrix of exogenous variables (in declaration order)
%                                                    for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double  vector of steady state values
%   params        [M_.param_nbr by 1]        double  vector of parameter values in declaration order
%   it_           scalar                     double  time period for exogenous variables for which
%                                                    to evaluate the model
%
% Output:
%   T           [#temp variables by 1]       double  vector of temporary terms
%

assert(length(T) >= 51);

T = RBC_sectoral.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(38) = getPowerDeriv(y(53)-params(16)*y(1),params(6),1);
T(39) = getPowerDeriv(y(76)*y(4),T(18),1);
T(40) = getPowerDeriv(y(77)*y(5),T(18),1);
T(41) = getPowerDeriv(T(24),1/(1+params(17)),1);
T(42) = getPowerDeriv(y(61)/y(63),params(17),1);
T(43) = getPowerDeriv(y(61),T(1),1);
T(44) = getPowerDeriv(y(62)/y(63),params(17),1);
T(45) = getPowerDeriv(y(62),T(1),1);
T(46) = T(25)*getPowerDeriv(y(63),T(2),1);
T(47) = getPowerDeriv(y(157)/y(86),(-params(1)),1);
T(48) = T(8)*params(3)*exp(y(68))*(-y(157))/(y(86)*y(86))*T(47);
T(49) = T(8)*params(3)*exp(y(68))*T(47)*1/y(86);
T(50) = exp(y(97))*getPowerDeriv(exp(y(97)),(-T(18)),1);
T(51) = T(7)*exp(y(162))*getPowerDeriv(exp(y(162)),(-params(1)),1);

end
