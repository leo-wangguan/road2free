function Profit = calc_profit_within_start_end(SEPair, Close)
    
    Profit = Close(SEPair(:,2)) - Close(SEPair(:,1)-1);
    
end