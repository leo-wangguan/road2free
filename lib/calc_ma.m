function MA = calc_ma(A, Avg)

    H = hankel(1:Avg, Avg:Avg+length(A)-1)';
    A = [zeros(Avg - 1, 1); A];
    MA = mean(A(H), 2);

end
