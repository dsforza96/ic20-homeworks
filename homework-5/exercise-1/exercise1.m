clear all
close all
clc

n = 4;

p = randperm(2 .^ n);

% Example of routable permutation
% p = [4 9 2 10 11 7 15 8 14 5 13 6 16 1 12 3];

% Example permutation which generates conflicts on stage #3
% p = [7 13 2 12 15 4 9 3 10 1 14 5 11 8 16 6];

[P, S, confstage] = selfRoutingButterfly(p);

if isfinite(confstage)
    fprintf("One or more conflicts occurred while traversing stage #%d\n", confstage)
end

Permutations = P  % Printing P

G = drawButterfly(n);

% Highlighting switch configuration
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
