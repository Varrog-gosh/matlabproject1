function plotmethod( iterations, X, Y, Z )

%plot which shows how the residual decreases with the number of iteratives

xlabel('Iterations');
ylabel('Relative residual');
grid;
plot(iterations, Y);

%plot which shows how G decreases with the iterations

figure;
hold off;
semilogy(iterations, Z);
xlabel('Iterations');
ylabel('g');
grid;

%plot which shows the iterations on the surface of G

figure;
hold off;
plotfunction;
hold on;
plot3(Xk(1,:), Xk(2,:), problem(Xk));

end

