function MA = calc_ma(A, Arg)

    Len = length(A);
    MA  = zeros(Len, 1);
    Idx = [ones(Arg, 1); (2:Len-Arg+1)'];

    for i = 1:Len

        MA(i) = sum(A(Idx(i):i)) ./ Arg;

    end

end