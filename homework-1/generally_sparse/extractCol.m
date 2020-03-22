function [col, I] = extractCol(C, k)
% Extracts column k from matrix C given in the CSC format. Also returs the
% vector of row indexes I.

jk = C.J(k):C.J(k + 1) - 1;

col = C.A(jk);
I = C.I(jk);

end