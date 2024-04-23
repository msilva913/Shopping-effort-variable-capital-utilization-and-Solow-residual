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

assert(length(T) >= 87);

T = BRS_sectoral_wo_vcu.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(72) = 1/y(65);
T(73) = getPowerDeriv(T(11),params(5),1);
T(74) = getPowerDeriv(T(36),1/T(1),1);
T(75) = getPowerDeriv(T(53),1/(1+params(19)),1);
T(76) = getPowerDeriv(y(81)/y(83),params(19),1);
T(77) = getPowerDeriv(y(82)/y(83),params(19),1);
T(78) = T(54)*getPowerDeriv(y(83),T(5),1);
T(79) = exp(y(88))*getPowerDeriv(y(105),1/params(17),1);
T(80) = exp(y(88))*getPowerDeriv(y(105),T(4),1)/T(4);
T(81) = T(41)*getPowerDeriv(y(106),params(16),1);
T(82) = T(42)*getPowerDeriv(y(107),params(16),1);
T(83) = T(43)*getPowerDeriv(y(108),params(16),1);
T(84) = T(16)*params(2)*exp(y(90))*(-y(193))/(y(114)*y(114));
T(85) = T(16)*params(2)*exp(y(90))*1/y(114);
T(86) = T(15)*getPowerDeriv(T(15),(-T(40)),1);
T(87) = params(2)*exp(y(90))*y(193)/y(114)*exp(y(200))*getPowerDeriv(exp(y(200)),(-params(1)),1);

end
