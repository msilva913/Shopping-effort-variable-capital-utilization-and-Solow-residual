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

assert(length(T) >= 36);

T = BRS_extended_fd.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(32) = getPowerDeriv(y(31)*y(2),T(15),1);
T(33) = getPowerDeriv(y(32)*y(3),T(15),1);
T(34) = exp(y(27))*getPowerDeriv(y(37),1/params(11),1);
T(35) = getPowerDeriv(y(63)/y(40),(-params(1)),1);
T(36) = (-(T(23)*y(64)*(params(6)*(y(65)-T(2))+params(6)*y(65)-T(8)*2*(y(65)-T(2)))));

end
