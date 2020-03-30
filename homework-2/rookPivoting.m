function [A, xperm] = rookPivoting(A, xperm, k)

[M, R] = max(abs(A(k:end, k:end - 1)));
s = find(all(M >= A(R, k:end - 1)'), 1);
r = R(s) + k - 1;
s = s + k - 1;

if r ~= k
     A([k, r], k:end) = A([r, k], k:end);
end

if s ~= k
    A(:, [k, s]) = A(:, [s, k]);
    xperm([k, s]) = xperm([s, k]);
end

end