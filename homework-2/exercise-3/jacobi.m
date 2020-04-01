function [x, k] = jacobi(A, b, ground_truth)

n = length(b);

x0 = zeros(n, 1);
x = zeros(n, 1);
err = inf;
k = 0;

while err > 0.01
    for i=1:n
        [row, jcol] = extractRow(A, i);
        x(i) = b(i);

        if ~isempty(row)
            x(i) = x(i) - row * x0(jcol);
        end

        x(i) = x(i) ./ A.V(i);
    end

    if exist('ground_truth', 'var')
        err = norm(ground_truth - x);
    else
        err = norm(x0 - x);
    end

    x0 = x;
    k = k + 1;
end

end