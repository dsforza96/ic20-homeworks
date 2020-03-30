clear all
close all
clc

n = 100;
A = full(sprand(n, n, 0.2));
b = rand(n, 1);

x = gaussianEliminationWithPivoting(A, b, @naivePivoting);

y = A \ b;
mean(abs(x - y))
