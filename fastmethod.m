function fastmethod ( X, method, tol, maxiterations )
%PLOTMETHOD For different methods, the needed time is returned.
% INPUT
%  X				initial guess for the minimum
%  method			indicates which method is choosen. If method<0, a mixture of the steepest decent and Newton method will be used, for the rest see description in delta.m
%  tol				tolerance for the relative residual
%  maxiterations	the maximum number of iterations
% OUTPUT

norm_old = norm(grad(X));
iteration = 1; % number of iteration
condition = 1;
while condition % the condition is calculated at the end of the while loop, because there should at least one iteration
	iteration = iteration + 1;
	if method < 0
		if norm ( X ) / norm_old > 10^method
			X = X - delta ( X, 0 );
		else
			X = X - delta (X, Inf);
		end
	else
		X = X - delta ( X, method );
	end
	% check if the maximum number of iterations is reached or the relative residual below the tolerance
	condition = ( iteration <= maxiterations ) && ( norm (X) / norm_old > tol );
end
end
