function Pct = calc_yoy_pct(Date, HoldSignal, BuyPrice, SellPrice, LongRatio)

    Year = (1990:year(today))' * 10000;
    Len  = length(Year);
    Pct  = zeros(Len, 2);

    Delta = HoldSignal .* (SellPrice - BuyPrice) .* LongRatio;

    for i = 1:Len

        InYear = mask_date(Date, Year(i) + 0101, Year(i) + 1231);

        if sum(InYear)

            Pct(i,1) = Year(i) / 10000;
            Pct(i,2) = sum(Delta(InYear)) / BuyPrice(find(InYear, 1)) * 100;

        end

    end

end
