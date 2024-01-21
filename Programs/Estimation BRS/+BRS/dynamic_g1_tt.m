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

assert(length(T) >= 42);

T = BRS.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(29) = getPowerDeriv(y(1),T(14),1);
T(30) = T(22)*T(29);
T(31) = getPowerDeriv(y(2),T(14),1);
T(32) = T(25)*T(31);
T(33) = T(19)*getPowerDeriv(y(13),T(2),1);
T(34) = T(19)*getPowerDeriv(y(13),1+T(2),1)/(1+T(2));
T(35) = getPowerDeriv(y(14),(1-params(8))*params(7),1);
T(36) = getPowerDeriv(y(15),(1-params(8))*params(7),1);
T(37) = exp(y(20))*getPowerDeriv(y(24),T(3),1);
T(38) = exp(y(20))*getPowerDeriv(y(24),T(5),1)/T(5);
T(39) = exp(y(16))*T(17)*T(15)*getPowerDeriv(y(25),params(8),1);
T(40) = exp(y(18))*T(18)*T(16)*getPowerDeriv(y(26),params(8),1);
T(41) = getPowerDeriv(y(27),(-params(1)),1);
T(42) = getPowerDeriv(y(42),(-params(1)),1);

end
