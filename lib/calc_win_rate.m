function [WinRate, AvgWinPct, AvgLossPct] = ...
             calc_win_rate(BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice)

    if HoldSignal(end)

        SellSignal(end) = true;

    end

    [~, ~, BuyPrice]  = find(BuyPrice  .* BuySignal);
    [~, ~, SellPrice] = find(SellPrice .* SellSignal);

    Pct = SellPrice ./ BuyPrice - 1;

    WinRate    = sum(Pct > 0) / length(Pct) * 100;
    AvgWinPct  = mean(Pct(Pct >  0)) * 100;
    AvgLossPct = mean(Pct(Pct <= 0)) * 100;

end
