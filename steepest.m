function [ x ] = steepest( x0, alpha )
%STEEPEST Find a local minimum iteratively with the initial guess x0



xold = x0; % Corresponds to Xk
tol = [10e-3;10e-3]; % Tolerance for the steepest descent method
x = xold - alpha*grad(xold); % Corresonds to Xk+1
stop_criterion = norm(grad(x))/norm(grad(x0)); % Stopping criterion which have to be less than tol at the end of the iteration
itmax = 100; % Number of maximun iterations
icur = 1; % Current iteration



while and(stop_criterion >=tol, icur <= itmax)
    xold = x;
    x=xold - alpha*grad(xold);
    stop_criterion = norm(grad(x))/norm(grad(x0))
    icur = icur + 1;
end
icur
end

