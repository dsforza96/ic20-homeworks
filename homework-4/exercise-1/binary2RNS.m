function [M, x] = binary2RNS(X, n)

m = [2 .^ n - 1, 2 .^ n, 2 .^ n + 1];
M = prod(m);

x = mod(X, m);

end