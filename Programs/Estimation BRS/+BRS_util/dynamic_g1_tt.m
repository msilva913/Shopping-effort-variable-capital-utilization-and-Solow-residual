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

T = BRS_util.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(39) = exp(y(35))*getPowerDeriv(y(39),1/params(9),1);
T(40) = T(20)*getPowerDeriv(y(40),params(8),1);
T(41) = T(21)*getPowerDeriv(y(41),params(8),1);
T(42) = exp(y(44))*getPowerDeriv(exp(y(44)),(-T(19)),1);

end
