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

assert(length(T) >= 75);

T = BRS_sectoral.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(55) = getPowerDeriv(T(9),params(6),1);
T(56) = getPowerDeriv(y(49)*y(4),T(19),1);
T(57) = getPowerDeriv(y(50)*y(5),T(19),1);
T(58) = getPowerDeriv(T(31),1/(1+params(19)),1);
T(59) = getPowerDeriv(y(35)/y(37),params(19),1);
T(60) = getPowerDeriv(y(35),T(20),1);
T(61) = getPowerDeriv(y(36)/y(37),params(19),1);
T(62) = getPowerDeriv(y(36),T(20),1);
T(63) = T(32)*getPowerDeriv(y(37),T(4),1);
T(64) = T(13)*T(12)*(-(exp(y(44))*T(36)))/(exp(y(44))*exp(y(44)));
T(65) = exp(y(42))*getPowerDeriv(y(59),1/params(17),1);
T(66) = exp(y(42))*getPowerDeriv(y(59),T(3),1)/T(3);
T(67) = getPowerDeriv(y(60),T(2),1);
T(68) = T(22)*T(67);
T(69) = getPowerDeriv(y(61),T(2),1);
T(70) = T(23)*T(69);
T(71) = getPowerDeriv(y(104)/y(62),(-params(1)),1);
T(72) = T(13)*T(36)/exp(y(44))*(-y(104))/(y(62)*y(62))*T(71);
T(73) = T(13)*T(36)/exp(y(44))*T(71)*1/y(62);
T(74) = exp(y(71))*getPowerDeriv(exp(y(71)),(-T(19)),1);
T(75) = T(12)*T(36)/exp(y(44))*exp(y(109))*getPowerDeriv(exp(y(109)),(-params(1)),1);

end
