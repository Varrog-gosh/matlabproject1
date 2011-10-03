function time = meantime ( X, method, tol, maxiterations, experiments )
%PLOTMETHOD For different methods, the needed time is returned.
% INPUT
%  X				initial guess for the minimum
%  method			indicates which method is choosen. If method<0, a mixture of the steepest decent and Newton method will be used, for the rest see description in delta.m
%  tol				tolerance for the relative residual
%  maxiterations	the maximum number of iterations
%  experiments		number of experiments
% OUTPUT
%  time				time needed for the method

tic;
for i = 1 : experiments
	fastmethod ( X, method, tol, maxiterations );
end
time = 1000*toc/ experiments;
end
