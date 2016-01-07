function [TotalNum, FloatNum] = mask_cap_num(Date, CapNum)

    DateMask = mask_date_2d(Date, CapNum(:,1), [CapNum(2:end,1) - 1; Date(end)]);

    TotalNum = bsxfun(@times, DateMask, CapNum(:,2)');
    TotalNum = sum(TotalNum, 2);

    FloatNum = bsxfun(@times, DateMask, CapNum(:,3)');
    FloatNum = sum(FloatNum, 2);

end
