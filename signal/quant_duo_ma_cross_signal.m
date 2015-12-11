function ResData = quant_duo_ma_cross_signal(Data, Arg)

    % Pre-processing
    Close     = Data(:,5);
    BuyPrice  = Data(:,6);
    SellPrice = Data(:,5);

    % References
    TradePrice = Close;
    MaLong  = calc_ma(Close, Arg.AvgLong);
    MaShort = calc_ma(Close, Arg.AvgShort);

    % Triggers
    BuyTrigger  = (MaShort > MaLong) .* (MaShort > shift(MaShort, 1));
    SellTrigger = ~BuyTrigger;

    % Trading
    [BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice, LongRatio] = ...
        do_trade(BuyPrice, SellPrice, BuyTrigger, SellTrigger, TradePrice, ...
                 Arg.Offset, Arg.CutPct, Arg.LongStep);

    % Post-processing
    ResData = [BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice, LongRatio];

end
