function [BuySignal, HoldSignal, BuyPrice] = ...
             do_buy(RefPrice, BuySignal, HoldSignal, BuyPrice, i)

    BuySignal(i)      = true;
    HoldSignal(i:end) = true;
    BuyPrice(i)       = calc_trade_price('BUY', RefPrice);

end