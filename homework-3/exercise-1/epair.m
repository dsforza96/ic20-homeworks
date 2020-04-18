function [x, lambda] = epair(A, eps)

n = size(A, 1);

x = ones(n, 1);
lambda0 = 0;
err = inf;

while err >= eps
    x = A * x;
    lambda = norm(x, inf);
    x = x ./ lambda;

    err = abs(lambda - lambda0);
    lambda0 = lambda;
end

end