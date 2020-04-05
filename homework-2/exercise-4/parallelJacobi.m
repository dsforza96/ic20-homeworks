function x = parallelJacobi(A, b, eps)
% Solves the linear system A * x = b using a parallel implementation of
% the Jacobi iterative method. Converges when ║x_k - x_(k-1)║ < eps.

n = length(b);

x0 = zeros(n, 1);
x = zeros(n, 1);
err = inf;
k = 0;

while err >= eps
    x = b;
    parfor i=1:n
        [row, jcol] = extractRow(A, i);

        if ~isempty(row)
            x(i) = x(i) - row * x0(jcol);
        end
    end
    x = x ./ A.V(1:n);

    err = norm(x0 - x);
    x0 = x;
    k = k + 1;
end

end