function plotsteepest(X, alph, tol, nbiterations)

[iterations1, Xk1, Y1, Z1] = steepest(X, alph, tol, nbiterations);
alpha = alphaop(X); 
[iterations2, Xk2, Y2, Z2] = steepest(X, alpha, tol, nbiterations);
[iterations3, Xk3, Y3, Z3] = newton(X, tol, nbiterations);
[ ~, H, ~] = data;
dim = size(H, 2);

%plot which shows how the residual decreases with the number of iteratives


semilogy(iterations1, Y1, 'r');
hold on;
semilogy(iterations2, Y2, 'g');
semilogy(iterations3, Y3, 'b');
grid;
legend('Steepest method with arbitrary alpha','Steepest method with optimal alpha', 'Newton method');
xlabel('Iterations');
ylabel('Relative residual');

%plot which shows how G decreases with the iterations

figure;
hold on;
semilogy(iterations1, Z1, 'r');
semilogy(iterations2, Z2, 'g');
semilogy(iterations3, Z3, 'b');
legend('Steepest method with arbitrary alpha','Steepest method with optimal alpha', 'Newton method');
xlabel('Iterations');
ylabel('g');
grid;

%plot which shows the iterations on the surface of G
if dim == 2
    figure; % plot stepest method with constant alpha.
    hold off;
    plotfunction;
    hold on;
    G = zeros(1:1:size(iterations1));
    for i=size(iterations1);
        G(i) = problem([Xk1(1,i); Xk1(2,i)]);
    end
    plot3(Xk1(1,:), Xk1(2,:), G, 'r-o');
    
       %plot steepest method with optimal alpha

    G = zeros(1:1:size(iterations2));
    for i=size(iterations2);
        G(i) = problem([Xk2(1,i); Xk2(2,i)]);
    end
    plot3(Xk2(1,:), Xk2(2,:), G, 'g-o');
    
    
    

    G = zeros(1:1:size(iterations3)); % Plot newton method on the same graph
    for i=size(iterations3);
        G(i) = problem([Xk3(1,i); Xk3(2,i)]);
    end
    plot3(Xk3(1,:), Xk3(2,:), G, 'k-+');
    grid;
    title('Comparaisom of the behaviour of the three different iterative methods');
    legend('g', 'Steepest method with arbitrary alpha','Steepest method with optimal alpha', 'Newton method');
    
end

end
