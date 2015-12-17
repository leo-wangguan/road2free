function Pct = calc_shift_pct(A, N)

    Pct = A ./ shift(A, N);
    Pct(isinf(Pct)) = 0;
    Pct(isnan(Pct)) = 0;

end
