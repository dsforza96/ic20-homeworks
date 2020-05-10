function S = RBSum(A, B)

Tn = [0 0 1 1
      1 1 0 0
      1 1 0 0
      0 0 1 1];

Tr = [0 0 0 0
      0 0 1 1
      0 0 1 1
      1 1 1 1];

n = max(size(A, 2), size(B, 2));
U = zeros(2, n);
L = zeros(2, n);

U(:, 1:size(A, 2)) = A;
L(:, 1:size(B, 2)) = B;

printRBOperands(U, L);

for k=1:2
    Un = zeros(1, n);
    Ur = U(1, :);

    Ln = zeros(1, n + 1);
    Lr = zeros(1, n);

    for i=1:n
        u = bi2de(U(:, i)') + 1;
        l = bi2de(L(:, i)') + 1;

        Lr(i) = Tn(l, u);
        Ln(i + 1) = Tr(l, u);
    end

    U = [Un; Ur];
    L = [Ln(1:n); Lr];

    printRBOperands(U, L, k < 2);
end

S = L;

end


function printRBOperands(U, L, println)

if nargin < 3
    println = true;
end

n = size(U, 2);

for i=n:-1:1
    fprintf('%d%d ', U(2, i), U(1, i));
end

fprintf('\n');

for i=n:-1:1
    fprintf('%d%d ', L(2, i), L(1, i));
end

fprintf('\n');
    
if println
    fprintf([repelem('-', n * 3 - 1) '\n']);
end

end