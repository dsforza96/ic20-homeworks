clear all
close all
clc

n = 100;
A = rand(n);
b = rand(n, 1);

x = gaussianEliminationWithPivoting(A, b, @completePivoting);

% y = A \ b;
% mean(abs(x - y))
