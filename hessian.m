function [ HessG ] = hessian( X )
%HESSG return the heesian of the function G of the project

[~, H, c] = data;
N = size(H,1);
C = zeros(N,N);
for i=1:N
    C(i,i) = c(i)*X(i)*X(i);
end

HessG = H + C;

end

