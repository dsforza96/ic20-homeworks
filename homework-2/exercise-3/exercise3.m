clear all
close all
clc

sizes = [50, 100, 150, 200, 250];
m = 20;  % Number of matrices on which to average results

iters = zeros(4, length(sizes));

for i=1:length(sizes)
    n = sizes(i);
    b = ones(n, 1);

    for j=1:m
        A = generateDiagonallyDominant(n, 0.2);
        A_comp = toCompact(A);
        ground_truth = A \ b;

        [~, k] = jacobi_bis(A_comp, b, ground_truth);
        iters(1, i) = iters(1, i) + k;
        
        [~, k] = jacobi_bis(A_comp, b);
        iters(2, i) = iters(2, i) + k;
        
        [~, k] = gaussSeidel(A_comp, b, ground_truth);
        iters(3, i) = iters(3, i) + k;
        
        [~, k] = gaussSeidel(A_comp, b);
        iters(4, i) = iters(4, i) + k;
    end
end

iters = iters ./ m;

%%

figure
subplot(1, 2, 1)
plot(sizes, iters([1 2], :))
axis square

title 'Jacobi Method'
xlabel 'Dimension (# rows)'
ylabel 'Number of interation'
legend('E1', 'E2')

subplot(1, 2, 2)
plot(sizes, iters([3 4], :))
axis square

title 'Gauss-Siedel Method'
xlabel 'Dimension (# rows)'
ylabel 'Number of interation'
legend('E1', 'E2')
