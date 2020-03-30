function x = gaussianEliminationWithPivoting(A, b, pivoting)

n = length(b);
A = [A, b];
xperm = 1:n;

for k=1:n - 1
    A = pivoting(A, k);

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

end