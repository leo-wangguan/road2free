function Profit = calc_daily_profit_2d(DailyPct, PoolSignal)

    Profit = zeros(size(PoolSignal));
    StartIdx = find(sum(PoolSignal, 2),1);
    Profit(StartIdx,:) = PoolSignal(StartIdx,:) * 1;

    for i = StartIdx+1:size(DailyPct, 1)

        Keep  = Profit(i-1,:) >  0 &  PoolSignal(i,:);
        ExIn  = Profit(i-1,:) == 0 &  PoolSignal(i,:);
        ExOut = Profit(i-1,:) >  0 & ~PoolSignal(i,:);

        Profit(i,Keep)  = DailyPct(i,Keep) .* Profit(i-1,Keep);
        Profit(i,ExIn)  = DailyPct(i,ExIn) .* mean(Profit(i-1,ExOut));
        Profit(i,ExOut) = 0;

    end

    Profit = sum(Profit, 2);

end
