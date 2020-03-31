clear all
close all
clc

n = 700;
A = generateDiagonallyDominant(n, 0.2);
b = ones(n, 1);

A_comp = toCompact(A);
tic
x = jacobi_vectorized(A_comp, b);
toc; tic
y = jacobi(A_comp, b);
toc; tic
z = gaussSeide_bis(A_comp, b);
toc; tic
z = gaussSeide(A_comp, b);
toc