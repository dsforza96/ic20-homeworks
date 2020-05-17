function drawButterfly(n, S)

N = 2 .^ n;

A = ones(n .* N ./ 2);


[x, y] = meshgrid(1:n, 1:N / 2);

figure
p = plot(graph(A));
axis ij

p.XData = x(:);
p.YData = y(:);

end