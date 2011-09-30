function plotAll ( )
%PLOTALL 


% set values
X = [ 4; -1 ];
tol = 1e-6;
maxiterations = 1000;

[ iterations1, X1, res1, value1 ] = plot( X, 0.1, tol, maxiterations );
[ iterations2, X2, res2, value2 ] = plot( X, 0.0001, tol, maxiterations );
[ iterations3, X3, res3, value3 ] = plot( X, 0, tol, maxiterations );
[ iterations4, X4, res4, value4 ] = plot( X, 'newton', tol, maxiterations );


%plot which shows how the residual decreases with the number of iteratives

semilogy( [1:iterations1], res1, 'r');
hold on;
semilogy( [1:iterations2], res2, 'g');
semilogy( [1:iterations3], res3, 'b');
semilogy( [1:iterations4], res4, 'y');
grid;
legend('Steepest method with alpha = 0.1','Steepest method with optimal alpha', 'Newton method');
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

%the plots can only be performend with n = 2
[ ~, H, ~ ] = data;
if size ( H, 2 ) != 2
	'Dimension has to be 2 for plotting'
	return
end

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

[iterations1, Xk1, Y1, Z1] = steepest(X, alph, tol, nbiterations);
alpha = optimalAlpha(X); 
[iterations2, Xk2, Y2, Z2] = steepest(X, alpha, tol, nbiterations);
[iterations3, Xk3, Y3, Z3] = newton(X, tol, nbiterations);


