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

assert(length(T) >= 63);

T = BRS_growth_util.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(47) = getPowerDeriv(y(42)*y(2),T(16),1);
T(48) = getPowerDeriv(y(43)*y(3),T(16),1);
T(49) = getPowerDeriv(y(29),1/params(5),1);
T(50) = exp(y(35))*(-(params(10)/params(23)*T(12)*T(49)))/(T(3)*T(3));
T(51) = getPowerDeriv(y(30),T(17),1);
T(52) = getPowerDeriv(y(31),T(17),1);
T(53) = T(10)*T(9)*(-(exp(y(38))*T(27)))/(exp(y(38))*exp(y(38)));
T(54) = exp(y(36))*getPowerDeriv(y(50),1/params(13),1);
T(55) = getPowerDeriv(y(51),T(2),1);
T(56) = T(19)*T(55);
T(57) = getPowerDeriv(y(52),T(2),1);
T(58) = T(20)*T(57);
T(59) = getPowerDeriv(y(91)/y(53),(-params(1)),1);
T(60) = T(10)*T(27)/exp(y(38))*(-y(91))/(y(53)*y(53))*T(59);
T(61) = T(10)*T(27)/exp(y(38))*T(59)*1/y(53);
T(62) = exp(y(59))*getPowerDeriv(exp(y(59)),(-T(16)),1);
T(63) = T(9)*T(27)/exp(y(38))*exp(y(94))*getPowerDeriv(exp(y(94)),(-params(1)),1);

end
