function Signal = find_ma_signal(Data, Avg)
    
    Close = table2array(Data(:,2));
    Ma = get_ma(Close, Avg);
    Signal = Close > Ma;

end

% function Signal = find_ma_signal(AllClose, Avg, DateIntv)
%     
%     Close = get_data_intv(AllClose, DateIntv);
%     Ma = get_ma(Close, Avg);
%     Signal = Close > Ma;
% 
% end