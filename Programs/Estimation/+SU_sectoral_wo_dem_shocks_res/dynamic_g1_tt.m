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

assert(length(T) >= 108);

T = SU_sectoral_wo_dem_shocks_res.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(86) = 1/y(31);
T(87) = getPowerDeriv(T(37),1/T(1),1);
T(88) = getPowerDeriv(y(63)*y(5),T(43),1);
T(89) = getPowerDeriv(y(64)*y(6),T(43),1);
T(90) = getPowerDeriv(y(65)*y(7),T(43),1);
T(91) = getPowerDeriv(y(45),T(2),1);
T(92) = T(61)*T(65)*T(91);
T(93) = getPowerDeriv(y(46),T(2),1);
T(94) = T(67)*T(70)*T(93);
T(95) = getPowerDeriv(T(56),1/(1+params(19)),1);
T(96) = getPowerDeriv(y(47)/y(49),params(19),1);
T(97) = getPowerDeriv(y(48)/y(49),params(19),1);
T(98) = getPowerDeriv(y(48),T(2),1);
T(99) = T(72)*T(75)*T(98);
T(100) = T(57)*getPowerDeriv(y(49),T(4),1);
T(101) = getPowerDeriv(y(79),1/params(17),1);
T(102) = T(44)*getPowerDeriv(y(80),params(16),1);
T(103) = T(45)*getPowerDeriv(y(81),params(16),1);
T(104) = T(46)*getPowerDeriv(y(82),params(16),1);
T(105) = T(12)*params(2)*exp(y(54))*(-y(143))/(y(87)*y(87));
T(106) = T(12)*params(2)*exp(y(54))*1/y(87);
T(107) = T(11)*getPowerDeriv(T(11),(-T(43)),1);
T(108) = params(2)*exp(y(54))*y(143)/y(87)*exp(y(150))*getPowerDeriv(exp(y(150)),(-params(1)),1);

end
