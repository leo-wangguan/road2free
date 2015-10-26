[Name, Data] = load_data(10);

DatePair = [20100101, 20151231];

show_plot(Name, Data, DatePair, @get_ma_solo_signal, {20});

show_plot(Name, Data, DatePair, @get_ma_duo_cross_signal, {10,20});

show_plot(Name, Data, DatePair, @get_extrem_close_signal, {20,10});