function x = jacobi_vectorized(A, b)

n = length(b);
D_inv = 1 ./ A.V(1:n);

T.B = A.B;
T.V = -1 .* [zeros(n, 1); A.V(n + 1:end)];

for k=1:n
    ik = T.B(k):T.B(k+ 1) - 1;
    T.V(ik) = T.V(ik) .* D_inv(k);
end

c = D_inv .* b;

x0 = zeros(n, 1);
x = zeros(n, 1);

for k=1:100
    x = matrixVectorProd(T, x0) + c;
    x0 = x;
end

end