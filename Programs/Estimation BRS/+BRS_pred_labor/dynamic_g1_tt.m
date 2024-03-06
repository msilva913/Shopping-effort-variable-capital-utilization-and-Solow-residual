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

assert(length(T) >= 65);

T = BRS_pred_labor.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(48) = getPowerDeriv(y(45)*y(2),T(16),1);
T(49) = getPowerDeriv(y(46)*y(3),T(16),1);
T(50) = getPowerDeriv(y(31),1/params(5),1);
T(51) = (-(params(10)/params(23)*T(12)*T(50)))/(T(3)*T(3));
T(52) = exp(y(86))*T(26)*T(50)+T(3)*exp(y(86))*T(51);
T(53) = getPowerDeriv(y(4),T(17),1);
T(54) = getPowerDeriv(y(5),T(17),1);
T(55) = T(10)*T(9)*(-(exp(y(40))*T(28)))/(exp(y(40))*exp(y(40)));
T(56) = exp(y(38))*getPowerDeriv(y(53),1/params(13),1);
T(57) = getPowerDeriv(y(54),T(2),1);
T(58) = T(19)*T(57);
T(59) = getPowerDeriv(y(55),T(2),1);
T(60) = T(20)*T(59);
T(61) = getPowerDeriv(y(97)/y(56),(-params(1)),1);
T(62) = T(10)*T(28)/exp(y(40))*(-y(97))/(y(56)*y(56))*T(61);
T(63) = T(10)*T(28)/exp(y(40))*T(61)*1/y(56);
T(64) = exp(y(62))*getPowerDeriv(exp(y(62)),(-T(16)),1);
T(65) = T(9)*T(28)/exp(y(40))*exp(y(100))*getPowerDeriv(exp(y(100)),(-params(1)),1);

end
