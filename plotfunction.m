function plotfunction
%PLOTFUNCTION plots the function in the Intervall -10 < x < 10 and -10 < y < 10
%with a step size of 0.1.

x = 0 : 0.1 : 6;
y = -6 : 0.1 : 0;

Z = zeros( size(x, 2), size(y, 2) );
for i = 1 : size( x, 2 )
    for j = 1 : size( y, 2 )
        Z( i, j ) = problem ( [ x(i) ; y(j) ] );
    end
end

surf( x, y, Z )
shading('interp');
alpha(0.6);
xlabel( 'x_1' );
ylabel( 'x_2' );
zlabel( 'g(x_1, x_2)' );
end
