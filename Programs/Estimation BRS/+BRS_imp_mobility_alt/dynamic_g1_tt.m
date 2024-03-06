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

T = BRS_imp_mobility_alt.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(49) = getPowerDeriv(y(38)*y(3),params(8)*(T(1)+T(21)),1);
T(50) = getPowerDeriv(y(39)*y(4),params(8)*(T(1)+T(21)),1);
T(51) = getPowerDeriv(T(31),1/(1+params(14)),1);
T(52) = getPowerDeriv(y(30),1/params(4),1);
T(53) = exp(y(32))*(-(T(28)*T(52)))/(T(3)*T(3));
T(54) = T(12)*T(11)*(-(exp(y(34))*T(33)))/(exp(y(34))*exp(y(34)));
T(55) = exp(y(33))*getPowerDeriv(y(44),1/params(11),1);
T(56) = getPowerDeriv(y(45),T(2),1);
T(57) = getPowerDeriv(y(46),T(2),1);
T(58) = getPowerDeriv(y(81)/y(47),(-params(1)),1);
T(59) = T(12)*T(33)/exp(y(34))*(-y(81))/(y(47)*y(47))*T(58);
T(60) = T(12)*T(33)/exp(y(34))*T(58)*1/y(47);
T(61) = (-(T(34)*y(82)*(params(6)*(y(83)-params(7)/params(8))+params(6)*y(83)-T(13)*2*(y(83)-params(7)/params(8)))));
T(62) = exp(y(53))*getPowerDeriv(exp(y(53)),(-(params(8)*(T(1)+T(21)))),1);
T(63) = T(11)*T(33)/exp(y(34))*exp(y(84))*getPowerDeriv(exp(y(84)),(-params(1)),1);

end
