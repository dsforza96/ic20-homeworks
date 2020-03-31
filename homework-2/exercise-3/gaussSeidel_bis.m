function x = gaussSeidel_bis(A, b)

n = length(b);
x0 = zeros(n, 1);
x = zeros(n, 1);

for k=1:100
   for i=1:n
       [row, jcol] = extractRow(A, i);
       j = jcol < i;
       jj = ~j;
        
       x(i) = (b(i) - row(j) * x(jcol(j))- row(jj) * x0(jcol(jj))) ./ A.V(i);
   end
   
   x0 = x;
end

end