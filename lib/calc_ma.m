function MA = calc_ma(A, Avg)

    Len = length(A);
    MA  = zeros(Len, 1);
    Idx = [ones(Avg, 1); (2:Len-Avg+1)'];

    for i = 1:Len

        MA(i) = sum(A(Idx(i):i));

    end

    MA = MA / Avg;

end
