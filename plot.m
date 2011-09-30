function [iteration, xArray, residualArray, valueArray] = plot ( X, method, tol, maxiterations )
%NOWTON returns the zero of grad(g) = -b +Hx + 1/3 C(X)X, the minimum of g.
% INPUT
%  X	initial guess for the minimum
%  tol	toleranz for the relative residual
%  maxiterations	the maximum number of iterations
% OUTPUT
%  iterations	the number of iterations needed till the relative residual is below the tollerance or the maximum number of iterations is reached
%  xArray	matrix with maxiteration rows. Each row contain a vector
%  residualArray	array which contains the relative residuals of every iteration
%  valueArray	array which contains the value of the function g after each iteration

[ ~, H, ~ ] = data;
dim = size(H, 2);
saveX = zeros  ( dim, maxiterations );
valueArray = zeros(1, maxiterations );
residuals = zeros(1, maxiterations );

% save the first point
for i = 1:dim
	saveX ( i, 1 ) = X (i)
end
valueArray(1) = problem(X);
residuals(1) = 1;

norm_old = norm(grad(X));
iteration = 0; % number of iteration
condition = 1;
while condition % the condition is calculated at the end of the while loop, because there should at least one iteration
	iteration = iteration + 1;
	X = X - delta ( X, method );
	% here all information is saved
	for i = 1:dim
		xArray ( i, iteration ) = X (i);
	end
	valueArray ( iteration ) = problem (X);
	residualArray ( iteration ) = norm( grad( X ) ) / norm_old; % the residual
	% check if the maximum number of iterations is reached or the relative residual below the tolerance
	condition = ( iteration > 0 ) && ( residualArray ( iteration ) > tol );
end
end

