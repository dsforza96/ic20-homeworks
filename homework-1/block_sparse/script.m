clear all
close all
clc

sizes = [25, 50, 75, 100];
m = 20;  % Number of matrices on which to average results

etimes = zeros(1, length(sizes));
cputimes = zeros(1, length(sizes));
bytes = zeros(1, length(sizes));

for in=1:length(sizes)
    n = sizes(in);

    for im=1:m
        % Generating two block sparse matrices A and B
        A = generate(n, n / 5);
        B = generate(n, n / 5);

        % Producing the compact matrices A_comp and B_comp in the MSR format
        A_comp = toCompact(A);
        B_comp = toCompact(B);

        % Computing the product C_comp = A_comp * B_comp
        tic
        time = cputime;

        V = zeros(n + 1, 1); V(end) = -1;
        B = zeros(n + 1, 1, 'uint32'); B(1) = n + 2;

        for i=1:n
            [x, jx] = extractRow(A_comp, i);
            y = zeros(1, n);

            for j=1:length(jx)
                h = jx(j);
                xcoeff = x(j);
                [row, jh] = extractRow(B_comp, h);

                if ~isempty(row)
                    y(jh) = y(jh) + xcoeff * row;
                end
            end

            V(i) = y(i); y(i) = 0;      % diag
            V = [V; nonzeros(y)];       % A
            B(i + 1) = B(i) + nnz(y);   % I
            B = [B; find(y')];          % J
        end

        C_comp.V = V; C_comp.B = B;

        % Calculating execution time and memory occupation
        etimes(in) = etimes(in) + toc;
        cputimes(in) = cputimes(in) + cputime - time;

        S = whos('-regexp', '._comp');
        for s=S'
            bytes(in) = bytes(in) + s.bytes;
        end
    end
end

etimes = etimes ./ m;
cputimes = cputimes ./ m;
bytes = bytes ./ m;

%% Showing results

figure
subplot(1, 2, 1)
plot(sizes, [etimes; cputimes] .* 1000)  % Converting to milliseconds
axis square

title 'Averaged execution time'
xlabel 'Dimension (# rows)'
ylabel 'Time (ms)'
legend('Elapsed Time', 'CPU Time')

subplot(1, 2, 2)
plot(sizes, bytes ./ 1024)  % Converting to kilobytes
axis square

title 'Averaged memory occupation'
xlabel 'Dimension (# rows)'
ylabel 'Memory occupation (kB)'
