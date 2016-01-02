function Duration = mask_date(Date, Start, End, Offset)

    % Mask date according to date pair and offset.

    if nargin == 3

        Offset = 0;

    end

    StartIdx = max(find(Date >= Start, 1) - Offset, 1);
    Duration = (Date >= Date(StartIdx)) & (Date <= End);

end
