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

assert(length(T) >= 84);

T = BRS_sectoral_wo_vcu.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(71) = 1/y(33);
T(72) = getPowerDeriv(T(36),1/T(1),1);
T(73) = getPowerDeriv(T(53),1/(1+params(17)),1);
T(74) = getPowerDeriv(y(49)/y(51),params(17),1);
T(75) = getPowerDeriv(y(50)/y(51),params(17),1);
T(76) = T(54)*getPowerDeriv(y(51),T(4),1);
T(77) = exp(y(57))*getPowerDeriv(y(74),1/params(15),1);
T(78) = T(41)*getPowerDeriv(y(75),params(14),1);
T(79) = T(42)*getPowerDeriv(y(76),params(14),1);
T(80) = T(43)*getPowerDeriv(y(77),params(14),1);
T(81) = T(13)*params(2)*exp(y(59))*(-y(132))/(y(82)*y(82));
T(82) = T(13)*params(2)*exp(y(59))*1/y(82);
T(83) = T(12)*getPowerDeriv(T(12),(-T(40)),1);
T(84) = params(2)*exp(y(59))*y(132)/y(82)*exp(y(139))*getPowerDeriv(exp(y(139)),(-params(1)),1);

end
