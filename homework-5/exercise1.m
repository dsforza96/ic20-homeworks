clear all
close all
clc

n = 4;

p = randperm(2 .^ n);

% Example permutation taken from the lecture given on 11 May 2020
% n = 3;
% p = [8 1 2 6 4 5 3 7];

G = drawButterfly(n);

[P, S, confstage] = selfRoutingButterfly(p);

% Highlighting switches configuration
highlight(G, find(S == 0), 'NodeColor', 'b');
highlight(G, find(S == 1), 'NodeColor', 'g');
highlight(G, find(S == 2), 'NodeColor', [0.5 0.5 0.5]);
highlight(G, find(S == 3), 'NodeColor', 'r');

% Hacking the legend
hold on
h = zeros(4, 1);

h(1) = scatter(nan, nan, 'filled', 's', 'b');
h(2) = scatter(nan, nan, 'filled', 's', 'g');
h(3) = scatter(nan, nan, 'filled', 's', 'MarkerFaceColor', [0.5 0.5 0.5]);
h(4) = scatter(nan, nan, 'filled', 's', 'r');

legend(h, 'Straight', 'Cross', 'Not traversed', 'Conflict');
