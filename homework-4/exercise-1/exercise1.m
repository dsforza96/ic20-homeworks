clear all
close all
clc

n = 4;

% Generating two random numbers such that their sum is representable
m = [2 .^ n - 1, 2 .^ n, 2 .^ n + 1];
M = prod(m);

fprintf("Generating two random numbers in the range [0, %d]...\n", M - 1)

S = randi(M - 1);

X1 = randi(S);
X2 = S - X1;

fprintf("  X1 = %d\n", X1)
fprintf("  X2 = %d\n", X2)

% Converting the two numbers to RNS
fprintf("\nConverting them to the RNS with module set <%d, %d, %d>...\n", m)

x1 = binaryToRNS(X1, n);
x2 = binaryToRNS(X2, n);

fprintf("  X1 = <%d, %d, %d>\n", x1)
fprintf("  X2 = <%d, %d, %d>\n", x2)

% Computing the sum of each digit in RB
nbits = [n, n, n + 1];
S = zeros(1, 3);

for i=1:3
    A = radix10ToRB(x1(i), nbits(i) + 1);
    B = radix10ToRB(x2(i), nbits(i) + 1);
    
    fprintf("\nSumming digit #%d exploiting the RB representation...\n", i)

    s = RBSum(A, B);

    S(i) = mod(RBToRadix10(s), m(i));
end

% Showing the resulting sum
fprintf("\nThe sum X1 + X2 in the RNS representation is equal to\n")
fprintf("  S = <%d, %d, %d>\n", S)
