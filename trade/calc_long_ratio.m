function LongRatio = calc_long_ratio(HoldSignal, BuyPrice, LongStep)

    LongRatio = zeros(length(HoldSignal), 1);
    [StartIdx, EndIdx] = find_seg_bounds(HoldSignal);

    for i = 1:length(StartIdx)
        
        Intv = StartIdx(i):EndIdx(i);
        Pct  = BuyPrice(Intv) ./ BuyPrice(StartIdx(i));
        
%         LongRatio(Intv) = 
        
    end
    
    
    
    
end
