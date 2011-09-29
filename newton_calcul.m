function [ Xk, residual ] = newton_calcul ( Xk, tol, nbiterations )
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
condition = 1;
norm_old = norm ( grad ( Xk) );

while condition % the condition is calculated at the end of the while loop, because there should at least one iteration
    maxiterations = maxiterations - 1; % count from the maximum number of iterations to zero
    Xk = Xk - linsolve( hessian ( Xk ), grad ( Xk ) ); % the algorithm of the newton method
    residual = norm( grad ( Xk ) ) / norm_old; % the residual
    condition = ( maxiterations > 0 ) && ( residual > tol );
end

end

