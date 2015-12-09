function ResData = get_ma_array_signal(Data, Arg, CutPct, LongStep)

    % Parse arguments
    Avg1   = Arg{1};
    Avg2   = Arg{2};
    Avg3   = Arg{3};
    Offset = Arg{end};

    % Pre-processing
    Close     = Data(:,5);
    BuyPrice  = Data(:,6);
    SellPrice = Data(:,5);

    % References
    Ma1 = calc_ma(Close, Avg1);
    Ma2 = calc_ma(Close, Avg2);
    Ma3 = calc_ma(Close, Avg3);

    % Triggers
    BuyTrigger  = Ma1 > Ma2 .* Ma2 > Ma3 .* 
    SellTrigger = ~BuyTrigger;
    
    % Trading
    [BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice, LongRatio] = ...
        do_trade(BuyPrice, SellPrice, BuyTrigger, SellTrigger, TradePrice, ...
                 Offset, CutPct, LongStep);

    % Post-processing
    ResData = [BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice, LongRatio];

end
