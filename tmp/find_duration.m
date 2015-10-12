function [Duration, IdxPair] = find_duration(Date, DatePair)

    % Date     = [20150801 20150802 20150803 20150804 20150805 20150806]';
    % DatePair = [20150802 20150805];
    %
    % Duration = [0 1 1 1 1 0]';
    % IdxPair  = [2 5];
    
    Duration = (Date >= DatePair(1)) .* (Date <= DatePair(2));
    IdxPair  = [find(Duration, 1) find(Duration, 1, 'last')];
    
    if isempty(IdxPair)
        
        IdxPair = [0 0];
        
    end
    
end
