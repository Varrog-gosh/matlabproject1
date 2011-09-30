function [ residual, time ] = fastmethod ( X, method, tol, maxiterations, experiments )
%NOWTON returns the zero of grad(g) = -b +Hx + 1/3 C(X)X, the minimum of g.

% does all experiments have different times?
% do we have to take the mean?

if method == 'steepest-newton'
time = 0;
for ex = 1: experiments
	tic;
	% steepest decent method
	norm_old = norm ( grad ( X ) );
	condition = 1;
	while condition % the condition is calculated at the end of the while loop, because there should at least one iteration
		maxiterations = maxiterations - 1; % count from the maximum number of iterations to zero
		X = X - delta ( X, 0 );
		residual = norm( grad ( X ) ) / norm_old; % the residual
		condition = ( maxiterations > 0 ) && ( residual > tol );
	end

	% newton method
	norm_old = norm ( grad ( X ) );
	condition = 1;
	while condition % the condition is calculated at the end of the while loop, because there should at least one iteration
		maxiterations = maxiterations - 1; % count from the maximum number of iterations to zero
		X = X - delta ( X, 'newton' );
		residual = norm( grad ( X ) ) / norm_old; % the residual
		condition = ( maxiterations > 0 ) && ( residual > tol );
	end

	time = time + toc;
end
time = time / experiments;
end


time = 0;
for ex = 1: experiments
	tic;
	norm_old = norm ( grad ( X ) );
	condition = 1;
	while condition % the condition is calculated at the end of the while loop, because there should at least one iteration
		maxiterations = maxiterations - 1; % count from the maximum number of iterations to zero
		X = X - delta ( X, method );
		residual = norm( grad ( X ) ) / norm_old; % the residual
		condition = ( maxiterations > 0 ) && ( residual > tol );
	end
	time = time + toc;
end
time = time / experiments;
end

