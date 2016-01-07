function [Up, Dn] = calc_donchian(A, N)

    H  = hankel(1:N, N:N+length(A)-1);
    A  = [nan(N - 1, 1); A];
    Up = max(A(H))';
    Dn = min(A(H))';

end
