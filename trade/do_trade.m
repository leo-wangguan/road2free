function [BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice] = ...
             do_trade(BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice, i, ...
                      BuyTrigger, SellTrigger, RefPrice)

    if BuyTrigger && ~HoldSignal(i)

        BuySignal(i)      = true;
        HoldSignal(i:end) = true;
        BuyPrice(i)       = calc_trade_price('BUY', RefPrice);

    elseif SellTrigger && HoldSignal(i)

        SellSignal(i)       = true;
        HoldSignal(i+1:end) = false;
        SellPrice(i)        = calc_trade_price('SELL', RefPrice);

    end

end
