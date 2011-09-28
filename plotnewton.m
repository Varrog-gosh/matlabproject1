function plotnewton( iterations, Xk)

[ ~, H, ~] = data;
dim = size(H, 2);

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


