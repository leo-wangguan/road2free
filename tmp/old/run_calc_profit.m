clc
close all

clear
load('ASTOCK.mat')


DayIntv = [3200, 3000];

MacdSignal = find_macd_signal(AllClose, DayIntv);
Ma5Signal  = find_ma_signal(AllClose,  5, DayIntv);
Ma10Signal = find_ma_signal(AllClose, 10, DayIntv);
Ma20Signal = find_ma_signal(AllClose, 20, DayIntv);

Signal1 = Ma5Signal;
Signal2 = Ma10Signal;
Signal3 = Ma20Signal;
Signal4 = Ma5Signal .*Ma10Signal;
Signal5 = Ma5Signal .*Ma20Signal;
Signal6 = Ma10Signal.*Ma20Signal;
Signal7 = Ma5Signal .*Ma10Signal.*Ma20Signal;

Signals = [Signal1, Signal2, Signal3, Signal4, Signal5, Signal6, Signal7];
[~, Len] = size(Signals);

for i = 1:Len
    
    Close  = get_data_intv(AllClose, DayIntv);
    Date   = get_data_intv(AllDate,  DayIntv);
    Signal = Signals(:,i);
    test_signal_vs_time(Close, Date, Signal);

end
