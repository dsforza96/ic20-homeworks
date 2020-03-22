function C = toCompact(M)
% Produces the compact representation of a given matrix in the CSC format.

C.A = nonzeros(M);

[C.I, ~] = find(M);
C.I = uint32(C.I);

C.J = sum(logical(M));
C.J = [0; C.J'];
C.J = cumsum(C.J) + 1;
C.J = uint32(C.J);

end