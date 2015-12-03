function [BuySignal, HoldSignal, BuyPrice] = ...
             do_buy(BuySignal, HoldSignal, BuyPrice, i, RefPrice)

    BuySignal(i)      = true;
    HoldSignal(i:end) = true;
    BuyPrice(i)       = calc_trade_price('BUY', RefPrice);

end
