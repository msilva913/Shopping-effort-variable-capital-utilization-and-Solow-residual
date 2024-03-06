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

T = RBC_growth.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(38) = getPowerDeriv(y(40)*y(3),T(14),1);
T(39) = getPowerDeriv(y(41)*y(4),T(14),1);
T(40) = getPowerDeriv(T(20),1/(1+params(13)),1);
T(41) = getPowerDeriv(y(28)/y(30),params(13),1);
T(42) = getPowerDeriv(y(28),T(2),1);
T(43) = getPowerDeriv(y(29)/y(30),params(13),1);
T(44) = getPowerDeriv(y(29),T(2),1);
T(45) = T(21)*getPowerDeriv(y(30),T(3),1);
T(46) = T(7)*T(6)*(-(exp(y(35))*T(24)))/(exp(y(35))*exp(y(35)));
T(47) = getPowerDeriv(y(84)/y(48),(-params(1)),1);
T(48) = T(7)*T(24)/exp(y(35))*(-y(84))/(y(48)*y(48))*T(47);
T(49) = T(7)*T(24)/exp(y(35))*T(47)*1/y(48);
T(50) = exp(y(54))*getPowerDeriv(exp(y(54)),(-T(14)),1);
T(51) = T(6)*T(24)/exp(y(35))*exp(y(87))*getPowerDeriv(exp(y(87)),(-params(1)),1);

end
