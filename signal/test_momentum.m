function Profit = test_momentum(BigData, List, Compo, Start, TotalN, ExchgN, IntvN, ShiftN, Mode)

    % FullN:  total amount of components.
    %
    % TotalN: total amount in pool.
    %
    % ExchgN: exchange amount per exchange.
    %
    % IntvlN: exchange every several days.
    %
    % ShiftN: evaluate percentage with some days ago.
    %
    % Mode:   top or random.

    % Filter big data with component abbreviations.
    BigData    = BigData(:,:,ismember(List.Abbr, unique(Compo(:,1))));
    Close      = reshape(BigData(:, 5,:), [], size(BigData, 3));
    IsBuyable  = reshape(BigData(:,11,:), [], size(BigData, 3));
    IsSellable = reshape(BigData(:,12,:), [], size(BigData, 3));

    % Calculate interpolation for continuous.
    InterpPrice = calc_interp_2d(Close);

    % Calculate shift percentage.
    ShiftPct = calc_shift_pct_2d(InterpPrice, ShiftN);

    % Mask component signal with date.
    CompoSignal = mask_compo_signal(Compo, List.Date);

    % Start from the day components were full.
    StartIdx = find(List.Date >= Start, 1);

    % Get pool signal from trading.
    PoolSignal = trade(CompoSignal, ShiftPct, IsBuyable, IsSellable, StartIdx, TotalN, ExchgN, IntvN, Mode);

    % Calculate daily percentage.
    DailyPct = calc_shift_pct_2d(InterpPrice, 1);

    % Calculate daily profit.
    Profit = calc_daily_profit_2d(DailyPct, PoolSignal, StartIdx) / TotalN;

end

function PoolSignal = trade(CompoSignal, ShiftPct, IsBuyable, IsSellable, StartIdx, TotalN, ExchgN, IntvN, Mode)

    % True when stock is in pool.
    PoolSignal = false(size(CompoSignal));

    % Need a pilot to start.
    Rank = rank_non_zero(ShiftPct(StartIdx,:) .* IsBuyable(StartIdx,:) .* CompoSignal(StartIdx,:));
    PoolSignal(StartIdx:end,Rank(1:TotalN)) = true;

    % Update every several days.
    for i = StartIdx+IntvN:IntvN:size(CompoSignal, 1)

        % Rank stocks inside and outside pool, separately.
        InRank  = rank_non_zero(ShiftPct(i,:) .* IsSellable(i,:) .*  PoolSignal(i,:));
        OutRank = rank_non_zero(ShiftPct(i,:) .* IsBuyable(i,:)  .* ~PoolSignal(i,:) .* CompoSignal(i,:));

        if strcmp(Mode, 'exchange')

            % Remove un-tradable stocks.
            InRank(~IsSellable(i,InRank))  = [];
            OutRank(~IsBuyable(i,OutRank)) = [];

        end

        RealExchgNum = min([ExchgN, length(InRank), length(OutRank)]);
        PoolSignal(i+1:end,InRank(end-RealExchgNum+1:end)) = false;
        PoolSignal(i+1:end,OutRank(1:RealExchgNum))        = true;

    end

end
