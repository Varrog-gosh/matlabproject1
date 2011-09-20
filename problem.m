function [ g ] = problem ( X, N )
%PROBLEM generate the function g using the data given by DATA.

[ b, H, c ] = data;
C = zeros (N, N);
for i = 1:N
	C(i,i) = c(i) * X(i) * X(i);
end

g = -b'*X + 0.5 * X' * H * X + 1/12 * X' * C * X;

end
