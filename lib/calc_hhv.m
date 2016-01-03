function HHV = calc_hhv(A, N)
    Len = length(A);
    HHV  = zeros(Len, 1);
    if N < Len
        for i = 1:N
        HHV(i) = max(A(1:i));
        end
    
        for i = N+1:Len

            HHV(i) = max(A((i-N+1):i));

        end
    end
    
end