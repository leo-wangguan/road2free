function ResData = quant_duo_ma_cross_signal(Data, Arg, CutPct, LongStep)

    % Parse arguments
    AvgShort = Arg{1};
    AvgLong  = Arg{2};
    Offset   = Arg{end};

    % Pre-processing
    Close     = Data(:,5);
    BuyPrice  = Data(:,6);
    SellPrice = Data(:,5);

    % References
    TradePrice = Close;
    MaLong  = calc_ma(Close, AvgLong);
    MaShort = calc_ma(Close, AvgShort);

    % Triggers
    BuyTrigger  = (MaShort > MaLong) .* (MaShort > shift(MaShort, 1));
    SellTrigger = ~BuyTrigger;

    % Trading
    [BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice, LongRatio] = ...
        do_trade(BuyPrice, SellPrice, BuyTrigger, SellTrigger, TradePrice, ...
                 Offset, CutPct, LongStep);

    % Post-processing
    ResData = [BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice, LongRatio];

end
