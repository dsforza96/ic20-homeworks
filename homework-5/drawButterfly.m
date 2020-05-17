function drawButterfly(n, S)

N = 2 .^ n;

sizeofstage = N / 2;
nswitch = n * sizeofstage;

straight = sparse(1:nswitch - sizeofstage, sizeofstage + 1:nswitch, ...
                  1, nswitch, nswitch);

A = straight + straight';

labels = de2bi(0:sizeofstage - 1, 'left-msb');

for i=1:n - 1
    lones = find(labels(:, i)) + (i - 1) .* sizeofstage;
    lzeros = find(~labels(:, i)) + (i - 1) .* sizeofstage;

    cross = sparse([lones; lzeros], [lzeros; lones] + sizeofstage, ...
                   1, nswitch, nswitch);

    A = A + cross + cross';
end

[x, y] = meshgrid(1:n, 1:sizeofstage);

figure
p = plot(graph(A));
axis ij

p.XData = x(:);
p.YData = y(:);

p.EdgeColor = 'k';
p.LineWidth = 1;

p.Marker = 's';
p.MarkerSize = 20;

A = sparse(1:sizeofstage * 2, sizeofstage + 1:sizeofstage * 3, ...
           1, sizeofstage * 3, sizeofstage * 3);

A = A + A';

hold on
p = plot(graph(A));

p.XData = [ones(sizeofstage, 1) .* 0.5; ones(sizeofstage, 1); ones(sizeofstage, 1) .* 0.5];
p.YData = repmat((1:sizeofstage)', 3, 1);
p.YData(1:sizeofstage) = p.YData(1:sizeofstage) - 0.1;
p.YData(sizeofstage * 2 + 1:end) = p.YData(sizeofstage * 2 + 1:end) + 0.1;

p = plot(graph(A));

p.XData = n - 1 + [ones(sizeofstage, 1) .* 1.5; ones(sizeofstage, 1); ones(sizeofstage, 1) .* 1.5];
p.YData = repmat((1:sizeofstage)', 3, 1);
p.YData(1:sizeofstage) = p.YData(1:sizeofstage) - 0.1;
p.YData(sizeofstage * 2 + 1:end) = p.YData(sizeofstage * 2 + 1:end) + 0.1;

end