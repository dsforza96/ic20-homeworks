function x = gaussianElimination(A, b)

n = length(b);
A = [A, b];

for k=1:n - 1
   m = A(k + 1:end, k) ./ A(k, k);
   A(k + 1:end, :) = A(k + 1:end, :) - m * A(k, :);
end

% Backward substitution
b = A(:, end);
A = A(:, 1:end - 1);
x = zeros(n, 1);

x(n) = b(n) ./ A(n, n);

for i=n - 1:-1:1
    x(i) = (b(i) - A(i, i + 1:end) * x(i + 1:end)) ./ A(i, i);
end

end