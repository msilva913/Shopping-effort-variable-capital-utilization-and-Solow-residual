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

assert(length(T) >= 68);

T = BRS_sectoral.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(51) = getPowerDeriv(T(8),params(6),1);
T(52) = getPowerDeriv(y(89)*y(4),T(21),1);
T(53) = getPowerDeriv(y(90)*y(5),T(21),1);
T(54) = getPowerDeriv(T(33),1/(1+params(20)),1);
T(55) = getPowerDeriv(y(72)/y(74),params(20),1);
T(56) = getPowerDeriv(y(72),T(22),1);
T(57) = getPowerDeriv(y(73)/y(74),params(20),1);
T(58) = getPowerDeriv(y(73),T(22),1);
T(59) = T(34)*getPowerDeriv(y(74),T(3),1);
T(60) = exp(y(79))*getPowerDeriv(y(99),1/params(18),1);
T(61) = exp(y(79))*getPowerDeriv(y(99),T(2),1)/T(2);
T(62) = T(24)*getPowerDeriv(y(100),T(1),1);
T(63) = T(25)*getPowerDeriv(y(101),T(1),1);
T(64) = getPowerDeriv(y(183)/y(102),(-params(1)),1);
T(65) = T(12)*params(3)*exp(y(81))*(-y(183))/(y(102)*y(102))*T(64);
T(66) = T(12)*params(3)*exp(y(81))*T(64)*1/y(102);
T(67) = exp(y(113))*getPowerDeriv(exp(y(113)),(-T(21)),1);
T(68) = T(11)*exp(y(188))*getPowerDeriv(exp(y(188)),(-params(1)),1);

end
