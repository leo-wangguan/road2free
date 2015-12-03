function NewData = truncate_data(Data, DatePair, PreLen)

    % Truncate data according to date pair for pre-processing.
    %
    % Data(:,1)    = [20150801 20150802 20150803 20150807 20150808 20150809]';
    % DatePair     = [20150804 20150808];
    % PreLen       = 2;
    %
    % NewData(:,1) = [20150802 20150803 20150807 20150808]';

    IdxPair  = find_date_pair_idx(Data(:,1), DatePair);  
    StartIdx = ifelse(IdxPair(1) - PreLen < 1, 1, IdxPair(1) - PreLen);

    NewData  = Data(StartIdx:IdxPair(2),:);

end