clear all
close all
clc

n = 100;
A = full(sprand(n, n, 0.2));
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
