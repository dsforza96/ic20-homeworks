function x = gaussSeidel_bis(A, b)

n = length(b);
x0 = zeros(n, 1);
x = zeros(n, 1);

for k=1:100
   for i=1:n
       [row, jcol] = extractRow(A, i);
       jnew = jcol < i;
       jold = ~jnew;
        
       x(i) = (b(i) - row(jnew) * x(jcol(jnew))- row(jold) * x0(jcol(jold))) ./ A.V(i);
   end
   
   x0 = x;
end

end