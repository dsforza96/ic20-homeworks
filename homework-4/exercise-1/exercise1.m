clear all
close all
clc

n = 4;

M = (2 .^ n - 1) .* (2 .^ n) .* (2 .^ n + 1);
S = randi(M - 1);
X1 = randi(S);
X2 = S - X1;

[~, x1] = binary2RNS(X1, n);
[~, x2] = binary2RNS(X2, n);

nbits = [n, n, n + 1];
m = [2 .^ n - 1, 2 .^ n, 2 .^ n + 1];
S = zeros(1, 3);

for i=1:3
    A = radix102RB(x1(i), nbits(i));
    B = radix102RB(x2(i), nbits(i));

    s = RBSum(A, B);

    S(i) = mod(RB2radix10(s), m(i));
end
