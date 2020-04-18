clear all
close all
clc

A = rand(10);

[u, lambda] = epair(A, 0.001);

[v, l] = eigs(A, 1, 'largestabs');
v = abs(v ./ max(abs(v)));

