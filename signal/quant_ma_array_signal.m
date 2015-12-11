function ResData = quant_ma_array_signal(Data, Arg)

    % Pre-processing
    Close     = Data(:,5);
    BuyPrice  = Data(:,6);
    SellPrice = Data(:,5);

    % References
    Ma1 = calc_ma(Close, Arg.Avg1);
    Ma2 = calc_ma(Close, Arg.Avg2);
    Ma3 = calc_ma(Close, Arg.Avg3);

    % Triggers
    BuyTrigger  = (Ma1 > Ma2) .* (Ma2 > Ma3);
    SellTrigger = ~BuyTrigger;
    
    % Trading
    [BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice, LongRatio] = ...
        do_trade(BuyPrice, SellPrice, BuyTrigger, SellTrigger, TradePrice, ...
                 Arg.Offset, Arg.CutPct, Arg.LongStep);

    % Post-processing
    ResData = [BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice, LongRatio];

end
