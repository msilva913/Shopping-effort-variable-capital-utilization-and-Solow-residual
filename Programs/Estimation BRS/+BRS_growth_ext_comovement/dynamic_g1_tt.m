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

assert(length(T) >= 48);

T = BRS_growth_ext_comovement.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(39) = getPowerDeriv(y(33)*y(2),params(8)*(T(1)+T(16)),1);
T(40) = getPowerDeriv(y(34)*y(3),params(8)*(T(1)+T(16)),1);
T(41) = T(8)*T(7)*(-(exp(y(29))*T(25)))/(exp(y(29))*exp(y(29)));
T(42) = exp(y(28))*getPowerDeriv(y(39),1/params(11),1);
T(43) = getPowerDeriv(y(72)/y(42),(-params(1)),1);
T(44) = T(8)*T(25)/exp(y(29))*(-y(72))/(y(42)*y(42))*T(43);
T(45) = T(8)*T(25)/exp(y(29))*T(43)*1/y(42);
T(46) = (-(T(26)*y(73)*(params(6)*(y(74)-params(7)/params(8))+params(6)*y(74)-T(9)*2*(y(74)-params(7)/params(8)))));
T(47) = exp(y(46))*getPowerDeriv(exp(y(46)),(-(params(8)*(T(1)+T(16)))),1);
T(48) = T(7)*T(25)/exp(y(29))*exp(y(75))*getPowerDeriv(exp(y(75)),(-params(1)),1);

end
