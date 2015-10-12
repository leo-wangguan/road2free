function [DatePair, IdxPair] = regulate_date_pair(Date, DatePair)
    
    % Date     = [20150801 20150802 20150805 20150806 20150807 20150808]';
    % DatePair = [20150803 20150808];
    %
    % DatePair = [20150805 20150808];
    % IdxPair  = [3 6];
    
    Duration = (Date >= DatePair(1)) .* (Date <= DatePair(2));
    IdxPair  = [find(Duration, 1) find(Duration, 1, 'last')];
    DatePair = [Date(IdxPair(1)) Date(idxPair(2))];
    
end