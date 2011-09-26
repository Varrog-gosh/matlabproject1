function [ X ] = improved_steepest( X )
%STEEPEST Find a local minimum iteratively with the initial guess x0

tol = 1e-6;
maxiterations = 10000;

condition = 1;
norm_old = norm ( grad ( X ) );

while condition
	maxiterations = maxiterations - 1;
	X = X - alpha ( X ) * grad ( X );
	residual = norm ( grad ( X ) ) / norm_old;
	condition = (maxiterations > 0) && ( residual > tol);
end
end

