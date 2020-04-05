function [x, k] = parJacobi_new(A, b, ground_truth)

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

endfunction [x, k] = parJacobi_new(A, b, ground_truth)

n = length(b);

x0 = zeros(n, 1);
x = zeros(n, 1);
err = inf;
k = 0;

while err > 0.01
    parfor i = 1:n
        x(i) = b(i);
        for j= 1:n
            if j ~= i
                x(i) = x(i) - A(i, j) .* x0(j);
            end
        end
        x(i) = x(i) ./ A(i, i);
    end
    
    if 0 %exist('ground_truth', 'var')
        err = norm(ground_truth - x);
    else
        err = norm(x0 - x);
    end
    
    x0 = x;
    k = k + 1;
end

end