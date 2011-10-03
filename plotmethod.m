function [iteration, xArray, residualArray, valueArray, time ] = plotmethod ( X, method, tol, maxiterations )
%PLOTMETHOD For different methods, the information for all iterations is generated.
% INPUT
%  X				initial guess for the minimum
%  method			indicates which method is choosen. If method<0, a mixture of the steepest decent and Newton method will be used, for the rest see description in delta.m
%  tol				tolerance for the relative residual
%  maxiterations	the maximum number of iterations
% OUTPUT
%  iterations		array which contains the iterations
%  xArray			matrix with maxiteration rows. Each row contain a column vector
%  residualArray	array which contains the relative residuals of every iteration
%  valueArray		array which contains the value of the function g after each iteration
%  time				time needed for the whole method

tic; % start clock
[ ~, H, ~ ] = data;
dim = size(H, 2);
xArray        = zeros ( dim, maxiterations );
valueArray    = zeros (   1, maxiterations );
residualArray = zeros (   1, maxiterations );

% save the first point
for i = 1:dim
	xArray ( i, 1 ) = X (i);
end
valueArray(1) = problem(X);
residualArray(1) = 1;

norm_old = norm(grad(X));
iteration = 1; % number of iteration
condition = 1;
while condition % the condition is calculated at the end of the while loop, because there should at least one iteration
	iteration = iteration + 1;
	if method < 0
		if residualArray (iteration-1) > 10^method
			X = X - delta ( X, 0 );
		else
			X = X - delta (X, Inf);
		end
	else
		X = X - delta ( X, method );
	end
	% here all information is saved
	for i = 1:dim
		xArray ( i, iteration ) = X (i);
	end
	valueArray ( iteration ) = problem (X);
	residualArray ( iteration ) = norm( grad( X ) ) / norm_old; % the residual
	% check if the maximum number of iterations is reached or the relative residual below the tolerance
	condition = ( iteration <= maxiterations ) && ( residualArray ( iteration ) > tol );
end

% adjust the right array size
valueArray = valueArray(1:iteration);
residualArray = residualArray(1:iteration);
xArray = xArray(:,1:iteration);
iteration = [ 1 : iteration ];
time = toc; % end clock
end
