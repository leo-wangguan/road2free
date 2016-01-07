function Pct = calc_yoy_pct(Date, HoldSignal, BuyPrice, SellPrice, LongRatio)

    Delta = HoldSignal .* (SellPrice - BuyPrice) .* LongRatio;
    Pct(:,1) = 1989:2020;
%     Pct(:,1) = round(Date(1) / 1e4):round(Date(end) / 1e4);
    DateMask = mask_date_2d(Date, Pct * 1e4 + 0101, Pct * 1e4 + 1231);
    
    Total = sum(bsxfun(@times, DateMask, Delta));
    First = arrayfun(@(x) find(DateMask(:,x), 1), find(Total ~= 0));
    
    
    Pct(:,2) = arrayfun(@(x) calc_pct(Delta, BuyPrice, DateMask(:,x)), 1:size(DateMask, 2));

end

function Pct = calc_pct(Delta, BuyPrice, DateMask)

%     if sum(Delta(DateMask)) == 0

%         Pct = 0;

%     else

        Pct = sum(Delta(DateMask)) / BuyPrice(find(DateMask, 1));

%     end

end
