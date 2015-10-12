function [High, Low, Close, Open] = get_candle(AllHigh, AllLow, AllClose, AllOpen, DayIntv)

    High  = get_data_intv(AllHigh,  DayIntv);
    Low   = get_data_intv(AllLow,   DayIntv);
    Close = get_data_intv(AllClose, DayIntv);
    Open  = get_data_intv(AllOpen,  DayIntv);

end