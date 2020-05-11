clear all
close all
clc

n = 4;

% Generating two random numbers such that their sum is representable
M = (2 .^ n - 1) .* (2 .^ n) .* (2 .^ n + 1);

S = randi(M - 1);

X1 = randi(S);
X2 = S - X1;

fprintf("Generating two random numbers...\n")
fprintf("  X1 = %d\n", X1)
fprintf("  X2 = %d\n", X2)

% Converting the two numbers in RNS representation
[~, x1] = binary2RNS(X1, n);
[~, x2] = binary2RNS(X2, n);

fprintf("\nConverting them to RNS...\n")
fprintf("  X1 = <%d, %d, %d>\n", x1)
fprintf("  X2 = <%d, %d, %d>\n", x2)

% Computing the sum of each digit in RB representation
nbits = [n, n, n + 1];
m = [2 .^ n - 1, 2 .^ n, 2 .^ n + 1];
S = zeros(1, 3);

for i=1:3
    A = radix102RB(x1(i), nbits(i) + 1);
    B = radix102RB(x2(i), nbits(i) + 1);
    
    fprintf("\nSumming digit #%d in RB...\n", i)

    s = RBSum(A, B);

    S(i) = mod(RB2radix10(s), m(i));
end

% Showing the resulting sum
fprintf("\nThe sum X1 + X2 in RNS is equal to:\n")
fprintf("  S = <%d, %d, %d>\n", S)