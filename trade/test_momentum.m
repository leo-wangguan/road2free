function [Profit, Aval] = test_momentum(BigData, List, Compo, Arg)

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

    InterpPrice = calc_interp_2d(Close);

    ShiftPct = calc_shift_pct_2d(InterpPrice, Arg.ShiftN);

    CompoSignal = mask_compo_signal(Compo, List.Date);

    StartIdx = find(List.Date >= Arg.Start, 1);

    PoolSignal = do_exchange(CompoSignal, ShiftPct, Buyable, Sellable, StartIdx, Arg);

    DailyPct = calc_shift_pct_2d(InterpPrice, 1);

    [Profit, Aval] = calc_daily_profit_2d(DailyPct, PoolSignal, Arg.TotalN);

end
