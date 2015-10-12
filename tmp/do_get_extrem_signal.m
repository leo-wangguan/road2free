function [BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice] = ...
             do_get_extrem_signal(Open, High, Low, BuyPrice, SellPrice, ...
                BuySignal, SellSignal, HoldSignal, Max, Min, i)

    % Note: Breakthrough could happen on both directions!

    % Buy, if the open price higher than the Max
    if Open(i) > Max(i-1)

        [BuySignal, HoldSignal, BuyPrice] = ...
            do_check_and_buy(Open, BuySignal, SellSignal, HoldSignal, BuyPrice, i);

        % Sell, if the open price lower than the Min
    elseif Open(i) < Min(i-1)

        [SellSignal, HoldSignal, SellPrice] = ...
            do_check_and_sell(Open, BuySignal, SellSignal, HoldSignal, SellPrice, i);

        % Buy, if the price in day i ever higher than the Max
    elseif High(i) > Max(i-1)

        [BuySignal, HoldSignal, BuyPrice] = ...
            do_check_and_buy(High, BuySignal, SellSignal, HoldSignal, BuyPrice, i);

        % Sell, if the price in day i ever lower than the Min
    elseif Low(i) < Min(i-1)

        [SellSignal, HoldSignal, SellPrice] = ...
            do_check_and_sell(Low, BuySignal, SellSignal, HoldSignal, SellPrice, i);

    end

end