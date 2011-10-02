function [ alpha_optimal ] = optimalAlpha( X )
%GET_ALPHA Returns the optimal alpha for the steepest decend method
% alpha is the solution of the equation a_0 + a_1 * α + a_2 * α^2 + a_3 * α^3
% INPUT
%  X	the point in this iteration
% OUTPUT
%  alpah	the optimal alpha for this iteration

[ b, H, c] = data;

dim = size ( H, 1 );
C = zeros ( dim, dim );

gradg = grad ( X );

a3 = 0;
a2 = 0;

for i = 1 : dim
C(i,i) = c(i) * X(i)^2;
a3 = a3 + c(i)/3 * gradg(i)^4;
a2 = a2 - c(i) * X(i) * gradg(i)^3;
end

a1 = gradg' * ( H + C ) * gradg;
a0 = b'*gradg - gradg' * H * X - 1/3 * X' * C * gradg;

% alphas is a vector which contains all (real and complex) zeros
alphas = roots( [ a3, a2, a1, a0 ] );

% here the real alpha is chosen
for i = 1 : 3
    if imag ( alphas ( i ) ) == 0
        alpha_optimal = alphas ( i );
    end
end
end
