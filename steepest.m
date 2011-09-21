function [ X ] = steepest( X, alpha )
%STEEPEST Find a local minimum iteratively with the initial guess x0

tol = 1e-6;
maxiterations = 1000;

condition = 1;
norm_old = norm ( grad ( X ) );

while condition
	maxiterations = maxiterations - 1;
	X = X - alpha * grad ( X );
	residual = norm ( grad ( X ) ) / norm_old;
	condition = (maxiterations > 0) && ( residual > tol);
end

end

