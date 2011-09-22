function [ iterations, X, Y, Z ] = steepest( Xk, alpha )
%STEEPEST Find a local minimum iteratively with the initial guess x0, returns 4 variables for ploting the function : 
% iteration is a vector with the numbers of iterations, X is a vector which contains all the iterations, Y is a vector which contains all the residual values and Z is the vector wich contain all the values of G along the iterations

tol = 1e-6;
maxiterations = 1000;
[~,H,~] = data;
dim = size(H, 2);
X = zeros(2, maxiterations);
Y = zeros(1, maxiterations);
Z = zeros(1, maxiterations);
condition = 1;
norm_old = norm ( grad ( Xk) );

while condition
	maxiterations = maxiterations - 1;
	Xk = Xk - alpha * grad ( Xk );
	if dim == 2
			X(1, 1000-maxiterations) = Xk(1);
			X(2, 1000-maxiterations) = Xk(2);
	end
	residual = norm ( grad ( Xk ) ) / norm_old;
	Y(1000-maxiterations) = residual;
	Z(1000-maxiterations) = problem(Xk);
	condition = (maxiterations > 0) && ( residual > tol);
end
X = X(1:1000-maxiterations);
iterations = (1:1:1000-maxiterations);
Z = Z(1:1000-maxiterations);
Y = Y(1:1000-maxiterations);

end
