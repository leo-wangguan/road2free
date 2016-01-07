function MA = calc_ma(A, N)

    H  = hankel(1:N, N:N+length(A)-1);
    A  = [zeros(N - 1, 1); A];
    MA = mean(A(H))';

end
