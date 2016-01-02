function Data = cut_data(Data, Date, Start, End, Offset)

    % Cut data according to date pair and offset.

    if nargin == 4

        Offset = 0;

    end

    Duration = mask_date(Date, Start, End, Offset);
    Data = Data(Duration,:,:);

end
