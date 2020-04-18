clear all
close all
clc

eps = 0.01;

A = rand(100);

[u1, lambda1] = epair(A, eps);

[u2, lambda2] = deflation(A, u1, lambda1, eps);

[v, l] = eigs(A, 2, 'largestabs');
v = abs(v ./ max(abs(v)));
