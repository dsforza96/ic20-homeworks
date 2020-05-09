function S = RBSum(A, B)

N_table = [0 0 1 1
           1 1 0 0
           1 1 0 0
           0 0 1 1];
       
R_table = [0 0 0 0
           0 0 1 1
           0 0 1 1
           1 1 1 1];

n = max(length(A), length(B));

for k=1:2
    UN = zeros(1, n);
    UR = A(1, :);

    LN = zeros(1, n + 1);
    LR = zeros(1, n);

    for i=1:n
        a = bi2de(A(:, i)') + 1;
        b = bi2de(B(:, i)') + 1;

        LR(i) = N_table(b, a);
        LN(i + 1) = R_table(b, a);
    end

    A = [UN; UR];
    B = [LN(1:n); LR];
end

S = B;

end