function [x, sparsity] = gaussianElimination(A, b)
% Solves the linear system A * x = b using the Gaussian elimination method.
% Returns the solution x and the sparsity of matrix A|b at each iteration.

n = length(b);
A = [A, b];

figure windowstate maximized
spy(A)

sparsity = zeros(n, 1);
sparsity(1) = nnz(A) ./ numel(A);

for k=1:n - 1
    % Pivoting
    if A(k, k) == 0
        r = find(A(k + 1:n, k), 1) + k;
        A([k, r], k:end) = A([r, k], k:end);
    end

    m = A(k + 1:n, k) ./ A(k, k);
    A(k + 1:n, k:end) = A(k + 1:n, k:end) - m * A(k, k:end);

    spy(A)
    drawnow

    sparsity(k + 1) = nnz(A) ./ numel(A);
end

% Backward substitution
b = A(:, end);
A = A(:, 1:n);
x = zeros(n, 1);

x(n) = b(n) ./ A(n, n);

for i=n - 1:-1:1
    x(i) = (b(i) - A(i, i + 1:n) * x(i + 1:n)) ./ A(i, i);
end

end