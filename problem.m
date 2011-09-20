function [ g ] = problem ( X)
%PROBLEM generate the function g using the data given by DATA.

[ b, H, c ] = data;

dim = size(H,2); % the dimension of the matrix and vectors
C = zeros (dim, dim);
for i = 1:dim
	C(i,i) = c(i) * X(i) * X(i);
end

g = -b'*X + 0.5 * X' * H * X + 1/12 * X' * C * X;

end