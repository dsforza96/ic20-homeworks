clear all
close all
clc

n = 10;
eps = 1e-6;

% Generating a random adjacency matrix
S = full(sprandsym(n, 0.25));
S = S - diag(diag(S));

A = logical(S);

% Making the graph connected
[components, sizes] = conncomp(graph(A));

while length(sizes) > 1
    a = find(components == 1);
    b = find(components == 2);

    v = a(randi(sizes(1)));
    w = b(randi(sizes(2)));

    A(v, w) = 1;
    A(w, v) = 1;

    [components, sizes] = conncomp(graph(A));
end

%% Finding the most accessible town using the Gould index

B = A + eye(n);

x1 = epair(B, eps);

[~, maxgould] = max(x1);

%% Partitioning the graph according to the Fiedler eigenvector

L = diag(sum(A)) - A;

x1 = ones(n, 1);  % Eigenvector (a multiple) associated to lambda1 = 0
x2 = deflation(L, x1, 0, eps, 'inverse');

posneg_split = find(x2 < 0);
mean_split = find(x2 < mean(x2));
median_split = find(x2 < median(x2));

%% Showing results

G = graph(A);

% Colormap to initialize the color of all nodes to blue
blue = zeros(n, 3);
blue(:, 3) = 1;

figure
subplot(2, 2, 1);

cmap = blue;
cmap(maxgould, :) = [1 0 0];

plot(G, 'NodeColor', cmap, 'MarkerSize', 7);
title 'Most accessible town'

partitions = {posneg_split, mean_split, median_split};
titles = {'Positive-negative', 'Mean value', 'Median value'};

for i=1:3
    subplot(2, 2, i + 1);

    cmap = blue;
    cmap(partitions{i}, 1) = 1;
    cmap(partitions{i}, 3) = 0;

    plot(G, 'NodeColor', cmap, 'MarkerSize', 7);
    title([titles(i) ' bi-partitioning'])
end
