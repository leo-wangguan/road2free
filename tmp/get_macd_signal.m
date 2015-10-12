function Signal = get_macd_signal(Arg)
    
    Close = Arg{1}(:,5);
    
    [Dif, Dea] = macd(Close);
    
    Signal = Dif > Dea;
    Signal(isnan(Signal)) = 0;
    Signal = shift_signal(Signal, 1);

end