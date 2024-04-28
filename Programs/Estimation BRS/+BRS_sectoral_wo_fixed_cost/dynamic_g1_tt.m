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

assert(length(T) >= 113);

T = BRS_sectoral_wo_fixed_cost.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(89) = 1/y(66);
T(90) = getPowerDeriv(T(11),params(5),1);
T(91) = getPowerDeriv(T(39),1/T(1),1);
T(92) = getPowerDeriv(y(100)*y(5),T(45),1);
T(93) = getPowerDeriv(y(101)*y(6),T(45),1);
T(94) = getPowerDeriv(y(102)*y(7),T(45),1);
T(95) = getPowerDeriv(y(80),T(2),1);
T(96) = T(64)*T(68)*T(95);
T(97) = getPowerDeriv(y(81),T(2),1);
T(98) = T(70)*T(73)*T(97);
T(99) = getPowerDeriv(T(58),1/(1+params(21)),1);
T(100) = getPowerDeriv(y(82)/y(84),params(21),1);
T(101) = getPowerDeriv(y(83)/y(84),params(21),1);
T(102) = getPowerDeriv(y(83),T(2),1);
T(103) = T(75)*T(78)*T(102);
T(104) = T(59)*getPowerDeriv(y(84),T(5),1);
T(105) = exp(y(89))*getPowerDeriv(y(116),1/params(19),1);
T(106) = exp(y(89))*getPowerDeriv(y(116),T(4),1)/T(4);
T(107) = T(46)*getPowerDeriv(y(117),params(18),1);
T(108) = T(47)*getPowerDeriv(y(118),params(18),1);
T(109) = T(48)*getPowerDeriv(y(119),params(18),1);
T(110) = T(16)*params(2)*exp(y(91))*(-y(213))/(y(125)*y(125));
T(111) = T(16)*params(2)*exp(y(91))*1/y(125);
T(112) = T(15)*getPowerDeriv(T(15),(-T(45)),1);
T(113) = params(2)*exp(y(91))*y(213)/y(125)*exp(y(220))*getPowerDeriv(exp(y(220)),(-params(1)),1);

end
