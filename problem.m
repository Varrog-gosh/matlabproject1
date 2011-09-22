function [ g ] = problem ( X )
%PROBLEM Generate the function g using the data given by DATA.

[ b, H, c ] = data;
dim = size(H,1);
C = zeros ( dim, dim );
for i = 1:N
	C(i,i) = c(i) * X(i) * X(i);
end

g = - b' * X + 0.5 * X' * H * X + 1/12 * X' * C * X;

end
