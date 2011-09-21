function [ nablaG ] = grad( X )
%NABLAG Return the gradient of the function G of the project

[b, H, c] = data;
dim = size(H,1);

for i=1:dim
    C(i,i) = c(i)*X(i)*X(i);
end

nablaG = -b + H*X + 1/3*C*X;
end
