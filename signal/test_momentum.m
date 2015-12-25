function Profit = test_momentum(BigData, List, Compo, Arg)

    % FullN:  total amount of components.
    %
    % TotalN: total amount in pool.
    %
    % ExchgN: exchange amount per exchange.
    %
    % IntvlN: exchange every several days.
    %
    % ShiftN: evaluate percentage with some days ago.

    % Filter big data with component abbreviations.
    BigData  = BigData(:,:,ismember(List.Abbr, unique(Compo(:,1))));
    Close    = filter_data(BigData, 'CLOSE');
    Buyable  = filter_data(BigData, 'BUYABLE');
    Sellable = filter_data(BigData, 'SELLABLE');

    % Calculate interpolation for continuous.
    InterpPrice = calc_interp_2d(Close);

    % Calculate shift percentage.
    ShiftPct = calc_shift_pct_2d(InterpPrice, Arg.ShiftN);

    % Mask component signal with date.
    CompoSignal = mask_compo_signal(Compo, List.Date);

    % Start from the day components were full.
    StartIdx = find(List.Date >= Arg.Start, 1);

    % Get pool signal from trading.
    PoolSignal = trade(CompoSignal, ShiftPct, Buyable, Sellable, StartIdx, Arg);

    % Calculate daily percentage.
    DailyPct = calc_shift_pct_2d(InterpPrice, 1);

    % Calculate daily profit.
    Profit = calc_daily_profit_2d(DailyPct, PoolSignal) / Arg.TotalN;

end

function PoolSignal = trade(CompoSignal, ShiftPct, Buyable, Sellable, StartIdx, Arg)

    % True when stock is in pool.
    PoolSignal = false(size(CompoSignal));

    % Need a pilot to start.
    Rank = rank_non_zero(ShiftPct(StartIdx,:) .* Buyable(StartIdx,:) .* CompoSignal(StartIdx,:));
    PoolSignal(StartIdx:end,Rank(1:Arg.TotalN)) = true;

    % Update every several days.
    for i = StartIdx+Arg.IntvN:Arg.IntvN:size(PoolSignal, 1)

        % Rank stocks inside and outside pool, separately.
        InRank  = rank_non_zero(ShiftPct(i,:) .* Sellable(i,:) .*  PoolSignal(i,:));
        OutRank = rank_non_zero(ShiftPct(i,:) .* Buyable(i,:)  .* ~PoolSignal(i,:) .* CompoSignal(i,:));

        RealExchgNum = min([Arg.ExchgN, length(InRank), length(OutRank)]);
        PoolSignal(i+1:end,InRank(end-RealExchgNum+1:end)) = false;
        PoolSignal(i+1:end,OutRank(1:RealExchgNum))        = true;

    end

end
