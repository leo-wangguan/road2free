function [TotalCap, FloatCap] = mask_cap_num(Date, CapNum)

    End = [CapNum(2:end,1); Date(end) + 1];
    DateMask = cellfun(@(x, y) mask_date(Date, x, y - 1), CapNum(:,1), End, 'uni', false);

    TotalCap = cellfun(@(x, y) x .* y, DateMask, CapNum(:,2), 'uni', false);
    FloatCap = cellfun(@(x, y) x .* y, DateMask, CapNum(:,3), 'uni', false);

    TotalCap = sum([TotalCap{:}], 2);
    FloatCap = sum([FloatCap{:}], 2);

end
