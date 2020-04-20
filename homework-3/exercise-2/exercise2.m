clear all
close all
clc

% Importing functions from the previous exercise
if ~exist('exercise-1', 'dir')
    addpath('../exercise-1')
end

n = 10;
eps = 1e-6;

% Generating a random adjacency matrix
S = full(sprandsym(n, 0.25));
S = S - diag(diag(S));

A = logical(S);

%% Finding the most accessible town using the Gould index

B = A + eye(n);

x1 = epair(B, eps);

[~, maxgould] = max(x1);

%% Partitioning the graph according to the Fiedler eigenvector

L = diag(sum(A)) - A;

x1 = epair(L, eps, 'inverse');
x2 = deflation(L, x1, 0, eps, 'inverse');

posneg_split = x2 < 0;
mean_split = x2 < mean(x2);
median_split = x2 < median(x2);

%% Showing results

G = graph(A);

blue = zeros(n, 3);
blue(:, 3) = 1;

subplot(2, 2, 1);

cmap = blue;
cmap(maxgould, :) = [1 0 0];

plot(G, 'NodeColor', cmap, 'MarkerSize', 7);
title Gould

partitions = [posneg_split, mean_split, median_split];
titles = {'Pos-neg', 'Mean', 'Median'};

for i=1:3
    subplot(2, 2, i + 1);

    cmap = blue;
    cmap(partitions(:, i), 1) = 1;
    cmap(partitions(:, i), 3) = 0;

    plot(G, 'NodeColor', cmap, 'MarkerSize', 7);
    title(titles(i))
end

% subplot(2, 2, 1);
% cmap = blue;
% cmap(maxgould, :) = [1 0 0];
% plot(G, 'NodeColor', cmap, 'MarkerSize', 10);
% title Gould
% 
% subplot(2, 2, 2);
% cmap = blue;
% cmap(posneg_split, 1) = 1;
% cmap(posneg_split, 3) = 0;
% plot(G, 'NodeColor', cmap, 'MarkerSize', 10);
% title Pos-neg
% 
% subplot(2, 2, 3);
% cmap = blue;
% cmap(mean_split, 1) = 1;
% cmap(mean_split, 3) = 0;
% plot(G, 'NodeColor', cmap, 'MarkerSize', 10);
% title Mean
% 
% subplot(2, 2, 4);
% cmap = blue;
% cmap(median_split, 1) = 1;
% cmap(median_split, 3) = 0;
% plot(G, 'NodeColor', cmap, 'MarkerSize', 10);
% title Median
