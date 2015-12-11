function ResData = quant_turtle_close_signal(Data, Arg)

    % Pre-processing
    High      = Data(:,3);
    Low       = Data(:,4);
    Close     = Data(:,5);
    BuyPrice  = Data(:,6);
    SellPrice = Data(:,5);

    % References
    TradePrice = Close;
    Max = calc_donchian(High, @max, Arg.IntvBuy);
    Min = calc_donchian(Low,  @min, Arg.IntvSell);

    % Triggers
    BuyTrigger  = Close > Max;
    SellTrigger = Min > Close;

    % Trading
    [BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice, LongRatio] = ...
        do_trade(BuyPrice, SellPrice, BuyTrigger, SellTrigger, TradePrice, ... 
                 Arg.Offset, Arg.CutPct, Arg.LongStep);

    % Post-processing
    ResData = [BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice, LongRatio];

end
