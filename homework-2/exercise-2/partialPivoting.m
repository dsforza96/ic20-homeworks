function [A, xperm] = partialPivoting(A, xperm, k)
% Performs partial pivoting on matrix A at step k. Returns the permuted
% matrix and the relative permutation of the vector of the unknowns.

[~, r] = max(abs(A(k:end, k)));
r = r + k - 1;

if r ~= k
     A([k, r], k:end) = A([r, k], k:end);
end

end