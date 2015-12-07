function NewData = get_extrem_close_signal(Data, DatePair, Arg)

    % Parse arguments
    IntvBuy  = Arg{1};
    IntvSell = Arg{2};
    Offset   = Arg{end};

    % Pre-processing
    High      = Data(:,3);
    Low       = Data(:,4);
    Close     = Data(:,5);
    BuyPrice  = Data(:,6);
    SellPrice = Data(:,5);

    % References
    TradePrice = Close;
    Max = calc_donchian(High, @max, IntvBuy)
    Min = calc_donchian(Low,  @min, IntvSell)

    % Triggers
    BuyTrigger  = Close > Max;
    SellTrigger = Min > Close;

    % Trading
    [BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice, LongRatio] = ...
        do_trade(BuyPrice, SellPrice, BuyTrigger, SellTrigger, TradePrice, ... 
                 Offset, CutPct, LongStep);

    % Post-processing
    ResData = [BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice, LongRatio];

end
