function A = shift(A, N)

    if N >= 0
        if length(A) > N
            A = [zeros(N, 1); A(1:end-N)];
        else
            A = zeros(length(A),1);
        end
    else
        if length(A) > abs(N)
            A = [A(abs(N)+1:end); zeros(abs(N), 1)];
        else
            A = zeros(length(A),1);
        end
    end

end
