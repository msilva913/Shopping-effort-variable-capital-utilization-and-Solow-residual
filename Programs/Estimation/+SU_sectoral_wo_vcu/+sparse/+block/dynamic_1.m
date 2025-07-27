function [y, T] = dynamic_1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(155)=params(3)*(1-params(18))+params(18)*y(62)+x(1);
  y(113)=params(19)*y(20)+x(2);
  y(117)=params(21)*y(24)-x(4);
  y(118)=params(22)*y(25)-x(5);
  y(119)=params(23)*y(26)-x(6);
  y(120)=params(24)*y(27)+x(7);
  y(121)=params(25)*y(28)+x(8);
  y(122)=params(26)*y(29)+x(9);
end
