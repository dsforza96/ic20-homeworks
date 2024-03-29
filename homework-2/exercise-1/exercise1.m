clear all
close all
clc

n = 100;
A = full(sprand(n, n, 0.2));
b = ones(n, 1);

% The movie of sparsity patterns is shown online during the computation
[x, sparsity] = gaussianElimination(A, b);

%% Showing results

figure
plot(0:n - 1, sparsity)

title 'Sparsity of matrix A|b'
xlabel 'Iteration'
ylabel 'Sparsity'
