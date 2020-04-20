clear all
close all
clc

sizes = [25, 50, 75, 100, 125, 150, 175, 200];
m = 20;  % Number of matrices on which to average results

eps = 1e-6;
errors = zeros(2, length(sizes));
minerrs = repelem(inf, 2, length(sizes));
maxerrs = repelem(-inf, 2, length(sizes));

for i=1:length(sizes)
    n = sizes(i);

    for j=1:m
        A = rand(n);
        A = (A + A') ./ 2;  % Forcing the matrix to be symmetric
        ground_truth = abs(eigs(A, 2));

        [x1, lambda1] = epair(A, eps);

        err = abs(ground_truth(1) - lambda1);
        errors(1, i) = errors(1, i) + err;
        minerrs(1, i) = min(minerrs(1, i), err);
        maxerrs(1, i) = max(maxerrs(1, i), err);

        [~, lambda2] = deflation(A, x1, lambda1, eps);

        err = abs(ground_truth(2) - lambda2);
        errors(2, i) = errors(2, i) + err;
        minerrs(2, i) = min(minerrs(2, i), err);
        maxerrs(2, i) = max(maxerrs(2, i), err);
    end
end

errors = errors ./ m;
minerrs = errors - minerrs;
maxerrs = maxerrs - errors;

%% Showing results

figure
subplot(1, 2, 1)
errorbar(sizes, errors(1, :), minerrs(1, :), maxerrs(1, :));
axis square

title 'Error on dominant eigenvalue'
xlabel 'Dimension (# rows)'
ylabel 'Error (|\lambda_{MATLAB} - \lambda|)'

subplot(1, 2, 2)
errorbar(sizes, errors(2, :), minerrs(2, :), maxerrs(2, :));
axis square

title 'Error on second largest eigenvalue'
xlabel 'Dimension (# rows)'
ylabel 'Error (|\lambda_{MATLAB} - \lambda|'
