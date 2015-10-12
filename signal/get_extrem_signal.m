function NewData = get_extrem_signal(Data, DatePair, Arg)

    % Price break through Max/Min of the last past days.
    %
    %
    % Use Before/Close as BuyPrice/SellPrice to calculate the delta.
    % Update BuyPrice(i)/SellPrice with Max/Min if actions happen.
    %
    % Signal change at the same day.

    % Parse arguments
    IntvBuy  = Arg{1};
    IntvSell = Arg{2};

    % Pre-processing
    Offset    = max([IntvBuy IntvSell]);
    TrunData  = truncate_data(Data, DatePair, Offset);
    Open      = TrunData(:,2);
    High      = TrunData(:,3);
    Low       = TrunData(:,4);
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

        [BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice] = ...
            do_get_extrem_signal(Open, High, Low, BuyPrice, SellPrice, ...
                BuySignal, SellSignal, HoldSignal, Max, Min, i);

    end

    % Post-processing
    NewData = [TrunData, BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice];
    NewData = NewData(Offset+1:end,:);

end

function [BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice] = ...
             do_get_extrem_signal(Open, High, Low, BuyPrice, SellPrice, ...
                BuySignal, SellSignal, HoldSignal, Max, Min, i)

    % Note: Breakthrough could happen on both directions!

    Status = check_if_bought(BuySignal, SellSignal);

    % Buy, if the open price higher than the Max
    if Open(i) > Max(i-1) && ~Status

        [BuySignal, HoldSignal, BuyPrice] = ...
            do_buy(Open(i), BuySignal, HoldSignal, BuyPrice, i);

        % Sell, if the open price lower than the Min
    elseif Open(i) < Min(i-1) && Status

        [SellSignal, HoldSignal, SellPrice] = ...
            do_sell(Open(i), SellSignal, HoldSignal, SellPrice, i);

        % Buy, if the price in day i ever higher than the Max
    elseif High(i) > Max(i-1) && ~Status

        [BuySignal, HoldSignal, BuyPrice] = ...
            do_buy(Max(i-1), BuySignal, HoldSignal, BuyPrice, i);

        % Sell, if the price in day i ever lower than the Min
    elseif Low(i) < Min(i-1) && Status

        [SellSignal, HoldSignal, SellPrice] = ...
            do_sell(Min(i-1), SellSignal, HoldSignal, SellPrice, i);

    end

end