clear all
close all
clc

N = 100;
n = 10;

% Strictly non-blocking CLOS network
m = 2 * n - 1;
r = ceil(N / n);

C_sn = (2 * r .* ceil(m / n) + m * ceil(r / n)) * n ^ 2; 

% Rearrangeable CLOS network
m = n;

C_rn = (2 * r * ceil(m / n) + m * ceil(r / n)) * n ^ 2;

% Comparing costs to the equivalent crossbar network
C_cr = N ^ 2;

G_cr_sn = C_cr / C_sn;
G_cr_rn = C_cr / C_rn;
