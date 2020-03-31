function C = toCompact(M)
% Produces the compact representation of a given matrix in the MSR format.

M_ = M - diag(diag(M));

C.V = diag(M);
A = nonzeros(M_');
C.V = [C.V; nan; A];

I = sum(logical(M_), 2);
I = [0; I];
I = cumsum(I) + size(M, 1) + 2;

[J, ~] = find(M_');

C.B = [I; J];
C.B = uint32(C.B);

end