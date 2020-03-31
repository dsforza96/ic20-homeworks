function [row, J] = extractRow(C, h)
% Extracts row h from matrix C given in the MSR format. Also returs the
% vector of column indexes J.

ih = C.B(h):C.B(h + 1) - 1;

row = C.V(ih)';
J = C.B(ih)';

% if C.V(h) ~= 0
%     row = [C.V(h), row];
%     J = [h, J];
% end

end