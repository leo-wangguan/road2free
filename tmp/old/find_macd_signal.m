function Signal = find_macd_signal(AllClose, DayIntv)

    [Dif, Dea] = get_macd(AllClose, DayIntv);
    Signal = Dif > Dea;

end