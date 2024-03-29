function x = gaussianEliminationWithPivoting(A, b, pivoting)
% Solves the linear system A * x = b using the Gaussian elimination method
% with the provided pivoting technique.

n = length(b);
A = [A, b];
xperm = 1:n;

for k=1:n - 1
    [A, xperm] = pivoting(A, xperm, k);

    m = A(k + 1:n, k) ./ A(k, k);
    A(k + 1:n, k:end) = A(k + 1:n, k:end) - m * A(k, k:end);
end

% Backward substitution
b = A(:, end);
A = A(:, 1:n);
x = zeros(n, 1);

x(n) = b(n) ./ A(n, n);

for i=n - 1:-1:1
    x(i) = (b(i) - A(i, i + 1:n) * x(i + 1:n)) ./ A(i, i);
end

x(xperm) = x;

end