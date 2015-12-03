function [BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice] = ...
             do_trade(BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice, i, ...
                      BuyTrigger, SellTrigger, RefPrice)

    Status = is_bought(BuySignal, SellSignal);

    if BuyTrigger && ~Status

        [BuySignal, HoldSignal, BuyPrice] = ...
            do_buy(BuySignal, HoldSignal, BuyPrice, i, RefPrice);

    elseif SellTrigger && Status

        [SellSignal, HoldSignal, SellPrice] = ...
            do_sell(SellSignal, HoldSignal, SellPrice, i, RefPrice);

    end

end
