function DC = calc_donchian(A, func, Intv)
 
    H  = hankel(1:Intv, Intv:Intv+length(A)-1)';
    A  = [zeros(Intv - 1, 1); A];
    DC = func(A(H), [], 2);

end
