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

T = BRS_growth_ext_shopping.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(37) = getPowerDeriv(y(29)*y(2),params(8)*(T(1)+T(15)),1);
T(38) = getPowerDeriv(y(30)*y(3),params(8)*(T(1)+T(15)),1);
T(39) = exp(y(25))*getPowerDeriv(y(35),1/params(11),1);
T(40) = getPowerDeriv(y(63)/y(38),(-params(1)),1);
T(41) = (-(T(26)*y(64)*(params(6)*(y(65)-params(7)/params(8))+params(6)*y(65)-T(8)*2*(y(65)-params(7)/params(8)))));
T(42) = exp(y(42))*getPowerDeriv(exp(y(42)),(-(params(8)*(T(1)+T(15)))),1);
T(43) = T(25)*exp(y(66))*getPowerDeriv(exp(y(66)),(-params(1)),1);

end
