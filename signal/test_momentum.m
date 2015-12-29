function Profit = test_momentum(BigData, List, Compo, Arg)

    % TotalN: total amount in pool.
    %
    % RemaiN: remaining amout after exchanging.
    %
    % IntvlN: exchange every several days.
    %
    % ShiftN: evaluate percentage with some days ago.
    %
    % CutPct: cut loss threshold.
    %
    % MinPct: minimum percentage allowed to exchange in.
    %
    % Start:  start date.

    % Filter big data with component abbreviations.
    BigData  = BigData(:,:,ismember(List.Abbr, unique(Compo(:,1))));
    Close    = pick_data(BigData, 'CLOSE');
    Buyable  = pick_data(BigData, 'BUYABLE');
    Sellable = pick_data(BigData, 'SELLABLE');

    % Calculate interpolation for continuous.
    InterpPrice = calc_interp_2d(Close);

    % Calculate shift percentage.
    ShiftPct = calc_shift_pct_2d(InterpPrice, Arg.ShiftN);

    % Mask component signal with date.
    CompoSignal = mask_compo_signal(Compo, List.Date);

    % Start from the day components were full.
    StartIdx = find(List.Date >= Arg.Start, 1);

    % Get pool signal from trading.
    PoolSignal = do_exchange(CompoSignal, ShiftPct, Buyable, Sellable, StartIdx, Arg);

    % Calculate daily percentage.
    DailyPct = calc_shift_pct_2d(InterpPrice, 1);

    % Calculate daily profit.
    Profit = calc_daily_profit_2d(DailyPct, PoolSignal, Arg.TotalN);

end
