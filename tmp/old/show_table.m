function show_table(DatePair, AllData, find_signal, Optional)

    AllDate   = table2array(AllData(:,1));
    AllClose  = table2array(AllData(:,2));
    AllBefore = table2array(AllData(:,6));
    
    AllSignal  = find_signal(AllData, Optional);
    AllHolding = find_holding(AllSignal);
    AllProfit  = calc_profit(AllHolding, AllClose, AllBefore);
 
    Duration = zeros(length(AllDate), length(DatePair));
    
    for i = 1:length(DatePair)

        Duration(:,i) = find_date_duration(DatePair(i,1), DatePair(i,2), AllDate);
        
    end

    Profit = AllProfit' * Duration;

    
%     fprintf('************************************************\n')
%     fprintf('%s\t\t%6.0f\n', datestr(Date(1),   'yyyy-mm-dd'), Before(1))
%     fprintf('%s\t\t%6.0f\n', datestr(Date(end), 'yyyy-mm-dd'), Close(end))
%     fprintf('%11d\t\t%6.0f\t%6.0f%%\n', length(Date), Close(end)-Before(1), (Close(end)/Before(1)-1)*100)
%     fprintf('Points\t\t\t%6.0f\t%6.0f%%\n', Points,  (Points/Before(1))*100)
%     fprintf('Win   \t\t\t%6d\t%6.0f%%\n', NumWin,  (NumWin  ./NumTraded)*100)
%     fprintf('Loss  \t\t\t%6d\t%6.0f%%\n', NumLoss, (NumLoss ./NumTraded)*100)
%     fprintf('************************************************\n')


end

