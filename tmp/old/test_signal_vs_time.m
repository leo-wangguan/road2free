function test_signal_vs_time(Close, Before, Date, )

    SEPair = find_holding_start_end(Signal);
    Profit = calc_profit_within_start_end(SEPair, Close);

    % Statistics
    NumWin    = sum(Profit >  0);
    NumLoss   = sum(Profit <  0);
    NumTraded = length(Profit);
    Points = round(sum(Profit));
    
    
    
%     fprintf('************************************************\n')
%     fprintf('%s\t\t%6.0f\n', datestr(Date(1),   'yyyy-mm-dd'), Before(1))
%     fprintf('%s\t\t%6.0f\n', datestr(Date(end), 'yyyy-mm-dd'), Close(end))
%     fprintf('%11d\t\t%6.0f\t%6.0f%%\n', length(Date), Close(end)-Before(1), (Close(end)/Before(1)-1)*100)
%     fprintf('Points\t\t\t%6.0f\t%6.0f%%\n', Points,  (Points/Before(1))*100)
%     fprintf('Win   \t\t\t%6d\t%6.0f%%\n', NumWin,  (NumWin  ./NumTraded)*100)
%     fprintf('Loss  \t\t\t%6d\t%6.0f%%\n', NumLoss, (NumLoss ./NumTraded)*100)
%     fprintf('************************************************\n')

end

