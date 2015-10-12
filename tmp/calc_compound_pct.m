function CmpdPct = calc_compound_pct(StartPrice, HoldSignal, BuyPrice, SellPrice)

    CmpdPct = exp(Duration' * (Signal .* log(Pct))) - 1;

end