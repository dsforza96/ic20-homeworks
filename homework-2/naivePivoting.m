function A = naivePivoting(A, k)

if (A(k, k) == 0)
    r = find(A(k + 1:end - 1, k), 1) + k;
    A([k, r], k:end) = A([r, k], k:end);
end

end