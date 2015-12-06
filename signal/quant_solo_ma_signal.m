function ResData = quant_solo_ma_signal(Data, Arg, CutPct, LongStep)

    % Parse arguments
    Avg    = Arg{1};
    Offset = Arg{end};

    % Pre-processing
    Close     = Data(:,5);
    BuyPrice  = Data(:,6);
    SellPrice = Data(:,5);

    % References
    TradePrice = Close;
    Ma = calc_ma(Close, Avg);

    % Triggers
    BuyTrigger  = (Close >= Ma) .* (Ma >= shift(Ma, 1));
    SellTrigger = ~BuyTrigger;

    % Trading
    [BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice, LongRatio] = ...
        do_trade(BuyPrice, SellPrice, BuyTrigger, SellTrigger, TradePrice, ... 
                 Offset, CutPct, LongStep);

    % Post-processing
    ResData = [BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice, LongRatio];

end
