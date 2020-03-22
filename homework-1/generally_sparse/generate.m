function M = generate(n)
% Generates a generally sparse random matrix of size nxn, with sparsity
% equal to 20% and nonzero entries in the interval [1, 100].

I = zeros(n, n);
I(randperm(n * n, n * n * 0.2)) = 1;

R = 1 + 99 * rand(n);
M = I .* R;

% This implementation seems to be slower
% R = sprand(n, n, 0.2);
% R = (1 + 99 * R) .* logical(R);
% M = full(R);

end