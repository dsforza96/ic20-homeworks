function [x, k] = gauss_new(A, b, ground_truth)

n = length(b);

x0 = zeros(n, 1);
x = zeros(n, 1);
err = inf;
k = 0;

while err > 0.01
    for i = 1:n
        x(i) = b(i);
        if i == 1
            for j=2:n
                x(i) = x(i) - A(i, j) * x0(j);
            end
        else
            for j=1:i-1
                x(i) = x(i) - A(i, j) * x(j);
            end
            for j=i+1:n
                x(i) = x(i) - A(i, j) * x0(j);
            end
        end
        x(i) = x(i) ./ A(i,i);
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