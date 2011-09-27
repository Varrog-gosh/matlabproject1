function [ Xk, residual ] = steepest_calcul( Xk, alpha, tol, nbiterations )
%STEEPEST Find a local minimum iteratively with the initial guess x0, returns 4 variables for ploting the function :
% iteration is a vector with the numbers of iterations, X is a vector which contains all the iterations, Y is a vector which contains all the residual values and Z is the vector wich contain all the values of G along the iterations


maxiterations = nbiterations;
condition = 1;
norm_old = norm ( grad ( Xk) );


while condition
    maxiterations = maxiterations - 1;
    Xk = Xk - alpha * grad ( Xk );
    residual = norm ( grad ( Xk ) ) / norm_old;
    condition = (maxiterations > 0) && ( residual > tol);
end


end