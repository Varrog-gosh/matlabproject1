function [ M ] = calcul(a, tol, it)

time = 0;
iterations = 1000;


for i=1:iterations
    tic;
    [~, residual1] = steepest_calcul(a, 0.00001, tol, it);
    time = time + toc;
end
time1 = time/iterations;

time = 0;
for i=1:iterations
    tic;
    [~, residual2] = steepest_calcul(a, alpha(a), tol, it);
    time = time + toc;
end
time2 = time/iterations;

time = 0;
for i=1:iterations
    tic;
    [~, residual3] = newton_calcul(a, tol, it);
    time = time + toc;
end
time3 = time/iterations;

time = 0;
for i=1:iterations
    tic;
    [~, residual4] = newton_steepest(a, tol, it);
    time = time + toc;
end
time4 = time/iterations;

M = [time1, time2, time3, time4;
    residual1, residual2, residual3, residual4];




end

