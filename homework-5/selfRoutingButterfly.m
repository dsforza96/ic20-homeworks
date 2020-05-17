function [P, S] = selfRoutingButterfly(p)

N = length(p);
n = log2(N);

P = zeros(N, 2 .* n);
P(:, 1) = 1:N;

S = ones(N ./ 2, n) .* 2;
route = de2bi(p - 1, 'left-msb');
nodes = de2bi(0:N ./ 2 - 1, 'left-msb');  %#ok<BDSCA>

for i=1:n
    perm = P(:, i .* 2 - 1);
    setting = route(perm, i);
    
    even = setting(1:2:end);
    odd = setting(2:2:end);
    
    S(:, i) = even;
    
    conflict = even == odd;
    
    if any(conflict)
        S(conflict, i) = 3;
        break
    end
    
    cross = find(even) .* 2;
    
    perm([cross - 1; cross]) = perm([cross; cross - 1]);
    P(:, i .* 2) = perm;
    
    if i < n 
        source = [find(nodes(:, i)) .* 2 - 1; find(~nodes(:, i)) .* 2];
        dest = [find(~nodes(:, i)) .* 2; find(nodes(:, i)) .* 2 - 1];

        perm(source) = perm(dest);
        P(:, i .* 2 + 1) = perm;
    end
end

end