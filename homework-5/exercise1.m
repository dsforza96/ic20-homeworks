clear all
close all
clc

p = [8 1 2 6 4 5 3 7];
% p = randperm(8);

[P, S, confstage] = selfRoutingButterfly(p);

G = drawButterfly(3);

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
