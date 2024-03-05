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

assert(length(T) >= 15);

T = bcf_nonlin.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(7) = getPowerDeriv(y(1),params(3),1);
T(8) = T(3)*T(7);
T(9) = (-(y(13)*params(3)*y(10)))/(y(5)*y(5));
T(10) = (y(9)*y(6)-params(2)*y(2))*(y(9)*y(6)-params(2)*y(2));
T(11) = (y(13)*y(11)-y(6)*params(2))*(y(13)*y(11)-y(6)*params(2));
T(12) = getPowerDeriv(y(3),1-params(3),1);
T(13) = 1/y(13);
T(14) = getPowerDeriv(y(9),(-params(3)),1);
T(15) = (-y(12))/(y(13)*y(13));

end
