function [ HessG ] = hessian( N, X )
%HESSG return the heesian of the function G of the project

[~, H, c] = datas;
C = zeros(N,N);
for i=1:N
    C(i,i) = c(i)*X(i)*X(i);
end

HessG = H + C;

end

