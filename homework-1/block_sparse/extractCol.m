function col = extractCol(C, k)
% Extracts column k from matrix C given in the MSR format.

col = C.V(C.B == k);

% The following implementation also returns the vector of row indexes I
% and the element (k, k) on the diagonal.
% jk = C.B == k;
% 
% col = C.V(jk);
% 
% ind = find(jk);
% ind = uint32(ind);
% n = find(C.V == -1);
% I = repmat(C.B(1:n)', length(ind), 1);
% I = sum(~(ind < I), 2);
% 
% if C.V(k) ~= 0
%     col = [C.V(k); col];
%     I = [k; I];
% end

end