clear all
close all
clc

T_ha = 2;  % time(HA) = 2 * T_gate
A_ha = 3;  % area(HA) = 3 * A_gate
T_fa = 4;  % time(FA) = 4 * T_gate
A_fa = 7;  % area(FA) = 7 * A_gate


M = (2 .^ n - 1) .* (2 .^ n) .* (2 .^ n + 1);

% Standard addition using a ripple-carry adder
nbits = floor(log2(M - 1)) + 1;

T_rca = k * nbits * T_fa;
A_rca = nbits * T_fa;

% Pipelined addition using an array adder
T_array = (nbits + k - 1) * T_ha;
A_array = nbits * (nbits + 1) / 2 * A_ha;

% Addition in RNS using ripple-carry adders
nbits = [n, n, n +1];

T_rns = k * max(nbits) * T_fa;
A_rns = sum(nbits) * A_fa;

% Addition in RNS using the RB representation
T_rns_rb = k * 2 * T_fa;
A_rns_rb = sum(nbits) * 2 * A_fa;

