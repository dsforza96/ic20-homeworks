function NR = radix102RB(D, n)

N = de2bi(D, n);
R = zeros(1, n);

NR = [N; R];

end