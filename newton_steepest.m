function [ min, residual ] = newton_steepest( Xk, tol, nbiterations )
%NEWTON_STEEPEST Calculates the minumum of the function g with an efficient
%way, which is the combination between newton and steepest method.

alphaop = alphaop(Xk);
[Xk, ~] = steepest_calcul(Xk, alphaop, tol, nbiterations);
[Xk, residual] = newton_calcul([Xk(1,end); Xk(2, end)], tol, nbiterations);

min = problem([Xk(1,end); Xk(2, end)]);
end


