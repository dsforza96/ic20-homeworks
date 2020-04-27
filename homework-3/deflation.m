function [x2, lambda2] = deflation(A, x1, lambda1, eps, inverse)
% Returns the second largest eigenvalue lambda2 and the corrisponding
% eigenvector x2 exploiting deflation and then applying the power method.
% If the option 'inverse' is set, computes the second smallest eigenvalue
% and the corrisponding eigenvector instead, using deflation and inverse
% iteration. Converges when |lambda2_k - lambda2_(k-1)| < eps.

if nargin < 5
  inverse = false;
end

[H, ~] = qr(x1);

A_similar = H * A * H;
B = A_similar(2:end, 2:end);
b = A_similar(1, 2:end);

[y2, lambda2] = epair(B, eps, inverse);

gamma = b * y2 ./ (lambda2 - lambda1);
x2 = H * [gamma; y2];

end