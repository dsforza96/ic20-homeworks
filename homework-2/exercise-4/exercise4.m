clear all
close all
clc

% Importing functions from the previous exercise
if ~exist('exercise-3', 'dir')
    addpath('../exercise-3')
end

sizes = [50, 100, 150, 200, 250];
m = 5;  % Number of matrices on which to average results

eps = 0.01;
etimes = zeros(4, length(sizes));

% Initializing the parallel pool once and for all
tic
cluster = parcluster();
pool = parpool(cluster.NumWorkers);
overhead = toc;

for i=1:length(sizes)
    n = sizes(i);
    b = ones(n, 1);

    for j=1:m
        A = generateDiagonallyDominant(n, 0.2);
        A_comp = toCompact(A);

        tic
        time = cputime;
        jacobi(A_comp, b, eps);
        etimes(1, i) = etimes(1, i) + toc;
        etimes(2, i) = etimes(2, i) + cputime - time;

        tic
        time = cputime;
        parallelJacobi(A_comp, b, eps);
        etimes(3, i) = etimes(3, i) + toc;
        etimes(4, i) = etimes(4, i) + cputime - time;
    end
end

etimes = etimes ./ m;
delete(pool);

%% Showing results

fprintf("Overhead introduced by parallelization: %f sec\n", overhead)

figure
subplot(1, 2, 1)
plot(sizes, etimes([1 2], :) .* 1000)  % Converting to milliseconds
axis square

title 'Averaged serial time'
xlabel 'Dimension (# rows)'
ylabel 'Time (ms)'
legend('Elapsed Time', 'CPU Time')

subplot(1, 2, 2)
plot(sizes, etimes([3 4], :))
axis square

title 'Averaged parallel time'
xlabel 'Dimension (# rows)'
ylabel 'Time (sec)'
legend('Elapsed Time', 'CPU Time')
