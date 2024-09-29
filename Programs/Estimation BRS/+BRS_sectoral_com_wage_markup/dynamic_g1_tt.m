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

assert(length(T) >= 109);

T = BRS_sectoral_com_wage_markup.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(87) = 1/y(33);
T(88) = getPowerDeriv(T(38),1/T(1),1);
T(89) = getPowerDeriv(y(67)*y(5),T(44),1);
T(90) = getPowerDeriv(y(68)*y(6),T(44),1);
T(91) = getPowerDeriv(y(69)*y(7),T(44),1);
T(92) = getPowerDeriv(y(47),T(2),1);
T(93) = T(62)*T(66)*T(92);
T(94) = getPowerDeriv(y(48),T(2),1);
T(95) = T(68)*T(71)*T(94);
T(96) = getPowerDeriv(T(57),1/(1+params(19)),1);
T(97) = getPowerDeriv(y(49)/y(51),params(19),1);
T(98) = getPowerDeriv(y(50)/y(51),params(19),1);
T(99) = getPowerDeriv(y(50),T(2),1);
T(100) = T(73)*T(76)*T(99);
T(101) = T(58)*getPowerDeriv(y(51),T(4),1);
T(102) = exp(y(57))*getPowerDeriv(y(83),1/params(17),1);
T(103) = T(45)*getPowerDeriv(y(84),params(16),1);
T(104) = T(46)*getPowerDeriv(y(85),params(16),1);
T(105) = T(47)*getPowerDeriv(y(86),params(16),1);
T(106) = T(13)*params(2)*exp(y(59))*(-y(149))/(y(91)*y(91));
T(107) = T(13)*params(2)*exp(y(59))*1/y(91);
T(108) = T(12)*getPowerDeriv(T(12),(-T(44)),1);
T(109) = params(2)*exp(y(59))*y(149)/y(91)*exp(y(156))*getPowerDeriv(exp(y(156)),(-params(1)),1);

end
