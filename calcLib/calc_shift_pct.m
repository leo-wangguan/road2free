function Pct = calc_shift_pct(InterpA, N)

    Pct = InterpA ./ shift(InterpA, N);
    Pct(isinf(Pct)) = 0;
    Pct(isnan(Pct)) = 0;

end
