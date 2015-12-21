function Pct = calc_shift_pct_2d(A, N)

    Pct = arrayfun(@(x) calc_shift_pct(A(:,x), N), 1:size(A, 2), 'uni', false);
    Pct = [Pct{:}];

end
