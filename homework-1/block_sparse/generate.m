function M = generate(n, k)
% Generates a block sparse random matrix of size nxn, with blocks of size
% kxk, sparsity equal to 20% and nonzero entries in the interval [1, 100].

nb = (n / k) ^ 2;

I = zeros(n / k, n / k);
I(randperm(nb, nb * 0.2)) = 1;
I = repelem(I, k, k);

R = 100 * rand(n);
R(R < 1) = 0;

M = I .* R;

end