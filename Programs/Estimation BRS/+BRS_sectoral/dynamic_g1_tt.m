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

assert(length(T) >= 100);

T = BRS_sectoral.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(82) = 1/y(34);
T(83) = getPowerDeriv(T(36),1/T(1),1);
T(84) = getPowerDeriv(y(68)*y(5),T(42),1);
T(85) = getPowerDeriv(y(69)*y(6),T(42),1);
T(86) = getPowerDeriv(y(70)*y(7),T(42),1);
T(87) = getPowerDeriv(y(48),T(2),1);
T(88) = T(57)*T(61)*T(87);
T(89) = getPowerDeriv(y(49),T(2),1);
T(90) = T(63)*T(66)*T(89);
T(91) = getPowerDeriv(y(51),T(2),1);
T(92) = T(68)*T(71)*T(91);
T(93) = exp(y(57))*getPowerDeriv(y(84),1/params(17),1);
T(94) = T(43)*getPowerDeriv(y(85),params(16),1);
T(95) = T(44)*getPowerDeriv(y(86),params(16),1);
T(96) = T(45)*getPowerDeriv(y(87),params(16),1);
T(97) = T(11)*params(2)*exp(y(59))*(-y(150))/(y(92)*y(92));
T(98) = T(11)*params(2)*exp(y(59))*1/y(92);
T(99) = T(10)*getPowerDeriv(T(10),(-T(42)),1);
T(100) = params(2)*exp(y(59))*y(150)/y(92)*exp(y(157))*getPowerDeriv(exp(y(157)),(-params(1)),1);

end
