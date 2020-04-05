function [A, xperm] = completePivoting(A, xperm, k)
% Performs complete pivoting on matrix A and step k. Returns the permuted
% matrix and the relative permutation of the vector of the unknowns.

[M, R] = max(abs(A(k:end, k:end - 1)));
[~, s] = max(M);
r = R(s) + k - 1;
s = s + k - 1;

if r ~= k
     A([k, r], k:end) = A([r, k], k:end);
end

if s ~= k
    A(:, [k, s]) = A(:, [s, k]);
    xperm([k, s]) = xperm([s, k]);
end

end