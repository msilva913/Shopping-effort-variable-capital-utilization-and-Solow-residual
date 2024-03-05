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

assert(length(T) >= 43);

T = BRS_growth_util_shock_err.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(37) = getPowerDeriv(y(37)*y(1),params(9)*(T(1)+T(11)),1);
T(38) = getPowerDeriv(y(38)*y(2),params(9)*(T(1)+T(11)),1);
T(39) = getPowerDeriv(y(25),1/params(5),1);
T(40) = exp(y(32))*getPowerDeriv(y(43),1/params(12),1);
T(41) = getPowerDeriv(y(77)/y(46),(-params(1)),1);
T(42) = exp(y(50))*getPowerDeriv(exp(y(50)),(-(params(9)*(T(1)+T(11)))),1);
T(43) = T(21)*exp(y(79))*getPowerDeriv(exp(y(79)),(-params(1)),1);

end
