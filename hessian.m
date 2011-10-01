function [ hessG ] = hessian( X )
%HESSG Return the hessian of the function g of the project
% INPUT
%  X	The point where the hessian should be calculated
% OUTPUT
%  hessG	The hessian at a given point

[ ~, H, c ] = data;
dim = size ( H, 1 );
C = zeros ( dim, dim );

for i = 1 : dim
	C(i,i) = c(i) * X(i) * X(i);
end

hessG = H + C;

end
