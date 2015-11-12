function NewData = get_ma_array_signal(Data, DatePair, Arg)

    % Parse arguments
    Avg1 = Arg{1};
    Avg2 = Arg{2};
    Avg3 = Arg{3};

    % Pre-processing
    Offset    = max([Avg1 Avg2 Avg3]) - 1;
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
    [~, Ma1]  = movavg(Close, 1, Avg1);
    [~, Ma2]  = movavg(Close, 1, Avg2);
    [~, Ma3]  = movavg(Close, 1, Avg3);

    for i = Offset+1:Len

        % Criteria
        Buy  = Ma1(i) > Ma2(i) && Ma2(i) > Ma3(i) && ...
               Ma3(i) > Ma3(i-1);
        Sell = ~Buy;

        [BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice] = ...
            do_trade(Buy, Sell, Close(i), BuyPrice, SellPrice, ...
                BuySignal, SellSignal, HoldSignal, i);

    end

    % Post-processing
    NewData = [TrunData, BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice];
    NewData = NewData(Offset+1:end,:);

end
