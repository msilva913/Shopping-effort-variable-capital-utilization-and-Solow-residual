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

assert(length(T) >= 112);

T = BRS_sectoral_wo_demand_shocks.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(88) = 1/y(56);
T(89) = getPowerDeriv(T(10),params(5),1);
T(90) = getPowerDeriv(T(38),1/T(1),1);
T(91) = getPowerDeriv(y(88)*y(5),T(44),1);
T(92) = getPowerDeriv(y(89)*y(6),T(44),1);
T(93) = getPowerDeriv(y(90)*y(7),T(44),1);
T(94) = getPowerDeriv(y(70),T(2),1);
T(95) = T(63)*T(67)*T(94);
T(96) = getPowerDeriv(y(71),T(2),1);
T(97) = T(69)*T(72)*T(96);
T(98) = getPowerDeriv(T(57),1/(1+params(21)),1);
T(99) = getPowerDeriv(y(72)/y(74),params(21),1);
T(100) = getPowerDeriv(y(73)/y(74),params(21),1);
T(101) = getPowerDeriv(y(73),T(2),1);
T(102) = T(74)*T(77)*T(101);
T(103) = T(58)*getPowerDeriv(y(74),T(5),1);
T(104) = getPowerDeriv(y(104),1/params(19),1);
T(105) = getPowerDeriv(y(104),T(4),1)/T(4);
T(106) = T(45)*getPowerDeriv(y(105),params(18),1);
T(107) = T(46)*getPowerDeriv(y(106),params(18),1);
T(108) = T(47)*getPowerDeriv(y(107),params(18),1);
T(109) = T(15)*params(2)*exp(y(79))*(-y(193))/(y(113)*y(113));
T(110) = T(15)*params(2)*exp(y(79))*1/y(113);
T(111) = T(14)*getPowerDeriv(T(14),(-T(44)),1);
T(112) = params(2)*exp(y(79))*y(193)/y(113)*exp(y(200))*getPowerDeriv(exp(y(200)),(-params(1)),1);

end
