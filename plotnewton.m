function plotnewton( iterations, Xk, Y, Z )

[ ~, H, ~] = data;
dim = size(H, 2);

%plot which shows how the residual decreases with the number of iteratives

grid;
plot(iterations, Y);
xlabel('Iterations');
ylabel('Relative residual');

%plot which shows how G decreases with the iterations

figure;
hold off;
plot(iterations, Z);
xlabel('Iterations');
ylabel('g');
grid;

%plot which shows the iterations on the surface of G
if dim == 2
    figure;
    hold off;
    plotfunction;
    hold on;
    G = zeros(1:1:size(iterations));
    for i=size(iterations);
        G(i) = problem([Xk(1,i); Xk(2,i)]);
    end
    plot3(Xk(1,:), Xk(2,:), G, 'r-*');
end

end


