function NewData = get_extrem_close_signal(Data, DatePair, Arg)

    % Parse arguments
    IntvBuy  = Arg{1};
    IntvSell = Arg{2};

    % Pre-processing
    Offset    = max([IntvBuy IntvSell]);
    TrunData  = truncate_data(Data, DatePair, Offset);
    High      = TrunData(:,3);
    Low       = TrunData(:,4);
    Close     = TrunData(:,5);
    BuyPrice  = TrunData(:,6);
    SellPrice = TrunData(:,5);

    % Signals
    Len        = size(TrunData, 1);
    BuySignal  = zeros(Len, 1);
    SellSignal = zeros(Len, 1);
    HoldSignal = zeros(Len, 1);

    % Reference
    Max = extremum(@max, High, IntvBuy);
    Min = extremum(@min, Low,  IntvSell);

    for i = Offset+1:Len

        % Criteria
        Buy  = Close(i) >= Max(i-1);
        Sell = Close(i) <  Min(i-1);

        [BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice] = ...
            do_trade(Buy, Sell, Close(i), BuyPrice, SellPrice, ...
                BuySignal, SellSignal, HoldSignal, i);

    end

    % Post-processing
    NewData = [TrunData, BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice];
    NewData = NewData(Offset+1:end,:);

end
