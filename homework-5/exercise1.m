clear all
close all
clc

p = [7     0     1     5     3     4     2     6] + 1;
p = randperm(8);

[P, S, confstage] = selfRoutingButterfly(p);

G = drawButterfly(3);

highlight(G, find(S == 0), 'NodeColor', 'b');
highlight(G, find(S == 1), 'NodeColor', 'g');
highlight(G, find(S == 2), 'NodeColor', [0.5 0.5 0.5]);
highlight(G, find(S == 3), 'NodeColor', 'r');
