function CumPct = calc_cum_pct(StartPrice, HoldSignal, BuyPrice, SellPrice)

    CumPct = cumsum(HoldSignal .* (SellPrice - BuyPrice)) / StartPrice;

end