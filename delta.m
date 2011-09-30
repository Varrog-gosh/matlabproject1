function [ delta ] = delta ( X, method )
%DELTA computes the cange of X for different methods.

if method == 'newton'
	delta = linsolve ( hessian ( X ), grad ( X ) );
elseif method == 0
	delta = optimalAlpha ( X ) * grad ( X );
else
	delta = method * grad ( X );
end
