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
        % Generating two generally sparse matrices A and B
        A = generate(n);
        B = generate(n);

        % Producing the compact matrices A_comp and B_comp in the CSC format
        A_comp = toCompact(A);
        B_comp = toCompact(B);

        % Computing the product C_comp = A_comp * B_comp
        tic
        time = cputime;

        A = []; I = uint32([]);
        J = zeros(n + 1, 1, 'uint32'); J(1) = 1;

        for j=1:n
            [x, ix] = extractCol(B_comp, j);
            y = zeros(n, 1);

            for i=1:length(ix)
                k = ix(i);
                xcoeff = x(i);
                [col, ik] = extractCol(A_comp, k);

                if ~isempty(col)
                    y(ik) = y(ik) + xcoeff * col;
                end
            end

            A = [A; nonzeros(y)];
            I = [I; find(y)];
            J(j + 1) = J(j) + nnz(y);
        end

        C_comp.A = A; C_comp.I = I; C_comp.J = J;
        
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
