function [y, T] = dynamic_1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(175)=params(3)*(1-params(19))+params(19)*y(71)+x(1);
  y(123)=params(20)*y(19)+x(2);
  y(127)=params(22)*y(23)-x(4);
  y(128)=params(23)*y(24)-x(5);
  y(129)=params(24)*y(25)-x(6);
  y(130)=params(25)*y(26)+x(7);
  y(131)=params(26)*y(27)+x(8);
  y(132)=params(27)*y(28)+x(9);
end
