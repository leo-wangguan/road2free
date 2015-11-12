% [Name, Data] = load_data(8);

Name = '399006';
DatePair = [[20040101, 20041231];
            [20050101, 20051231];
            [20060101, 20061231];
            [20070101, 20071231];
            [20080101, 20081231];
            [20090101, 20091231];
            [20100101, 20101231];
            [20110101, 20111231];
            [20120101, 20121231];
            [20130101, 20131231];
            [20140101, 20141231];
            [20150101, 20151231];
            [20000101, 20151231]];

% show_table(Name, Data, DatePair, @get_ma_buy_sell_signal, {20,10});

% show_table(Name, Data, DatePair, @get_extrem_signal, {20,10});

show_table(Name, Data, DatePair, @get_ma_array_signal, {5,10,20});