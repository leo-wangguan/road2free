function Duration = mask_date(Date, Start, End, Offset)

    % Mask date according to date pair and offset.
    %
    % The input arguments are from different data set and may not align,
    % exception handling is considered.

    if nargin == 3

        Offset = 0;

    end

    if Start >= End || sum(Date >= Start) == 0 || sum(Date <= End) == 0

        Duration = false(size(Date));

    else

        StartIdx = max(find(Date >= Start, 1) - Offset, 1);
        Duration = (Date >= Date(StartIdx)) & (Date <= End);

    end

end
