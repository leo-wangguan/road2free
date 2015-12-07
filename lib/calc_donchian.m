function D = calc_donchian(A, func, Arg)

    Len = length(A);
    D   = zeros(Len, 1);
    Idx = [ones(Arg, 1); (2:Len-Arg+1)'];

    for i = 1:Len

        D(i) = max(A(Idx(i):i));

    end

end
