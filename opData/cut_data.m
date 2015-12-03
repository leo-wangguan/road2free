function BigData = cut_data(BigData, Date, Start, End, Offset)

    % Cut data according to date pair and offset.

    StartIdx = find(Date >= Start, 1) - Offset;
    StartIdx = ifelse(StartIdx < 1, 1, StartIdx);
    EndIdx   = find(Date <= End,   1, 'last');

    BigData = BigData(StartIdx:EndIdx,:,:);

end
