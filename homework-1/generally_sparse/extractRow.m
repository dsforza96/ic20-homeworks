function row = extractRow(C, h)
% Extracts row h from matrix C given in the CSC format.

row = C.A(C.I == h)';

% The following implementation also returns the vector of column indexes J.
% ih = C.I == h;
% 
% row = C.A(ih)';
% 
% ind = find(ih);
% ind = uint32(ind');
% J = repmat(C.J, 1, length(ind));
% J = sum(~(ind < J));

end