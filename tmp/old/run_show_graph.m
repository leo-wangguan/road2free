clear
load('ASTOCK.mat')


DayIntv = [2300, 0];
Avg = [20];


show_candle(AllHigh, AllLow, AllClose, AllOpen, DayIntv)
show_macd(AllClose, DayIntv)
show_ma(AllClose, Avg, DayIntv)