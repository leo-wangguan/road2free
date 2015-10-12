[Name, Data] = load_data(4);

DatePair = [20140101, 20150831];

% Data = downsample_data(Data, 5);

show_plot(Name, Data, DatePair, @get_ma_buy_sell_signal, {20,20});

% show_plot(Name, Data, DatePair, @get_extrem_signal, {20,10});