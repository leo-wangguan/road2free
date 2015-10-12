function [BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice] = ...
             do_trade(Buy, Sell, RefPrice, BuyPrice, SellPrice, ...
                 BuySignal, SellSignal, HoldSignal, i)

    Status = check_if_bought(BuySignal, SellSignal);

    if Buy && ~Status

        [BuySignal, HoldSignal, BuyPrice] = ...
            do_buy(RefPrice, BuySignal, HoldSignal, BuyPrice, i);

    elseif Sell && Status

        [SellSignal, HoldSignal, SellPrice] = ...
            do_sell(RefPrice, SellSignal, HoldSignal, SellPrice, i);

    end

end