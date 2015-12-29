function Profit = calc_daily_profit_2d(DailyPct, PoolSignal, Total)

    Aval = 1;
    Profit = zeros(size(PoolSignal));

    % Update everyday from the day trading started.
    for i = find(sum(PoolSignal, 2), 1):size(DailyPct, 1)

        ExOut =  PoolSignal(i-1,:) & ~PoolSignal(i,:);
        ExIn  = ~PoolSignal(i-1,:) &  PoolSignal(i,:);
        Keep  =  PoolSignal(i-1,:) &  PoolSignal(i,:);

        Aval  = Aval + sum(Profit(i-1,ExOut));
        Share = ifelse(Total == sum(Keep), 0, Aval ./ (Total - sum(Keep)));
        Aval  = Aval - sum(ExIn) .* Share;

        Profit(i,ExOut) = 0;
        Profit(i,ExIn)  = DailyPct(i,ExIn) .* Share;
        Profit(i,Keep)  = DailyPct(i,Keep) .* Profit(i-1,Keep);

    end

end
