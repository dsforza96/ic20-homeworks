clear all
close all
clc

% Importing functions from the previous exercise
if ~exist('exercise-1', 'dir')
    addpath('../exercise-1')
end

n = 10;
eps = 1e-6;

S = full(sprand(n, n, 0.2));
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

posneg_split = x2 < 0;
mean_split = x2 < mean(x2);
median_split = x2 < median(x2);

%% Showing results

G = graph(A);

blue = zeros(n, 3);
blue(:, 3) = 1;

red_ind = [(1:n)' == maxgould, posneg_split, mean_split, median_split];
titles = {'Gould', 'Pos-neg', 'Mean', 'Median'};

for i=1:4
    subplot(2, 2, i);

    cmap = blue;
    cmap(red_ind(:, i), 1) = 1;
    cmap(red_ind(:, i), 3) = 0;

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
