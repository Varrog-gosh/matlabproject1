function [ delta ] = delta ( X, method )
%DELTA computes the cange of X for different methods.
% INPUT
%  X	the value of X in this iteration
%  method	a number to decide which method should be used.
%   		positive number	number is used as step size for steepest decent method
%   	0				steepest decent method with optimal alpha
%   	-1				Newton methode
% OUTPUT
%  delta	the change of X in the formular X^{k+1} = X^k - delta

if method == -1
	delta = linsolve ( hessian ( X ), grad ( X ) );
elseif method == 0
	delta = optimalAlpha ( X ) * grad ( X );
elseif method > 0
	delta = method * grad ( X );
end
