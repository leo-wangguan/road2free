function Dev = calc_mse(A, Intv)

    Len = length(A);
    Dev = zeros(Len, 1);
    Idx = [ones(Intv, 1); (2:Len-Intv+1)'];

    for i = 1:Len

        Dev(i) = mean(A(Idx(i):i)) / Intv;

    end

end

