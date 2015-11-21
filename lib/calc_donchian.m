function Don = calc_donchian(func, A, Arg)

    Len = length(A);
    Don = zeros(Len, 1);
    Idx = [ones(Arg, 1); (2:Len-Arg+1)'];

    for i = 1:Len

        Don(i) = func(A(Idx(i):i));

    end

end      