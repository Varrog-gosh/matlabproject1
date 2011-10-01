function plotAll ()
%PLOTALL Plots the relative residuals and the values of the function g versus the iterations.
% If the dimension is 2, a 3dimensional plot is generated
% INPUT
% OUTPUT

% set values
X = [ 4; -1 ];
tol = 1e-6;
maxiterations = 1000;

% here is a ugly implementation: if the second argument is 
% * a positive number, the number is used as step size for the steepest decent method
% * 0, the steepest decent method with an optimal alpha is called
% * -1, the Newton method is called
% * -2, the steepest decent method is called and right after that the Newton method
[ iterations1, X1, res1, value1, time1 ] = plot( X, 0.001, tol, maxiterations );
[ iterations2, X2, res2, value2, time2 ] = plot( X, 0, tol, maxiterations );
[ iterations3, X3, res3, value3, time3 ] = plot( X, -1, tol, maxiterations );
[ iterations4, X4, res4, value4, time4 ] = plot( X, -2, tol, maxiterations );


%plot which shows how the residual decreases with the number of iteratives
semilogy( iterations1, res1, 'r');
hold on;
semilogy( iterations2, res2, 'g');
semilogy( iterations3, res3, 'b');
semilogy( iterations4, res4, 'y');
grid;
legend('Steepest decent method with alpha = 0.001','Steepest decent method with optimal alpha', 'Newton method','Steepest decent and Newton method');
xlabel('number of iterations');
ylabel('relative residual');

%plot which shows how G decreases with the iterations
figure;
hold on;
semilogy(iterations1, value1, 'r');
semilogy(iterations2, value2, 'g');
semilogy(iterations3, value3, 'b');
semilogy(iterations4, value4, 'y');
legend('Steepest method with arbitrary alpha','Steepest method with optimal alpha', 'Newton method','Steepest decent and Newton method');
xlabel('number of iterations');
ylabel('g');
grid;

%the plots can only be performend with n = 2
%plot which shows the iterations on the surface of G
[ ~, H, ~ ] = data;
if size ( H, 2 ) == 2
    figure; % plot stepest method with constant alpha.
    hold off;
    plotfunction;
    hold on;

    G = zeros(1:1:size(iterations1));
    for i=size(iterations1);
        G(i) = problem([Xk1(1,i); Xk1(2,i)]);
    end
    plot3(Xk1(1,:), Xk1(2,:), G, 'r-o');
    
    G = zeros(1:1:size(iterations2));
    for i=size(iterations2);
        G(i) = problem([Xk2(1,i); Xk2(2,i)]);
    end
    plot3(Xk2(1,:), Xk2(2,:), G, 'g-o');

    G = zeros(1:1:size(iterations3)); 
    for i=size(iterations3);
        G(i) = problem([Xk3(1,i); Xk3(2,i)]);
    end
    plot3(Xk3(1,:), Xk3(2,:), G, 'k-+');

   G = zeros(1:1:size(iterations3));
    for i=size(iterations3);
        G(i) = problem([Xk3(1,i); Xk3(2,i)]);
    end
    plot3(Xk3(1,:), Xk3(2,:), G, 'y-o');

    grid;
    title('');
    legend('g', 'Steepest method with arbitrary alpha','Steepest method with optimal alpha', 'Newton method','Steepest decent and Newton method');
end
end
