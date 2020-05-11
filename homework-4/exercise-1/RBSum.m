function S = RBSum(A, B)

Tn = [0 0 1 1
      1 1 0 0
      1 1 0 0
      0 0 1 1];

Tr = [0 0 0 0
      0 0 1 1
      0 0 1 1
      1 1 1 1];

n = size(A, 2);

printRBOperands(A, B);

for k=1:2
    Un = zeros(1, n);
    Ur = A(1, :);

    Ln = zeros(1, n + 1);
    Lr = zeros(1, n);

    for i=1:n
        a = bi2de(A(:, i)') + 1;
        b = bi2de(B(:, i)') + 1;

        Lr(i) = Tn(b, a);
        Ln(i + 1) = Tr(b, a);
    end

    if Ln(n + 1) == 1
        error("Overflow: value must not exceed " + (2 .^ n - 1))
    end

    A = [Un; Ur];
    B = [Ln(1:n); Lr];

    printRBOperands(A, B, k < 2);
end

S = B;

end


function printRBOperands(U, L, println)

if nargin < 3
    println = true;
end

n = size(U, 2);

fprintf('  ');

for i=n:-1:1
    fprintf('%d%d ', U(2, i), U(1, i));
end

fprintf('\n  ');

for i=n:-1:1
    fprintf('%d%d ', L(2, i), L(1, i));
end

fprintf('\n');

if println
    fprintf(['  ' repelem('-', n * 3 - 1) '\n']);
end

end