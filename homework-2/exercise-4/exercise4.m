clear all
close all
% clc

n = 1000;
b = ones(n, 1);

S = sprand(n, n, 0.2);
S = S - diag(diag(S));

S = S + diag(sum(S, 2)) + diag(rand(n, 1));

A_comp = toCompact(S);

pool = parpool(4);

ticBytes(pool);
tic;

parallelJacobi(A_comp, b);

toc;
tocBytes(pool);
tic
jacobi(A_comp, b);
toc

delete(pool)