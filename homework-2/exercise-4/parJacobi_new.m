function [x, k] = parJacobi_new(A, b, ground_truth)

n = length(b);

x0 = zeros(n, 1);
x = zeros(n, 1);
err = inf;
k = 0;

R = cell(n, 1);
for i=1:n
    [row, ~] = extractRow(A, i);
    R(i) = {row};
end

X0 = cell(n, 1);

while err > 0.01
    x = b;
    
    for i=1:n
        [~, col] = extractRow(A, i);
        X0(i) = {x0(col)};
    end
    
    parfor i=1:n
        row = cell2mat(R(i));

        if ~isempty(row)
            x(i) = x(i) - row * cell2mat(X0(i));
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