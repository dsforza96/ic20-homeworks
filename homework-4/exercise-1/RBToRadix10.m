function X = RBToRadix10(NR)
% Converts the input RB number NR to radix10.

X = sum(bi2de(NR));

% if X > 2 ^ size(NR, 2) - 1
%     error("Overflow: value must not exceed " + (2 ^ size(NR, 2) - 1))
% end

end