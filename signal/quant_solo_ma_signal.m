function ResData = quant_solo_ma_signal(Data, Arg)

    % Pre-processing
    Close     = Data(:,5);
    BuyPrice  = Data(:,6);
    SellPrice = Data(:,5);

    % References
    TradePrice = Close;
    Ma = calc_ma(Close, Arg.Avg);

    % Triggers
    BuyTrigger  = (Close >= Ma) .* (Ma >= shift(Ma, 1));
    SellTrigger = ~BuyTrigger;

    % Trading
    [BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice, LongRatio] = ...
        do_trade(BuyPrice, SellPrice, BuyTrigger, SellTrigger, TradePrice, ... 
                 Arg.Offset, Arg.CutPct, Arg.LongStep);

    % Post-processing
    ResData = [BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice, LongRatio];

end
