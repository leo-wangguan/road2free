function Result = get_nonzero_val(Data, Index, offset)
    CutData = Data(1:Index);
    NonZeroData = CutData(CutData>0);
    if CutData(Index) >0
        if length(NonZeroData) > abs(offset)
            Result = NonZeroData(end + offset);
        else
            Result = 0;
        end
    else
        if (length(NonZeroData) + 1) > abs(offset)
            Result = NonZeroData(end + 1 + offset);
        else
            Result = 0;
        end
    end
end