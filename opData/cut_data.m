function BigData = cut_data(BigData, Date, Start, End, Offset)

    % Cut data according to date pair and offset.

    Aux      = find(Date >= Start, 1) - Offset;
    StartIdx = ifelse(Aux < 1, 1, Aux);
    EndIdx   = find(Date <= End,   1, 'last');

    BigData = BigData(StartIdx:EndIdx,:,:);

end
