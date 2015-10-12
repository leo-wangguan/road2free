function [BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice] = ...
             do_get_ma_buy_sell_signal(Close, BuyPrice, SellPrice, ...
                 BuySignal, SellSignal, HoldSignal, AvgBuy, AvgSell, i)

    [~, MaBuy]  = movavg(Close, 1, AvgBuy);
    [~, MaSell] = movavg(Close, 1, AvgSell);

    if Close(i) >= MaBuy(i)

        [BuySignal, HoldSignal, BuyPrice] = ...
            do_check_and_buy(Close, BuySignal, SellSignal, HoldSignal, BuyPrice, i);

    elseif Close(i) < MaSell(i)

        [SellSignal, HoldSignal, SellPrice] = ...
            do_check_and_sell(Close, BuySignal, SellSignal, HoldSignal, SellPrice, i);

    end

end
