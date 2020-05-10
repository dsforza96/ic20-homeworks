% clear all
close all
clc

T_ha = 2;  % time(HA) = 2 * T_gate
A_ha = 3;  % area(HA) = 3 * A_gate
T_fa = 4;  % time(FA) = 4 * T_gate
A_fa = 7;  % area(FA) = 7 * A_gate

N = [3, 4, 5, 6, 7];
k = 100;

T_speedups = zeros(3, length(N));
A_speedups = zeros(3, length(N));

for i=1:length(N)
    n = N(i);
 
    M = (2 .^ n - 1) * (2 .^ n) * (2 .^ n + 1);

    % Standard addition using a ripple-carry adder
    nbits = floor(log2(M - 1)) + 1;

    T_rca = k * nbits * T_fa;
    A_rca = nbits * T_fa;

    % Pipelined addition using an array adder
    T_array = (nbits + k - 1) * T_ha;
    A_array = nbits * (nbits + 1) / 2 * A_ha;

    T_speedups(1, i) = T_rca / T_array;
    A_speedups(1, i) = A_rca / A_array;

    % Addition in RNS using ripple-carry adders
    nbits = [n, n + 1, n + 1];

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

figure
subplot(1, 2, 1)
plot(N, T_speedups)
axis square

title 'Time speedup'
xlabel 'n'
ylabel 'Speedup'
legend('Pipelined array adder', 'RNS with ripple-carry adders', 'RNS applying the RB table')

subplot(1, 2, 2)
plot(N, A_speedups)
axis square

title 'Area speedup'
xlabel 'n'
ylabel 'Speedup'
legend('Pipelined array adder', 'RNS with ripple-carry adders', 'RNS applying the RB table')

%%

n = 6;
K = [100, 500, 1000, 1500, 2000];

T_speedups = zeros(3, length(K));
A_speedups = zeros(3, length(K));

M = (2 .^ n - 1) * (2 .^ n) * (2 .^ n + 1);

for i=1:length(K)
    k = K(i);

    % Standard addition using a ripple-carry adder
    nbits = floor(log2(M - 1)) + 1;

    T_rca = k * nbits * T_fa;
    A_rca = nbits * T_fa;

    % Pipelined addition using an array adder
    T_array = (nbits + k - 1) * T_ha;
    A_array = nbits * (nbits + 1) / 2 * A_ha;

    T_speedups(1, i) = T_rca / T_array;
    A_speedups(1, i) = A_rca / A_array;

    % Addition in RNS using ripple-carry adders
    nbits = [n, n + 1, n + 1];

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

figure
subplot(1, 2, 1)
plot(K, T_speedups)
axis square

title 'Time speedup'
xlabel 'k'
ylabel 'Speedup'
legend('Pipelined array adder', 'RNS with ripple-carry adders', 'RNS applying the RB table')

subplot(1, 2, 2)
plot(K, A_speedups)
axis square

title 'Area speedup'
xlabel 'k'
ylabel 'Speedup'
legend('Pipelined array adder', 'RNS with ripple-carry adders', 'RNS applying the RB table')
