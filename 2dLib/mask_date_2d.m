function DateMask = mask_date_2d(Date, Start, End)

    DateMask = arrayfun(@(x, y) mask_date(Date, x, y), Start, End, 'uni', false);
    DateMask = [DateMask{:}];

end
