function X = RB2radix10(NR)

X = sum(bi2de(NR));

if X > 2 ^ size(NR, 2) - 1
    error("Overflow: value must not exceed " + (2 ^ size(NR, 2) - 1))
end

end