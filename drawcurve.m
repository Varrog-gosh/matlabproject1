function drawcurve (X, opt)
%DRAWCURVE Draws the points in X in a 3D plot.
% INPUT
%  X	array containing the two dimensional points
%  opt	draw options
% OUTPUT

g = zeros ( 1, size( X, 2 ) );
for i = 1:size ( X, 2 );
	g (i) = problem ( [ X(1,i); X(2,i) ] );
end
plot3 ( X(1,:), X(2,:), g,opt)
end
