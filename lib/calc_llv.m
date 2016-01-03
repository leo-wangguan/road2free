function LLV = calc_llv(A, N)

    Len = length(A);
    LLV  = zeros(Len, 1);
    
    for i = 1:N
        LLV(i) = min(A(1:i));
    end
    
    for i = N+1:Len

        LLV(i) = min(A((i-N+1):i));

    end
    
end