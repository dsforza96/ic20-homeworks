function NR = radix10ToRB(D, n)
% Converts the input radix-10 number D to the corresponding RB
% representation using n normal bits and n redundant bits.

N = de2bi(D, n);
R = zeros(1, n);

NR = [N; R];

end