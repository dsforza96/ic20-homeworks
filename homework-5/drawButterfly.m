function G = drawButterfly(n)

N = 2 ^ n;

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

figure
G = plot(graph(A));
axis ij

[x, y] = meshgrid(1:n, 1:sizeofstage);

G.XData = x(:);
G.YData = y(:);

G.EdgeColor = 'k';
G.LineWidth = 1;

G.Marker = 's';
G.MarkerSize = 18;

G.NodeLabel = {};

% Printing input and output labels
labels = string(dec2bin(0:N - 1));
labels = join(reshape(labels, [2, sizeofstage])', newline);

x = ones(sizeofstage, 1) - 0.05 .* n;
y = 1:sizeofstage;

text(x, y, labels);

x = ones(sizeofstage, 1) .* n + 0.1;

text(x, y, labels);

end