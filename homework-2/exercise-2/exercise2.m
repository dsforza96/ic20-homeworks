clear all
close all
clc

sizes = [50, 100, 150, 200, 250];
m = 20;  % Number of matrices on which to average results

b = ones(n, 1);
etimes = zeros(3, length(sizes));

for i=1:length(sizes)
    for j=1:m
        n = sizes(i);
        A = rand(n);

        cond = norm(inv(A)) .* norm(A);
        fprintf('cond(A) = %g\n', cond)

        tic
        gaussianEliminationWithPivoting(A, b, @naivePivoting);
        etimes(1, i) = etimes(1, i) + toc;

        tic
        gaussianEliminationWithPivoting(A, b, @partialPivoting);
        etimes(2, i) = etimes(2, i) + toc;

        tic
        gaussianEliminationWithPivoting(A, b, @completePivoting);
        etimes(3, i) = etimes(3, i) + toc;
    end
end

etimes = etimes ./ m;

%%

figure
plot(sizes, etimes .* 1000)  % Converting to milliseconds

xlabel 'Dimension (# rows)'
ylabel 'Time (ms)'
legend('Naive', 'Partial', 'Complete')

