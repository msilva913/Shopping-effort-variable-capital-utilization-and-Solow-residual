function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
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

assert(length(T) >= 56);

T(1) = (1+params(17))*params(16)/(1+params(17)*params(16));
T(2) = 1+1/params(17);
T(3) = 1/params(5);
T(4) = (y(35)/y(37))^params(19);
T(5) = (y(36)/y(37))^params(19);
T(6) = exp(y(42))*y(59)^(1/params(17));
T(7) = exp(y(42))*y(59)^T(2)/T(2);
T(8) = y(27)-params(15)*y(1)-T(7);
T(9) = T(8)^params(6);
T(10) = y(12)^(1-params(6));
T(11) = params(3)*exp(y(44))*(y(103)/y(62))^(-params(1));
T(12) = exp(y(108))^(-params(1));
T(13) = T(11)*T(12);
T(14) = y(106)^2;
T(15) = T(13)*y(104)*y(101)*T(14);
T(16) = y(107)^2;
T(17) = T(13)*y(105)*y(102)*T(16);
T(18) = 1-T(1);
T(19) = y(60)^T(1);
T(20) = y(61)^T(1);
T(21) = 1+params(11)/params(12)-exp(params(4));
T(22) = exp(params(4))^params(1)/params(3)-1+T(21);
T(23) = params(12)*T(22)/(1+params(14));
T(24) = params(13)*T(18)/(1+params(14));
T(25) = T(1)^(params(17)/(1+params(17)));
T(26) = params(18)/((1-params(11))*T(25))^T(1);
T(27) = params(18)/(params(11)*T(25))^T(1);
T(28) = params(14)*(1-params(11))/params(18);
T(29) = params(11)*params(14)/params(18);
T(30) = exp(params(4))^(-T(23));
T(31) = (T(28)+(1-params(11))/params(18))/(T(30)*((1-params(11))*params(12)*exp(params(4)))^T(23)*((1-params(11))*params(28))^T(24));
T(32) = (T(29)+params(11)/params(18))/(T(30)*(params(11)*params(12)*exp(params(4)))^T(23)*(params(11)*params(28))^T(24));
T(33) = (1-params(11))^(-params(19));
T(34) = (1-(1-params(11)))^(-params(19));
T(35) = y(35)^(1+params(19))*T(33)+y(36)^(1+params(19))*T(34);
T(36) = exp(y(41))*params(13)/params(28)*T(18)/(params(28)^T(3)*((1-params(11))*(1-params(15))-(T(25))^T(2)/T(2)));
T(37) = y(37)^T(3)*T(36);
T(38) = y(37)^(1+T(3))*T(36)/(1+T(3));
T(39) = y(63)*T(38);
T(40) = T(19)*T(26);
T(41) = exp(y(71))^(-T(23));
T(42) = exp(y(38))*T(31)*T(41);
T(43) = (y(49)*y(4))^T(23);
T(44) = y(35)^T(24);
T(45) = T(20)*T(27);
T(46) = exp(y(40))*T(32)*T(41);
T(47) = (y(50)*y(5))^T(23);
T(48) = y(36)^T(24);
T(49) = T(19)*y(27)/y(26)*T(26);
T(50) = T(49)*(T(43)*T(44)-T(28));
T(51) = y(4)^T(23);
T(52) = T(44)*T(51)-T(28);
T(53) = T(20)*y(28)/y(26)*T(27);
T(54) = T(53)*(T(47)*T(48)-T(29));
T(55) = y(5)^T(23);
T(56) = T(48)*T(55)-T(29);

end
