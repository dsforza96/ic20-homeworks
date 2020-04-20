function [x, lambda] = epair(A, eps, inverse)
% Returns the dominant eigenvalue lambda1 and the corrisponding
% eigenvector x1 obtained via the power method. If the option 'inverse' is
% given, computes the smallest eigenvalue and the corrisponding
% eigenvector instead, using inverse iteration. Converges when
% |lambda_k - lambda_(k-1)| < eps.

if nargin < 3
  inverse = false;
end

x = ones(size(A, 1), 1);
lambda0 = 0;
err = inf;

while err >= eps
    if ~inverse
        x = A * x;
    else
        x = A \ x;
    end

    lambda = norm(x, inf);
    x = x ./ lambda;

    err = abs(lambda - lambda0);
    lambda0 = lambda;
end

if inverse
    lambda = 1 ./ lambda;
end

end