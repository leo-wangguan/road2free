function A = shift(A, N)

    if abs(N) >= length(A)

        A = 0 * A;

    elseif N >= 0

        A = [zeros(N, 1); A(1:end-N)];

    else

        A = [A(abs(N)+1:end); zeros(abs(N), 1)];

    end

end
