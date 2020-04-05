function [A, xperm] = rookPivoting(A, xperm, k)
% Performs complete pivoting on matrix A at step k. Returns the permuted
% matrix and the relative permutation of the vector of the unknowns.

% This is only a quick implementation I used during testing, so I decided
% not to incude it in the final version of the exercise.

[M1, R] = max(abs(A(k:end, k:end - 1)));
[M2, S] = max(abs(A(k:end, k:end - 1)), [], 2);
i = find(M1 == M2', 1);
r = R(i) + k - 1;
s = S(i) + k - 1;

if r ~= k
     A([k, r], k:end) = A([r, k], k:end);
end

if s ~= k
    A(:, [k, s]) = A(:, [s, k]);
    xperm([k, s]) = xperm([s, k]);
end

end