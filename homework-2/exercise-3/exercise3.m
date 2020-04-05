clear all
close all
clc

sizes = [50, 100, 150, 200, 250];
m = 20;  % Number of matrices on which to average results

eps = 0.01;
iters = zeros(4, length(sizes));

for i=1:length(sizes)
    n = sizes(i);
    b = ones(n, 1);

    for j=1:m
        A = generateDiagonallyDominant(n, 0.2);
        A_comp = toCompact(A);
        ground_truth = A \ b;

        [~, k] = jacobi(A_comp, b, eps, ground_truth);
        iters(1, i) = iters(1, i) + k;
        
        [~, k] = jacobi(A_comp, b, eps);
        iters(2, i) = iters(2, i) + k;
        
        [~, k] = gaussSeidel(A_comp, b, eps, ground_truth);
        iters(3, i) = iters(3, i) + k;
        
        [~, k] = gaussSeidel(A_comp, b, eps);
        iters(4, i) = iters(4, i) + k;
    end
end

iters = iters ./ m;

%% Showing results

figure
subplot(1, 2, 1)
plot(sizes, iters([1 2], :))
axis square

title 'Averaged number of iteration for the Jacobi method'
xlabel 'Dimension (# rows)'
ylabel 'Number of interation'
legend('E1 = ║x - x^k║', 'E2 = ║x^k - x^{k-1}║')

subplot(1, 2, 2)
plot(sizes, iters([3 4], :))
axis square

title 'Averaged number of iteration for the Gauss-Siedel method'
xlabel 'Dimension (# rows)'
ylabel 'Number of interation'
legend('E1 = ║x - x^k║', 'E2 = ║x^k - x^{k-1}║')
