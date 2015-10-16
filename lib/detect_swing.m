function Swing = detect_swing(Close, Before, Swing, i)

    Aux = i - 5 + 1;
    Idx = ifelse(Aux < 0, 1, Aux);
    Pct = Close(Idx:i) ./ Before(Idx:i) - 1;

    Swing(i) = abs(mean(Pct)) < 0.01;

end
