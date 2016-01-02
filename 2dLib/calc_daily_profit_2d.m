function [Profit, Aval] = calc_daily_profit_2d(DailyPct, PoolSignal, Total)

    Profit = zeros(size(PoolSignal));
    Aval   = ones(size(PoolSignal, 1), 1);

    % Update everyday from the day trading started.
    for i = find(sum(PoolSignal, 2), 1):size(DailyPct, 1)

        ExOut =  PoolSignal(i-1,:) & ~PoolSignal(i,:);
        ExIn  = ~PoolSignal(i-1,:) &  PoolSignal(i,:);
        Keep  =  PoolSignal(i-1,:) &  PoolSignal(i,:);

        Aval(i) = Aval(i-1) + sum(Profit(i-1,ExOut));
        Distr   = ifelse(Total == sum(Keep), 0, Aval(i) ./ (Total - sum(Keep)));
        Aval(i) = Aval(i) - sum(ExIn) .* Distr;

        Profit(i,ExOut) = 0;
        Profit(i,ExIn)  = DailyPct(i,ExIn) .* Distr;
        Profit(i,Keep)  = DailyPct(i,Keep) .* Profit(i-1,Keep);

    end

end
