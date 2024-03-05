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

assert(length(T) >= 55);

T = BRS_growth_ext_util.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(44) = getPowerDeriv(y(37)*y(3),params(8)*(T(1)+T(20)),1);
T(45) = getPowerDeriv(y(38)*y(4),params(8)*(T(1)+T(20)),1);
T(46) = T(10)*T(9)*(-(exp(y(33))*T(30)))/(exp(y(33))*exp(y(33)));
T(47) = exp(y(32))*getPowerDeriv(y(43),1/params(11),1);
T(48) = getPowerDeriv(y(44),params(10),1);
T(49) = getPowerDeriv(y(45),params(10),1);
T(50) = getPowerDeriv(y(80)/y(46),(-params(1)),1);
T(51) = T(10)*T(30)/exp(y(33))*(-y(80))/(y(46)*y(46))*T(50);
T(52) = T(10)*T(30)/exp(y(33))*T(50)*1/y(46);
T(53) = (-(T(31)*y(81)*(params(6)*(y(82)-params(7)/params(8))+params(6)*y(82)-T(11)*2*(y(82)-params(7)/params(8)))));
T(54) = exp(y(52))*getPowerDeriv(exp(y(52)),(-(params(8)*(T(1)+T(20)))),1);
T(55) = T(9)*T(30)/exp(y(33))*exp(y(83))*getPowerDeriv(exp(y(83)),(-params(1)),1);

end
