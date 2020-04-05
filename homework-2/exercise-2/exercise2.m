clear all
close all
clc

sizes = [50, 100, 150, 200, 250];
m = 20;  % Number of matrices on which to average results

etimes = zeros(3, length(sizes));

for i=1:length(sizes)
    n = sizes(i);
    b = ones(n, 1);

    for j=1:m
        A = rand(n);
        
        % Printing the condition number for the linear system
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

title 'Averaged execution time'
xlabel 'Dimension (# rows)'
ylabel 'Time (ms)'
legend('Naive', 'Partial', 'Complete')

