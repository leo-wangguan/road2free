function A = shift(A, N)
    if length(A) > N
        A = [zeros(N, 1); A(1:end-N)];
    else
        A = zeros(length(A),1);
    end
end
