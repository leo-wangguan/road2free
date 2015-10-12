function NewData = get_ma_buy_sell_signal(Data, DatePair, Arg)

    % Close price higher/lower than MA, Buy/Sell at the end of the day.
    %
    %
    % Use Before/Close as BuyPrice/SellPrice to calculate the delta.
    % Update BuyPrice(i)/SellPrice if actions happen.
    %
    % Signal change at the same day.

    % Parse arguments
    AvgBuy  = Arg{1};
    AvgSell = Arg{2};

    % Pre-processing
    Offset    = max([AvgBuy AvgSell]) - 1;
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
    [~, MaBuy]  = movavg(Close, 1, AvgBuy);
    [~, MaSell] = movavg(Close, 1, AvgSell);

    for i = Offset+1:Len

        % Criteria
        Buy  = Close(i) >= MaBuy(i);
        Sell = Close(i) <  MaSell(i);

        [BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice] = ...
            do_trade(Buy, Sell, Close(i), BuyPrice, SellPrice, ...
                BuySignal, SellSignal, HoldSignal, i);

    end

    % Post-processing
    NewData = [TrunData, BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice];
    NewData = NewData(Offset+1:end,:);

end
