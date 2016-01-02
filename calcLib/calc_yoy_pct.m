function Pct = calc_yoy_pct(Date, HoldSignal, BuyPrice, SellPrice, LongRatio)

    Delta = HoldSignal .* (SellPrice - BuyPrice) .* LongRatio;

    Pct(:,1) = num2cell((round(Date(1) / 1e4):round(Date(end) / 1e4))');
    DateMask = cellfun(@(x) mask_date(Date, x * 1e4 + 0101, x * 1e4 + 1231), Pct, 'uni', false);
    Pct(:,2) = cellfun(@(x) sum(Delta(x)) / BuyPrice(find(x, 1)) * 100, DateMask, 'uni', false);

end
