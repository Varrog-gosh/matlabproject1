function [ x ] = steepest( x0 )
%STEEPEST find a local minimum iteratively with the initial guest x0

xold = x0;
tol = [10e-3;10e-3];
alpha = 0.01;
x = xold - alpha*grad(xold);

while (abs(xold-x) >=tol)
    xold = x;
    x=xold - alpha*grad(xold);
    x
end

end

