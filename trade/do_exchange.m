function PoolSignal = do_exchange(CompoSignal, ShiftPct, Buyable, Sellable, StartIdx, Arg)

    % True when stock is in pool.
    PoolSignal = false(size(CompoSignal));

    % Update every several days.
    for i = StartIdx:Arg.IntvlN:size(PoolSignal, 1)

        InRank  = rank_non_zero(ShiftPct(i,:) .* Sellable(i,:) .*  PoolSignal(i,:));
        OutRank = rank_non_zero(ShiftPct(i,:) .* Buyable(i,:)  .* ~PoolSignal(i,:) .* ...
                                CompoSignal(i,:) .* (ShiftPct(i,:) > Arg.MinPct));

        CurrN   = sum(PoolSignal(i,:));
        MustOut = sum(ShiftPct(i,InRank) <= Arg.CutPct);
        ExOut   = min(length(InRank), max(CurrN - Arg.RemaiN, MustOut));
        ExIn    = min(length(OutRank), Arg.TotalN - CurrN + ExOut);

        PoolSignal(i+1:end,InRank(end-ExOut+1:end)) = false;
        PoolSignal(i+1:end,OutRank(1:ExIn))         = true;

    end

end
