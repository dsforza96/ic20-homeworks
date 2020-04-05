function M = generateDiagonallyDominant(n, sparsity)
% Generates a sparse random matrix of size nxn with the given sparsity.

S = sprand(n, n, sparsity);
S = S - diag(diag(S));

S = S + diag(sum(S, 2)) + diag(rand(n, 1));

M = full(S);

end