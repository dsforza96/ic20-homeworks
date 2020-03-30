function [A, xperm] = partialPivoting(A, xperm, k)

[~, r] = max(abs(A(k:end, k)));
r = r + k - 1;

if r ~= k
     A([k, r], k:end) = A([r, k], k:end);
end

end