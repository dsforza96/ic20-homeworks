function [x, k] = jacobi(A, b, eps, ground_truth)
% Solves the linear system A * x = b using the Jacobi iterative method. If
% the exact solution ground_truth is given, uses the E1 criterion for
% checking the convergence, otherwise the E2 criterion is used. Returns
% the solution x and the number of iteration performed to converge
% (E < eps).
% 
%   E1 = ║ground_truth - x_k║
%   E2 = ║x_k - x_(k-1)║

n = length(b);

x0 = zeros(n, 1);
x = zeros(n, 1);
err = inf;
k = 0;

while err >= eps
    x = b;
    for i=1:n
        [row, jcol] = extractRow(A, i);

        if ~isempty(row)
            x(i) = x(i) - row * x0(jcol);
        end
    end
    x = x ./ A.V(1:n);

    if exist('ground_truth', 'var')
        err = norm(ground_truth - x);
    else
        err = norm(x - x0);
    end

    x0 = x;
    k = k + 1;
end

end