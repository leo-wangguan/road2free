function Idx = find_date_idx(AllDate, Date)

    Idx = find(~(datenum(AllDate) - datenum(Date)));

end

