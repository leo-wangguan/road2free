function [SellSignal, HoldSignal, SellPrice] = ...
             do_sell(RefPrice, SellSignal, HoldSignal, SellPrice, i)

    SellSignal(i)       = true;
    HoldSignal(i+1:end) = false;
    SellPrice(i)        = calc_trade_price('SELL', RefPrice);

end