function NewDatePair = regulate_date_pair(Date, DatePair)

    % Regulate date pair from a date pair vector.
    %
    % If the start / end date not exists, replace it with the neareast date.
    % If both dates not exist, remove the pair.
    %
    % Date        = [20150801 20150802 20150803 20150804 20150805 20150806]';
    % DatePair    = [[20150713 20150715];
    %                [20150730 20150803];
    %                [20150801 20150808]];
    %
    % NewDatePair = [[20150801 20150803];
    %                [20150801 20150805]];

    Len     = size(DatePair, 1);
    IdxPair = zeros(Len, 2);

    for i = 1:Len

        IdxPair(i,:) = find_date_pair_idx(Date, DatePair(i,:));

    end

    IdxPair(~IdxPair(:,1),:) = [];
    NewDatePair = Date(IdxPair);

end
