function Gvalues
%GVALUES Calculates and plot the function G of the prjoect (given by
%PROBLEM) for every (x1,...,xn)in R^n;

X = (-5:0.1:5);
Y = (-5:0.1:5);
G = zeros(size(X,2), size(Y,2));

for i=1:size(X,2)
    for j=1:size(Y,2)
        G(i, j) = problem([X(i);Y(j)]);
    end
end

surf(X, Y, G);
shading('flat');
end

