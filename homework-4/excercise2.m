clear all
close all
clc

T_ha = 2;  % time of HA = 2 * T_gate
A_ha = 3;  % area of HA = 3 * A_gate
T_fa = 4;  % time of FA = 4 * T_gate
A_fa = 7;  % area of FA = 7 * A_gate

%% Speedups varying the exponent of RNS moduli

exps = [3, 4, 5, 6, 7, 8];
k = 1000;  % Number of operations

T_speedups = zeros(3, length(exps));
A_speedups = zeros(3, length(exps));

for i=1:length(exps)
    n = exps(i);
 
    M = (2 .^ n - 1) * (2 .^ n) * (2 .^ n + 1);

    % Standard addition using a ripple-carry adder
    nbits = floor(log2(M - 1)) + 1;

    T_rca = k * nbits * T_fa;
    A_rca = nbits * A_fa;

    % Pipelined addition using an array adder
    T_array = (nbits + k - 1) * T_ha;
    A_array = nbits * (nbits + 1) / 2 * A_ha;

    T_speedups(1, i) = T_rca / T_array;
    A_speedups(1, i) = A_rca / A_array;

    % Addition in RNS using ripple-carry adders
    nbits = [n, n, n + 1];

    T_rns = k * max(nbits) * T_fa;
    A_rns = sum(nbits) * A_fa;

    T_speedups(2, i) = T_rca / T_rns;
    A_speedups(2, i) = A_rca / A_rns;

    % Addition in RNS using the RB representation
    T_rns_rb = k * 2 * T_fa;
    A_rns_rb = sum(nbits) * 2 * A_fa;

    T_speedups(3, i) = T_rca / T_rns_rb;
    A_speedups(3, i) = A_rca / A_rns_rb;
end

% Showing results
figure
subplot(1, 2, 1)
plot(exps, T_speedups)
axis square

title 'Time speedup'
xlabel 'Exponent of RNS moduli'
ylabel 'Speedup'
legend('Pipelined array adder', 'RNS with ripple-carry adders', 'RNS exploiting the RB table')

subplot(1, 2, 2)
plot(exps, A_speedups)
axis square

title 'Area speedup'
xlabel 'Exponent of RNS moduli'
ylabel 'Speedup'
legend('Pipelined array adder', 'RNS with ripple-carry adders', 'RNS exploiting the RB table')

%% Speedups varying the number of operations

n = 4;  % Exponent of RNS moduli
nops = [50, 100, 500, 1000, 1500, 2000];

T_speedups = zeros(3, length(nops));
A_speedups = zeros(3, length(nops));

M = (2 .^ n - 1) * (2 .^ n) * (2 .^ n + 1);

for i=1:length(nops)
    k = nops(i);

    % Standard addition using a ripple-carry adder
    nbits = floor(log2(M - 1)) + 1;

    T_rca = k * nbits * T_fa;
    A_rca = nbits * A_fa;

    % Pipelined addition using an array adder
    T_array = (nbits + k - 1) * T_ha;
    A_array = nbits * (nbits + 1) / 2 * A_ha;

    T_speedups(1, i) = T_rca / T_array;
    A_speedups(1, i) = A_rca / A_array;

    % Addition in RNS using ripple-carry adders
    nbits = [n, n, n + 1];

    T_rns = k * max(nbits) * T_fa;
    A_rns = sum(nbits) * A_fa;

    T_speedups(2, i) = T_rca / T_rns;
    A_speedups(2, i) = A_rca / A_rns;

    % Addition in RNS using the RB representation
    T_rns_rb = k * 2 * T_fa;
    A_rns_rb = sum(nbits) * 2 * A_fa;

    T_speedups(3, i) = T_rca / T_rns_rb;
    A_speedups(3, i) = A_rca / A_rns_rb;
end

% Showing results
figure
subplot(1, 2, 1)
plot(nops, T_speedups)
axis square

title 'Time speedup'
xlabel 'Number of operations'
ylabel 'Speedup'
legend('Pipelined array adder', 'RNS with ripple-carry adders', 'RNS with RB representation')

subplot(1, 2, 2)
plot(nops, A_speedups)
axis square

title 'Area speedup'
xlabel 'Number of operations'
ylabel 'Speedup'
legend('Pipelined array adder', 'RNS with ripple-carry adders', 'RNS with RB representation')
