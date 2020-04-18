clear all
close all
clc

eps = 0.001;

A = rand(100);
A = (A + A') ./ 2; % Forcing the matrix to be symmetric

[u1, lambda1] = epair(A, eps);

[u2, lambda2] = deflation(A, u1, lambda1, eps);

[v, l] = eigs(A, 2);
v = abs(v ./ max(abs(v)));
u2 = abs(u2 ./ max(abs(u2)));
