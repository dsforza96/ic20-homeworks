clear all
close all
clc

% Importing functions from the previous exercise
if ~exist('exercise-1', 'dir')
    addpath('../exercise-1')
end

n = 10;
eps = 1e-4;

S = sprand(n, n, 0.2);
S = S - diag(diag(S));
A = logical(S + S');

%%

B = A + eye(n);

x1 = epair(B, eps);

[~, maxgould] = max(x1);

%%

L = diag(sum(A)) - A;

L_inv = inv(L);
x1 = epair(L_inv, eps);
x2 = deflation(L_inv, x1, 0, eps);

posneg_split = find(x2 < 0);
mean_split = find(x2 < mean(x2));
median_split = find(x2 < median(x2));

%%

G = graph(A);

blue = zeros(n, 3);
blue(:, 3) = 1;

subplot(2, 2, 1);
cmap = blue;
cmap(maxgould, :) = [1 0 0];
plot(G, 'NodeColor', cmap, 'MarkerSize', 10);
title Gould

subplot(2, 2, 2);
cmap = blue;
cmap(posneg_split, 1) = 1;
cmap(posneg_split, 3) = 0;
plot(G, 'NodeColor', cmap, 'MarkerSize', 10);
title Pos-neg

subplot(2, 2, 3);
cmap = blue;
cmap(mean_split, 1) = 1;
cmap(mean_split, 3) = 0;
plot(G, 'NodeColor', cmap, 'MarkerSize', 10);
title Mean

subplot(2, 2, 4);
cmap = blue;
cmap(median_split, 1) = 1;
cmap(median_split, 3) = 0;
plot(G, 'NodeColor', cmap, 'MarkerSize', 10);
title Median
