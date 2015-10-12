function [BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice] = ...
             do_get_ma_dual_bottom_signal(Close, BuyPrice, SellPrice, ...
                 BuySignal, SellSignal, HoldSignal, Avg1, Avg2, i)

    [~, Ma1] = movavg(Close, 1, Avg1);
    [~, Ma2] = movavg(Close, 1, Avg2);

    if Close(i) >= Ma1(i) && Close(i) >= Ma2(i) || ...
       Close(i) >= Ma1(i) && Close(i) <  Ma2(i) || ...
       Close(i) <  Ma1(i) && Close(i) >= Ma2(i)

        [BuySignal, HoldSignal, BuyPrice] = ...
            do_check_and_buy(Close, BuySignal, SellSignal, HoldSignal, BuyPrice, i);

    elseif Close(i) < Ma1(i) && Close(i) < Ma2(i)

        [SellSignal, HoldSignal, SellPrice] = ...
            do_check_and_sell(Close, BuySignal, SellSignal, HoldSignal, SellPrice, i);

    end

end
