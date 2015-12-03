function ResData = quant_solo_ma_signal(Data, Arg, LongStep)

    % Buy:
    % close price higher than MA and MA is increasing.
    %
    % Sell:
    % otherwise.

    % Parse arguments
    Avg    = Arg{1};
    Offset = Arg{end};

    % Pre-processing
    Close     = Data(:,5);
    BuyPrice  = Data(:,6);
    SellPrice = Data(:,5);

    % Results
    Len        = size(Data, 1);
    BuySignal  = zeros(Len, 1);
    SellSignal = zeros(Len, 1);
    HoldSignal = zeros(Len, 1);
    LongRatio  = ones(Len, 1);

    % Reference
    Ma = calc_ma(Close, Avg);
    BasePrice = 0;

    for i = Offset+1:Len

        % Criteria
        RefPrice    = Close(i);
        BuyTrigger  = RefPrice >= Ma(i) && Ma(i) > Ma(i-1);
        SellTrigger = ~BuyTrigger;

        [BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice] = ...
            do_trade(BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice, i, ...
                     BuyTrigger, SellTrigger, RefPrice);

       [LongRatio, BasePrice] = ...
           update_long_ratio(LongRatio, LongStep, ...
                             BuyPrice, BasePrice, HoldSignal, i);

    end

    % Post-processing
    ResData = [BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice, LongRatio];

end
