function [A, xperm] = rookPivoting(A, xperm, k)

[M, R] = max(abs(A(k:end, k:end - 1)));
R = R  + k - 1
s = find(all(M' >= abs(A(R, k:end - 1)), 2), 1) + k - 1
r = R(s)

if r ~= k
     A([k, r], k:end) = A([r, k], k:end);
end

if s ~= k
    A(k:end, [k, s]) = A(k:end, [s, k]);
    xperm([k, s]) = xperm([s, k]);
end

end