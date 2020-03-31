function y = matrixVectorProd(A, x)

n = length(x);
y = zeros(n, 1);

for k=1:n
    [row, jcol] = extractRow(A, k);
    
    if ~isempty(row)
        y(k) = y(k) + row * x(jcol);
    end
end

end