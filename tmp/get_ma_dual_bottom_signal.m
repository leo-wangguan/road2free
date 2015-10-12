function NewData = get_ma_dual_bottom_signal(Data, DatePair, Arg)

    % Close price higher/lower than MA, Buy/Sell at the end of the day.
    %
    %
    % Use Before/Close as BuyPrice/SellPrice to calculate the delta.
    % Change Before(i) to Close(i) if buy action happens.
    %
    % Signal change at the same day.

    % Parse arguments
    Avg1 = Arg{1};
    Avg2 = Arg{2};

    % Pre-processing
    Offset    = max([Avg1 Avg2]) - 1;
    TrunData  = truncate_data(Data, DatePair, Offset);
    Close     = TrunData(:,5);
    BuyPrice  = TrunData(:,6);
    SellPrice = TrunData(:,5);

    % Main algorithm
    Len        = length(Close);
    BuySignal  = zeros(Len, 1);
    SellSignal = zeros(Len, 1);
    HoldSignal = zeros(Len, 1);

    for i = Offset+1:Len

        [BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice] = ...
            do_get_ma_dual_bottom_signal(Close, BuyPrice, SellPrice, ...
                BuySignal, SellSignal, HoldSignal, Avg1, Avg2, i);

    end

    % Post-processing
    NewData = [TrunData, BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice];
    NewData = NewData(Offset+1:end,:);

end
