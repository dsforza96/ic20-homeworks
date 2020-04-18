function [u, lambda] = epair(A, eps)

n = size(A, 1);

x = ones(n, 1);
u = zeros(n, 1);
lambda = 0;
err = inf;

while err >= eps
    u = A * x;
    lambda = max(abs(u));
    u = u ./ lambda;

    err = norm(u - x);
    x = u;
end

end