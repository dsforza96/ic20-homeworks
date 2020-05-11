function [x, M] = binaryToRNS(X, n)
% Converts the input radix-10 number X to the RNS representation with
% module set <m1 = 2^n -1; m2 = 2^n; m3 = 2^n + 1>. Returns the triple x
% representing the number and dynamic range M.

m = [2 .^ n - 1, 2 .^ n, 2 .^ n + 1];
M = prod(m);

x = mod(X, m);

end