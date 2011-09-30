function [ nablaG ] = grad( X )
%NABLAG Return the gradient of the function G of the project
% INPUT
%  X	The point where the gradient should be calculated
% OUTPUT
%  nablaG	The gradient at a given point

[ b, H, c ] = data;
dim = size ( H, 1 );
C = zeros ( dim, dim );

for i = 1 : dim
	C(i,i) = c(i) * X(i)  * X(i);
end

nablaG = - b + H * X + 1/3 * C * X;

end
