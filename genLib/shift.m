function A = shift(A, N)

    A = [zeros(N, 1); A(1:end-N)];

end
