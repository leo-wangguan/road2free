function Duration = mask_date(Date, Start, End, Offset)

    if nargin == 3

        Duration = (Date >= Start) & (Date <= End);

    elseif nargin == 4

        Aux      = find(Date >= Start, 1) - Offset;
        StartIdx = ifelse(Aux < 1, 1, Aux);
        EndIdx   = find(Date <= End, 1, 'last');
        Duration = logical(Date(StartIdx:EndIdx));

    end

end
