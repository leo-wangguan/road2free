function Pct = calc_yoy_pct(Date,HoldSignal, BuyPrice, SellPrice, LongRatio)

    Year = 10000 * (1990:year(today))';
    Len  = length(Year);
    Pct  = zeros(Len, 1);

    Delta = HoldSignal .* (SellPrice - BuyPrice) .* LongRatio;

    for i = 1:Len

        Duration = (Date >= Year(i) + 0101) .* (Date <= Year(i) + 1231);

        if sum(Duration)

            Pct(i) = sum(Delta .* Duration) / BuyPrice(find(Duration, 1)) * 100;

        end

    end

end
