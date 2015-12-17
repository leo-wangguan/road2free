function [WinRate, AvgWinPct, AvgLossPct] = ...
             calc_win_rate(BuySignal, SellSignal, HoldSignal, BuyPrice, SellPrice)

    % Even if not selled at last, mark it as be.
    SellSignal(end) = HoldSignal(end);

    BuyPrice  = BuyPrice(logical(BuySignal));
    SellPrice = SellPrice(logical(SellSignal));

    Pct = SellPrice ./ BuyPrice - 1;

    WinRate    = sum(Pct > 0) / length(Pct) * 100;
    AvgWinPct  = mean(Pct(Pct >  0)) * 100;
    AvgLossPct = mean(Pct(Pct <= 0)) * 100;

end
