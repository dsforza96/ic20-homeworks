function [A, xperm] = naivePivoting(A, xperm, k)
% Avoids divisions by zero in the Gaussian elimination method on matrix A 
% and step k. Simply swaps rows if the pivot is zero. Returns the permuted
% matrix and the relative permutation of the vector of the unknowns.

if A(k, k) == 0
    r = find(A(k + 1:end, k), 1) + k;
    A([k, r], k:end) = A([r, k], k:end);
end

end