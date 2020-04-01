function x = gaussSeidel(A, b, ground_truth)

n = length(b);

x0 = zeros(n, 1);
x = zeros(n, 1);
err = inf;
k = 0;

while err > 0.01
   for i=1:n
       [row, jcol] = extractRow(A, i);
       jnew = jcol < i;
       jold = ~jnew;
       
       x(i) = (b(i) ...
              - row(jnew) * x(jcol(jnew)) ...
              - row(jold) * x0(jcol(jold))) ...
              ./ A.V(i);
   end

   if exist('ground_truth', 'var')
       err = norm(ground_truth - x);
   else
       err = norm(x0 - x);
   end

   x0 = x;
   k = k + 1;
end

end