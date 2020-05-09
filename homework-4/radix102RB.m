function NR = radix102RB(D)

N = de2bi(D);
R = zeros(1, length(N));

NR = [N; R];

end