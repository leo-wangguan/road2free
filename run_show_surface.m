[Name, Data] = load_data(8);

DatePair = [20060101, 20151231];

show_surface(Name, Data, DatePair, @get_extrem_signal);
