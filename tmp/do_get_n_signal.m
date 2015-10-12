function [BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice] = ...
             do_get_n_signal(N, Close, BuyPrice, SellPrice, ...
                 BuySignal, SellSignal, HoldSignal, i)

    if N(i) >= N(i-1)

        [BuySignal, HoldSignal, BuyPrice] = ...
            do_check_and_buy(Close, BuySignal, SellSignal, HoldSignal, BuyPrice, i);

    elseif N(i) < N(i-1)

        [SellSignal, HoldSignal, SellPrice] = ...
            do_check_and_sell(Close, BuySignal, SellSignal, HoldSignal, SellPrice, i);

    end

end