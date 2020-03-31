clear all
close all
clc

n = 100;
A = generateDiagonallyDominant(n, 0.2);
b = ones(n, 1);

A = toCompact(A);

D = A.V(1:n);
c = 1 ./ D .* b;





y = zeros(n, 1);
for k=1:n
    [row, jcol] = extractRow(A, k);

    if ~isempty(row)
        y(k) = y(k) + row * b(jcol);
    end
end