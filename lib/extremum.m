function Ext = extremum(func, A, Intv)

    Len = length(A);
    Ext = zeros(Len, 1);
    Idx = [ones(Intv, 1); (2:Len-Intv+1)'];

    for i = 1:Len

        Ext(i) = func(A(Idx(i):i));

    end

end