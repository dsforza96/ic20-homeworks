function [x2, lambda2] = deflation(A, x1, lambda1, eps, inverse)
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



% Householder
% alpha = -sign(u1(1)) .* norm(u1);
% e1 = zeros(n, 1);
% e1(1) = 1;
% 
% v = u1 - alpha .* e1;
% H = eye(n) - 2 .* (v * v') ./ (v' * v);

end