clear all
close all
clc

n = 1000;
A = generateDiagonallyDominant(n, 0.2);
b = ones(n, 1);

A_comp = toCompact(A);
ground_truth = A\b;
tic
x = jacobi(A_comp, b);
toc; tic
y = jacobi_vectorized(A_comp, b);
toc; tic
z = gaussSeidel_old(A_comp, b);
toc; tic
z1 = gaussSeidel(A_comp, b);
toc; tic
z2 = gaussSeidel_bis(A_comp, b);
toc