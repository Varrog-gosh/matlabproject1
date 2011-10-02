function main ()
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
% * Inf, the Newton method is called
% * -2, the steepest decent method is called and right after that the Newton method
[ iterations1, X1, res1, value1, time1 ] = plotmethod ( X, 0.0001, tol, maxiterations );
[ iterations2, X2, res2, value2, time2 ] = plotmethod ( X, 0, tol, maxiterations );
[ iterations3, X3, res3, value3, time3 ] = plotmethod ( X, Inf, tol, maxiterations );
[ iterations4, X4, res4, value4, time4 ] = plotmethod ( X, -2, tol, maxiterations );

legends = { 'Steepest decent method with alpha = 0.0001', 'Steepest decent method with optimal alpha', 'Newton method', 'Steepest decent and Newton method' };
%plot which shows how the residual decreases with the number of iteratives
semilogy( iterations1, res1, 'r');
hold on;
semilogy( iterations2, res2, 'g');
semilogy( iterations3, res3, 'b');
semilogy( iterations4, res4, 'm');
grid;
legend(legends{1}, legends{2}, legends{3}, legends{4});
xlabel('number of iterations');
ylabel('relative residual');
hold off;

%plot which shows how the value of g decreases with the iterations
figure;
semilogy(iterations1, value1, 'r');
hold on;
semilogy(iterations2, value2, 'g');
semilogy(iterations3, value3, 'b');
semilogy(iterations4, value4, 'm');
grid;
legend(legends{1}, legends{2}, legends{3}, legends{4});
xlabel('number of iterations');
ylabel('g');
hold off;

%plot which shows the iterations on the surface of g
%the plots can only be performend with n = 2
[ ~, H, ~ ] = data;
if size ( H, 2 ) == 2
	figure; 
	drawfunction;
	hold on;
	drawcurve(X1,'r-o');
	drawcurve(X2,'g-o');
	drawcurve(X3,'k-+');
	drawcurve(X4,'m-h');
	grid;
	title('');
	legend('g', legends{1}, legends{2}, legends{3}, legends{4});
end
time1
time2
time3
time4
end
