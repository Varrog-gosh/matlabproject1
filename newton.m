function [iterations, X, residuals, g ] = newton ( Xk, tol, nbiterations )
%NOWTON returns the zero of grad(g) = -b +Hx + 1/3 C(X)X, the minimum of g.
% newton ( X_0 ) uses default tolerance and a default value for maxiterations

% setting default values
if nargin == 1
tol = 1e-6;
nbiterations = 1000;
elseif nargin == 3
% correct call of the cunction
tol = tol;
else
% this should not happen. Print error message
'function newton wants 1 or 3 input values'
return
end

maxiterations = nbiterations;
[~,H,~] = data;
dim = size(H, 2);
X1 = zeros(1, maxiterations);
X2 = zeros(1, maxiterations);
residuals = zeros(1, maxiterations);
g = zeros(1, maxiterations);
X1(1) = Xk(1);
X2(1) = Xk(2);
condition = 1;
norm_old = norm ( grad ( Xk) );
residuals(1) = norm_old;
g(1) = problem(Xk);

norm_old = norm ( grad ( Xk ) ); % choose the norm || * ||_2

while condition % the condition is calculated at the end of the while loop, because there should at least one iteration
maxiterations = maxiterations - 1; % count from the maximum number of iterations to zero
Xk = Xk - linsolve( hessian ( Xk ), grad ( Xk ) ); % the algorithm of the newton method
residual = norm( grad ( Xk ) ) / norm_old; % the residual
residuals ( nbiterations - maxiterations + 1 ) = residual;
g(nbiterations-maxiterations+1) = problem (Xk);
if dim == 2
X1(nbiterations-maxiterations+1) = Xk(1);
X2(nbiterations-maxiterations+1) = Xk(2);
end
condition = ( maxiterations > 0 ) && ( residual > tol );
end
X1 = X1(1:nbiterations-maxiterations+1);
X2 = X2(1:nbiterations-maxiterations+1);
X = [X1;X2];
g = g(1:nbiterations-maxiterations+1);
residuals = residuals(1:nbiterations-maxiterations+1);
iterations = (1:1:nbiterations-maxiterations+1);

end
