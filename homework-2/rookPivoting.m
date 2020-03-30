function [A, xperm] = rookPivoting(A, xperm, k)

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