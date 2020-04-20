function [x, lambda] = epair(A, eps, inverse)
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