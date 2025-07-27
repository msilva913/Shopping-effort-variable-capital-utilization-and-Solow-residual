function [y, T] = dynamic_1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(177)=params(3)*(1-params(20))+params(20)*y(72)+x(1);
  y(125)=params(21)*y(20)+x(2);
  y(129)=params(23)*y(24)-x(4);
  y(130)=params(24)*y(25)-x(5);
  y(131)=params(25)*y(26)-x(6);
  y(132)=params(26)*y(27)+x(7);
  y(133)=params(27)*y(28)+x(8);
  y(134)=params(28)*y(29)+x(9);
end
