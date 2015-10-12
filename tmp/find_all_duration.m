function [Duration, IdxPair] = find_all_duration(Date, DatePair)

    % Date     = [20150801 20150802 20150803 20150804 20150805 20150806]';
    % DatePair = [[20150801 20150803]; 
    %             [20150804 20150806]];
    %
    % Duration = [[1 1 1 0 0 0]' [0 0 0 1 1 1]']
    % IdxPair  = [[1 3]; 
    %             [4 6]]
    
    LenPair = size(DatePair, 1);
    Duration = zeros(length(Date), LenPair);
    IdxPair  = zeros(LenPair, 2);

    for i = 1:LenPair

        [Duration(:,i), IdxPair(i,:)] = find_duration(Date, DatePair(i,:));
              
    end
    
    EmptyIdx = find(~IdxPair(:,1));
    Duration(:,EmptyIdx) = [];
    IdxPair(EmptyIdx,:)  = [];

end