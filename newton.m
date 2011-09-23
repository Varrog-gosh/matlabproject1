function [ X, residuals, g ] = newton ( X, tol, maxiterations )
%NOWTON returns the zero of grad(g) = -b +Hx + 1/3 C(X)X, the minimum of g.
% newton ( X_0 ) uses default tolerance and a default value for maxiterations

% setting default values
if nargin == 1
	tol = 1e-6;
	maxiterations = 1000;
elseif nargin == 3
	% correct call of the cunction
	tol = tol;
else 
	% this should not happen. Print error message
	'function newton wants 1 or 3 input values'
	return
end

condition = 1;
norm_old = norm ( grad ( X ) );  % choose the norm || * ||_2

residuals = zeros ( maxiterations );
residuals = [ 1 ];

g = zeros ( maxiterations );
g = [ X ];

dim = size ( g, 1 );

while condition % the condition is calculated at the end of the while loop, because there should at least one iteration
	maxiterations = maxiterations - 1; % count from the maximum number of iterations to zero
	X = X - linsolve( hessian ( X ), grad ( X ) );   % the algorithm of the newton method
	residual = norm( grad ( X ) ) / norm_old;  % the residual
	residuals ( end + 1 ) = residual;
	for i = 1 : dim 
		g ( i, end + 1 ) = X(i);
	end
	condition = ( maxiterations > 0 ) && ( residual > tol );
end

end
