function [ delta ] = delta ( X, method )
%DELTA Computes the cange of X for different methods.
% INPUT
%  X		the value of X in this iteration
%  method	a number to decide which method should be used.
%   * positive number	number is used as step size for steepest decent method
%   * 0					steepest decent method with optimal alpha
%   * Inf				Newton method
% OUTPUT
%  delta	the change of X in the formular X^{k+1} = X^k - delta

delta = 0;
if method == Inf
	delta = linsolve ( hessian ( X ), grad ( X ) );
elseif method == 0
	delta = optimalAlpha ( X ) * grad ( X );
elseif method > 0
	delta = method * grad ( X );
end
