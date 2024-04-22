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

assert(length(T) >= 58);

T(1) = (params(6)-1)/params(6);
T(2) = params(15)/(1+params(16));
T(3) = 1/params(4);
T(4) = (y(69)/y(71))^params(18);
T(5) = (y(70)/y(71))^params(18);
T(6) = params(7)*y(103)^(-params(6));
T(7) = (y(55)-params(17)*y(1))^params(5);
T(8) = y(14)^(1-params(5));
T(9) = params(11)/2;
T(10) = exp(y(116));
T(11) = exp(y(187))^(-params(1));
T(12) = params(2)*exp(y(76))*y(180)/y(105)*T(11);
T(13) = y(184)^2;
T(14) = T(12)*y(181)*y(177)*T(13);
T(15) = y(185)^2;
T(16) = T(12)*y(182)*y(178)*T(15);
T(17) = y(186)^2;
T(18) = T(12)*y(183)*y(179)*T(17);
T(19) = (1-params(7))*y(102)^(-params(6));
T(20) = params(7)^(1-T(1));
T(21) = (1-params(7))^(1-T(1));
T(22) = T(20)*y(57)^T(1)+T(21)*y(56)^T(1);
T(23) = y(67)^T(2);
T(24) = y(68)^T(2);
T(25) = y(70)^T(2);
T(26) = 1+params(13)/params(14)-exp(params(3));
T(27) = exp(params(3))^params(1)/params(2)-1+T(26);
T(28) = params(14)*T(27)/(1+params(16));
T(29) = exp(params(3))^(-T(28));
T(30) = ((1-params(7))*(1-params(13))+params(16)*(1-params(7))*(1-params(13)))/(T(29)*(params(14)*exp(params(3))*(1-params(7))*(1-params(13)))^T(28)*((1-params(7))*(1-params(13))*params(27))^T(2));
T(31) = (params(7)*(1-params(13))+params(16)*params(7)*(1-params(13)))/(T(29)*(params(14)*exp(params(3))*params(7)*(1-params(13)))^T(28)*(params(7)*(1-params(13))*params(27))^T(2));
T(32) = (params(13)+params(13)*params(16))/(T(29)*(params(13)*params(14)*exp(params(3)))^T(28)*(params(13)*params(27))^T(2));
T(33) = (1-params(13))^(-params(18));
T(34) = (1-(1-params(13)))^(-params(18));
T(35) = y(69)^(1+params(18))*T(33)+y(70)^(1+params(18))*T(34);
T(36) = exp(y(75))*params(15)/params(27)/(params(8)*params(27)^T(3)*(1-params(13))*(1-params(17)));
T(37) = y(71)^T(3)*T(36);
T(38) = y(71)^(1+T(3))*T(36)/(1+T(3));
T(39) = y(101)*T(38);
T(40) = params(9)*T(27)/2;
T(41) = T(10)^(-T(28));
T(42) = exp(y(72))*T(30)*T(41);
T(43) = (y(85)*y(5))^T(28);
T(44) = T(42)*T(43);
T(45) = T(23)*T(44)-params(16)*(1-params(7))*(1-params(13));
T(46) = exp(y(72))*T(31)*T(41);
T(47) = (y(86)*y(6))^T(28);
T(48) = T(46)*T(47);
T(49) = exp(y(74))*T(32)*T(41);
T(50) = (y(87)*y(7))^T(28);
T(51) = T(49)*T(50);
T(52) = T(25)*T(51)-params(13)*params(16);
T(53) = y(5)^T(28);
T(54) = T(42)*T(53);
T(55) = T(23)*T(54)-params(16)*(1-params(7))*(1-params(13));
T(56) = y(7)^T(28);
T(57) = T(49)*T(56);
T(58) = T(25)*T(57)-params(13)*params(16);

end
