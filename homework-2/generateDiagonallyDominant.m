function M = generateDiagonallyDominant(n, density)

S = sprand(n, n, density);
S = S - diag(diag(S));

S = S + diag(sum(S, 2)) + diag(rand(n, 1));

M = full(S);

end