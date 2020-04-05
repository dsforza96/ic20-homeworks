function [x, k] = parallelJacobi(A, b, ground_truth)

n = length(b);

x0 = zeros(n, 1);
x = zeros(n, 1);
err = inf;
k = 0;

while err > 0.01
    x = b;
    parfor i=1:n
        [row, jcol] = extractRow(A, i);

        if ~isempty(row)
            x(i) = x(i) - row * x0(jcol);
        end
    end
    x = x ./ A.V(1:n);

    if exist('ground_truth', 'var')
        err = norm(ground_truth - x);
    else
        err = norm(x0 - x);
    end

    x0 = x;
    k = k + 1;
end

end