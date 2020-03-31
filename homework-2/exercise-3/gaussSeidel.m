function x = gaussSeidel(A, b)

n = length(b);
x0 = zeros(n, 1);
x = zeros(n, 1);

for k=1:100
   for i=1:n
       [row, jcol] = extractRow(A, i);
       
       x(i) = (b(i) - row(jcol < i) * x(jcol(jcol < i))- row(jcol > i) * x0(jcol(jcol > i))) ./ A.V(i);
   end
   
   x0 = x;
end

end