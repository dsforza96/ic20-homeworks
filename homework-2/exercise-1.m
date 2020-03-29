clear all
close all
clc

n = 100;

A = sprand(n, n, 0.2);
A = min(A + diag(ones(n, 1) .* 0.001), 1);
A = full(A);

b = rand(n, 1);

%%

[x, sparsity] = gaussianElimination(A, b);

% y = A \ b;
% max(abs(x - y))

%%

figure
plot(0:n - 1, sparsity)

xlabel 'Iteration'
ylabel 'Sparsity'
