function NewData = get_ma_duo_cross_signal(Data, DatePair, Arg)

    % Parse arguments
    Avg1 = Arg{1};
    Avg2 = Arg{2};

    % Pre-processing
    Offset    = max([Avg1 Avg2]) - 1;
    TrunData  = truncate_data(Data, DatePair, Offset);
    Close     = TrunData(:,5);
    BuyPrice  = TrunData(:,6);
    SellPrice = TrunData(:,5);

    % Signals
    Len        = size(TrunData, 1);
    BuySignal  = zeros(Len, 1);
    SellSignal = zeros(Len, 1);
    HoldSignal = zeros(Len, 1);

    % Reference
    [~, Ma1] = movavg(Close, 1, Avg1);
    [~, Ma2] = movavg(Close, 1, Avg2);

    for i = Offset+1:Len

        % Criteria
        Buy  = Ma1(i) > Ma2(i);
        Sell = ~Buy;

        [BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice] = ...
            do_trade(Buy, Sell, Close(i), BuyPrice, SellPrice, ...
                BuySignal, SellSignal, HoldSignal, i);

    end

    % Post-processing
    NewData = [TrunData, BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice];
    NewData = NewData(Offset+1:end,:);

end
