function Data = cut_data(Data, Date, Start, End, Offset)

    % Cut data according to date pair and offset.

    if nargin == 4

        Duration = mask_date(Date, Start, End);

    elseif nargin == 5

        Duration = mask_date(Date, Start, End, Offset);

    end

    Data = Data(Duration,:,:);

end
