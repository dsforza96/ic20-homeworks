function G = drawButterfly(n)

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

figure
G = plot(graph(A));
axis ij

[x, y] = meshgrid(1:n, 1:sizeofstage);

G.XData = x(:);
G.YData = y(:);

G.EdgeColor = 'k';
G.LineWidth = 1;

G.Marker = 's';
G.MarkerSize = 20;

G.NodeLabel = {};

% A = sparse(1:sizeofstage * 2, sizeofstage + 1:sizeofstage * 3, ...
%            1, sizeofstage * 3, sizeofstage * 3);
% 
% A = A + A';
% 
% hold on
% p = plot(graph(A));
% 
% p.XData = [ones(sizeofstage, 1) .* 0.5; ones(sizeofstage, 1); ones(sizeofstage, 1) .* 0.5];
% p.YData = repmat((1:sizeofstage)', 3, 1);
% p.YData(1:sizeofstage) = p.YData(1:sizeofstage) - 0.1;
% p.YData(sizeofstage * 2 + 1:end) = p.YData(sizeofstage * 2 + 1:end) + 0.1;
% 
% p = plot(graph(A));
% 
% p.XData = n - 1 + [ones(sizeofstage, 1) .* 1.5; ones(sizeofstage, 1); ones(sizeofstage, 1) .* 1.5];
% p.YData = repmat((1:sizeofstage)', 3, 1);
% p.YData(1:sizeofstage) = p.YData(1:sizeofstage) - 0.1;
% p.YData(sizeofstage * 2 + 1:end) = p.YData(sizeofstage * 2 + 1:end) + 0.1;

end