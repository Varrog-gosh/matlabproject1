function [ residual ] = steepest_calcul( X, alpha, tol, maxiterations )
%STEEPEST Find a local minimum iteratively with the initial guess x0, returns 4 variables for ploting the function :
% iteration is a vector with the numbers of iterations, X is a vector which contains all the iterations, Y is a vector which contains all the residual values and Z is the vector wich contain all the values of G along the iterations

norm_old = norm ( grad ( Xk) );

condition = 1;
while condition
    maxiterations = maxiterations - 1;
    X = X - alpha * grad ( X );
    residual = norm ( grad ( X ) ) / norm_old;
    condition = (maxiterations > 0) && ( residual > tol);
end

end
