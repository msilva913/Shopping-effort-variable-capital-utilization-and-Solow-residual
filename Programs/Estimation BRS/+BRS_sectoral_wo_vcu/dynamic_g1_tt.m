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

assert(length(T) >= 77);

T = BRS_sectoral_wo_vcu.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(63) = getPowerDeriv(T(11),params(5),1);
T(64) = getPowerDeriv(T(27),1/T(1),1);
T(65) = getPowerDeriv(T(44),1/(1+params(19)),1);
T(66) = getPowerDeriv(y(80)/y(82),params(19),1);
T(67) = getPowerDeriv(y(81)/y(82),params(19),1);
T(68) = T(45)*getPowerDeriv(y(82),T(5),1);
T(69) = exp(y(87))*getPowerDeriv(y(104),1/params(17),1);
T(70) = exp(y(87))*getPowerDeriv(y(104),T(4),1)/T(4);
T(71) = T(32)*getPowerDeriv(y(105),params(16),1);
T(72) = T(33)*getPowerDeriv(y(106),params(16),1);
T(73) = T(34)*getPowerDeriv(y(107),params(16),1);
T(74) = T(16)*params(2)*exp(y(89))*(-y(192))/(y(113)*y(113));
T(75) = T(16)*params(2)*exp(y(89))*1/y(113);
T(76) = T(15)*getPowerDeriv(T(15),(-T(31)),1);
T(77) = params(2)*exp(y(89))*y(192)/y(113)*exp(y(199))*getPowerDeriv(exp(y(199)),(-params(1)),1);

end
