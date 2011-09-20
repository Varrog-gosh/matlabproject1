function [ nablaG ] = gradient( N, X )
%NABLAG return the gradient of the function G of the project

nablaG = zeros(N);
[b, H, c] = datas;
S = zeros(N,1);
C = zeros(N,N);
for i=1:N
    C(i,i) = c(i)*X(i)*X(i);
end

for i=1:N
    for j=1:N
        S = X(j)*H(i,j);
    end
    nablaG(i) = -b(i) + S + 1/3*C(i,i)*X(i)*X(i)*X(i);
end


end
