function Rank = rank_non_zero(A)

    [B, Rank] = sort(A, 'descend');
    Rank = Rank(B ~= 0);

end