function [Up, Dn] = calc_donchian(A, Arg)

    Len = length(A);
    Up  = zeros(Len, 1);
    Dn  = zeros(Len, 1);
    Idx = [ones(Arg, 1); (2:Len-Arg+1)'];

    for i = 1:Len

        Up(i) = max(A(Idx(i):i));
        Dn(i) = min(A(Idx(i):i));

    end

end
