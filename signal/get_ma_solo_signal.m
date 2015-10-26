function NewData = get_ma_solo_signal(Data, DatePair, Arg)

    % Parse arguments
    Avg1 = Arg{1};

    % Pre-processing
    Offset    = Avg1 - 1;
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
    [~, MaBuy]  = movavg(Close, 1, Avg1);

    for i = Offset+1:Len

        % Criteria
        Buy  = Close(i) >= MaBuy(i)  && MaBuy(i) > MaBuy(i-1);
        Sell = ~Buy;

        [BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice] = ...
            do_trade(Buy, Sell, Close(i), BuyPrice, SellPrice, ...
                BuySignal, SellSignal, HoldSignal, i);

    end

    % Post-processing
    NewData = [TrunData, BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice];
    NewData = NewData(Offset+1:end,:);

end
