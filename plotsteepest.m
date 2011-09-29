function plotsteepest(X, alph, tol, nbiterations)

[iterations, Xk, Y, Z] = steepest(X, alph, tol, nbiterations);
[ ~, H, ~] = data;
dim = size(H, 2);

%plot which shows how the residual decreases with the number of iteratives


semilogy(iterations, Y);
grid;
xlabel('Iterations');
ylabel('Relative residual');

%plot which shows how G decreases with the iterations

figure;
hold off;
semilogy(iterations, Z);
xlabel('Iterations');
ylabel('g');
grid;

%plot which shows the iterations on the surface of G
if dim == 2
    figure; % plot stepest method with constant alpha.
    hold off;
    plotfunction;
    hold on;
    G = zeros(1:1:size(iterations));
    for i=size(iterations);
        G(i) = problem([Xk(1,i); Xk(2,i)]);
    end
    plot3(Xk(1,:), Xk(2,:), G, 'r-o');
    
        
    alpha = alphaop(X); %plot steepest method with optimal alpha
    [iterations, Xk, ~, ~] = steepest(X, alpha, tol, nbiterations);
    G = zeros(1:1:size(iterations));
    for i=size(iterations);
        G(i) = problem([Xk(1,i); Xk(2,i)]);
    end
    plot3(Xk(1,:), Xk(2,:), G, 'g-o');
    
    
    
    [iterations, Xk] = newton(X, tol, nbiterations);
    G = zeros(1:1:size(iterations)); % Plot newton method on the same graph
    for i=size(iterations);
        G(i) = problem([Xk(1,i); Xk(2,i)]);
    end
    plot3(Xk(1,:), Xk(2,:), G, 'k-+');
    
end

end