function show_table(Name, Data, DatePair, func_signal, Arg)

    DatePair   = regulate_date_pair(Data(:,1), DatePair);
    Len        = size(DatePair, 1);

    StartDate  = zeros(Len, 1);
    EndDate    = zeros(Len, 1);
    StartPrice = zeros(Len, 1);
    EndPrice   = zeros(Len, 1);
    HistDelta  = zeros(Len, 1);
    HistPct    = zeros(Len, 1);
    ModelDelta = zeros(Len, 1);
    ModelPct   = zeros(Len, 1);
    Buy        = zeros(Len, 1);
    Sell       = zeros(Len, 1);
    WinRate    = zeros(Len, 1);
    AvgWinPct  = zeros(Len, 1);
    AvgLossPct = zeros(Len, 1);

    for i = 1:Len

        [StartDate(i), EndDate(i), StartPrice(i), EndPrice(i), ...
            HistDelta(i), HistPct(i), ModelDelta(i), ModelPct(i), ...
                Buy(i), Sell(i), WinRate(i), AvgWinPct(i), AvgLossPct(i)] = ...
                    backtest_model(Data, DatePair(i,:), func_signal, Arg);

    end

    StartDate = num2str(StartDate(1:Len));
    EndDate   = num2str(EndDate(1:Len));
    Buy       = num2str(Buy(1:Len));
    Sell      = num2str(Sell(1:Len));

    format bank
    format compact

    disp(Name)
    disp(func2str(func_signal))
    disp(table(StartDate, EndDate, StartPrice, EndPrice, HistDelta, HistPct, ...
               ModelDelta, ModelPct, Buy, Sell, WinRate, AvgWinPct, AvgLossPct))

end
