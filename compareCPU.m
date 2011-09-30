function [ M ] = compareCPU ()
%COMPARECPU is a function only to calculate the CPU time for the different methods
% INPUT
%
% OUTPUT
%  M	Matrix which contains the time and residual for all methods

tol = 1e-6;
maxiterations = 1000;
X = [ 4; -1 ];
experiments = 1000;

[ residual1, time1 ] = fastmethod ( X, 0.00001, tol, maxiterations, experiments );
[ residual2, time2 ] = fastmethod ( X, 0, tol, maxiterations, experiments );
[ residual3, time3 ] = fastmethod ( X, 'newton', tol, maxiterations, experiments );
[ residual4, time4 ] = fastmethod ( X, 'steepest-newton', tol, maxiterations, experiments );

M = [time1, time2, time3, time4;
    residual1, residual2, residual3, residual4];
end

