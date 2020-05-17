function [P, S] = selfRoutingButterfly(p)

N = length(p);
n = log2(N);

P = zeros(N, 2 .* n);
S = ones(N ./ 2, n) .* 2;



end