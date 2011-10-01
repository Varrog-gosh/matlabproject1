function [ g ] = problem ( X )
%PROBLEM Generate the function g using the data given by DATA.
% INPUT
%  X	The point where the function should be evaluated
% OUTPUT
% g	the value of g at a specific point

[ b, H, c ] = data;
dim = size(H,1);
C = zeros ( dim, dim );

for i = 1 : dim
	C(i,i) = c(i) * X(i) * X(i);
end

g = - b' * X + 0.5 * X' * H * X + 1/12 * X' * C * X;

end
