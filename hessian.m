function [ HessG ] = hessian( X )
%HESSG Return the heesian of the function G of the project

[ ~, H, c ] = data;
dim = size ( H, 1 );
C = zeros ( dim, dim );
for i = 1 : dim
    C(i,i) = c(i) * X(i) * X(i);
end

HessG = H + C;

end

