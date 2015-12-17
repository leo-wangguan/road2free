function P = calc_interp(A)

    % A = [0 0 1 2 0 0 3 4 5 0 0 0 6]';
    %
    % P = [0 0 1 2 2 2 3 4 5 5 5 5 6]';

    Idx = find(A);
    A(Idx(:,2:end)) = A(Idx(:,2:end)) - A(Idx(:,1:end-1));
    P = cumsum(A);

end