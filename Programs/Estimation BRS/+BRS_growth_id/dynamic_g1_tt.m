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

assert(length(T) >= 34);

T = BRS_growth_id.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(31) = exp(y(31))*getPowerDeriv(y(35),1/params(9),1);
T(32) = T(12)*getPowerDeriv(y(36),params(8),1);
T(33) = T(13)*getPowerDeriv(y(37),params(8),1);
T(34) = exp(y(40))*getPowerDeriv(exp(y(40)),(-T(11)),1);

end
