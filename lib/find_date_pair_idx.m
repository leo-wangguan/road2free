function IdxPair = find_date_pair_idx(Date, DatePair)

    % Find indices of date pair from a date vector.
    %
    % Date     = [20150801 20150802 20150803 20150807 20150808 20150809]';
    % DatePair = [20150804 20150808];
    %
    % IdxPair  = [4 5];

    Duration = (Date >= DatePair(1)) .* (Date <= DatePair(2));
    IdxPair  = [find(Duration, 1) find(Duration, 1, 'last')];
    
    IdxPair  = ifelse(isempty(IdxPair), [0 0], IdxPair);

end
