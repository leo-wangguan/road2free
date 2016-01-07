function [TotalNum, FloatNum] = mask_cap_num(Date, CapNum)

    DateMask = mask_date_2d(Date, CapNum(:,1), [CapNum(2:end,1) - 1; Date(end)]);
    TotalNum = DateMask * CapNum(:,2);    
    FloatNum = DateMask * CapNum(:,3);

end
