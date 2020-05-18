clear all
close all
clc

N = 100;
n = 10;

% Strictly non-blocking CLOS network
m = 2 .* n - 1;
r = ceil(N ./ n);

% Rearrangeable CLOS network
m = n;

% Comparing costs to the equivalent crossbar network
