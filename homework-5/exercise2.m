clear all
close all
clc

N = 100;
n = 10;

% Strictly non-blocking CLOS network
m = 2 * n - 1;
r = ceil(N / n);

fprintf("Strictly non-blocking CLOS network:\n")
fprintf("  First stage:   %d modules of size %d x %d\n", r, n, m)
fprintf("  Second stage:  %d modules of size %d x %d\n", m, r, r)
fprintf("  Third stage:   %d modules of size %d x %d\n", r, m, n)

C_sn = (2 * r .* ceil(m / n) + m * ceil(r / n)) * n ^ 2; 

% Rearrangeable CLOS network
m = n;

fprintf("\nRearrangeable CLOS network:\n")
fprintf("  First stage:   %d modules of size %d x %d\n", r, n, m)
fprintf("  Second stage:  %d modules of size %d x %d\n", m, r, r)
fprintf("  Third stage:   %d modules of size %d x %d\n", r, m, n)

C_rn = (2 * r * ceil(m / n) + m * ceil(r / n)) * n ^ 2;

% Comparing costs to the equivalent crossbar network
C_cr = N ^ 2;

G_cr_sn = C_cr / C_sn;
G_cr_rn = C_cr / C_rn;

fprintf("\nGain w.r.t. the %d x %d crossbar:\n", N, N)
fprintf("  Strictly non-blocking CLOS:  %g\n", G_cr_sn)
fprintf("  Rearrangeable CLOS:          %g\n", G_cr_rn)
